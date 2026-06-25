import argparse
import json
import re
import os
from utils_cplus2asp import run_cplus2asp, getMaxAdditive

parser = argparse.ArgumentParser()
parser.add_argument('--output_dir', type=str, required=True, help='Path to model output dir, e.g. gpt-5.2_outputs/blocksworld_incorrect20')
parser.add_argument('--timeout', type=int, default=300)
parser.add_argument('--task', type=int, help='Run a single task by index (1-based)')
args = parser.parse_args()

outputs_path = os.path.join(args.output_dir, 'outputs')

bc_prog_file = os.path.join(outputs_path, '100 BC Program.txt')
task_gen_file = os.path.join(outputs_path, '0 Task Query Generation OUTPUT.txt')

with open(bc_prog_file) as f:
    bc_prog = f.read()

lines = bc_prog.split('\n')
query_start = None
for i, line in enumerate(lines):
    if ':- query' in line:
        query_start = i
        break

prog_wo_query = '\n'.join(lines[:query_start]).rstrip()
# Remove trailing noconcurrency since planner_wsl adds its own
if prog_wo_query.endswith('noconcurrency.'):
    prog_wo_query = prog_wo_query[:-len('noconcurrency.')].rstrip()

main_query = '\n'.join(lines[query_start:])

with open(task_gen_file) as f:
    task_output = f.read()

json_match = re.search(r'```json?\s*(.*?)\s*```', task_output, re.DOTALL)
json_str = json_match.group(1) if json_match else task_output
task_blocks_bc = json.loads(json_str)

theory_lines = prog_wo_query.split('\n')
obj_start, next_section = None, None
for i, line in enumerate(theory_lines):
    if ':- objects' in line and obj_start is None:
        obj_start = i
    elif obj_start is not None and line.strip().startswith(':-') and ':- objects' not in line:
        next_section = i
        break

if obj_start is not None and next_section is not None:
    theory_before = '\n'.join(theory_lines[:obj_start])
    theory_after = '\n'.join(theory_lines[next_section:])
else:
    theory_before = prog_wo_query
    theory_after = ''

maxAdditive_eval = getMaxAdditive(prog_wo_query)

if args.task:
    tasks_to_run = [(args.task - 1, task_blocks_bc[args.task - 1])]

    for task_idx, task in tasks_to_run:
        task_objects = task['objects']
        task_query = task['query']
        task_theory = theory_before + '\n' + task_objects + '\n\n' + theory_after

        print(f'\n{"="*60}')
        print(f'Task {task_idx + 1}')
        print(f'{"="*60}')
        print(f'Objects: {task_objects}')
        print(f'Query: {task_query}')
        print()

        output_status, outs_processed, errs, prog_num = run_cplus2asp(
            task_query, task_theory,
            maxAdditive=maxAdditive_eval,
            timeout=args.timeout,
            concurrency=False,
            incremental_mode=True,
            slot=task_idx
        )

        print(f'Status: {output_status}')
        if outs_processed.strip():
            print(f'Output: {outs_processed}')
        if errs.strip():
            print(f'Errors: {errs}')
else:
    from concurrent.futures import ThreadPoolExecutor

    def run_task(task_idx, task):
        task_objects = task['objects']
        task_query = task['query']
        task_theory = theory_before + '\n' + task_objects + '\n\n' + theory_after

        output_status, outs_processed, errs, prog_num = run_cplus2asp(
            task_query, task_theory,
            maxAdditive=maxAdditive_eval,
            timeout=args.timeout,
            concurrency=False,
            incremental_mode=True,
            slot=task_idx
        )

        print(f'Task {task_idx + 1}: {output_status}')
        if errs.strip():
            print(f'  Errors: {errs}')
        return (task_idx + 1, output_status, outs_processed, errs)

    with ThreadPoolExecutor(max_workers=len(task_blocks_bc)) as pool:
        futures = [pool.submit(run_task, task_idx, task) for task_idx, task in enumerate(task_blocks_bc)]
        results = [f.result() for f in futures]

    results.sort()
    print(f'\n{"="*60}')
    print('Summary:')
    for idx, status, _, _ in results:
        print(f'  Task {idx}: {status}')

print(f'\n{"="*60}')
print('Done.')
