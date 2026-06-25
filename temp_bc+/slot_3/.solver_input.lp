#base.

% -------------------------------------------------------------------------
% preamble ----------------------------------------------------------------
% -------------------------------------------------------------------------


% -------------------------------------------------------------------------
% main body ---------------------------------------------------------------
% -------------------------------------------------------------------------


% Sort Declarations ---------------------------------------------------

#hide s_loc/1.
s_loc(VAR) :- s_block(VAR).
#hide s_block/1.

% ---------------------------------------------------------------------



% Object Declarations -------------------------------------------------

s_block(o_b1) :- true.
s_block(o_b2) :- true.
s_block(o_b3) :- true.
s_block(o_b4) :- true.
s_loc(o_table) :- true.

% ---------------------------------------------------------------------



% Variable Declarations -----------------------------------------------

#domain s_block(V_B).
#domain s_block(V_B1).
#domain s_block(V_B2).
#domain s_block(V_B3).
#domain s_block(V_B4).
#domain s_block(V_B5).
#domain s_block(V_B6).
#domain s_block(V_B7).
#domain s_loc(V_L).
#domain s_loc(V_L1).
#domain s_loc(V_L2).
#domain s_loc(V_L3).
#domain s_loc(V_L4).

% ---------------------------------------------------------------------



% Constant Declarations -----------------------------------------------

s_boolean(o_true) :- true.
s_boolean(o_false) :- true.
#hide s_boolean/1.
#domain s_block(GVAR_block_1).
#domain s_block(GVAR_block_2).
#cumulative t.
 :- not 1{c_a_1_pickupBlock(GVAR_block_2,LVAR_boolean_1,t-1):s_boolean(LVAR_boolean_1)}1.
#domain s_boolean(GVAR_boolean_1).
{c_a_1_pickupBlock(GVAR_block_1,GVAR_boolean_1,t-1)} :- true.
 :- c_a_1_pickupBlock(GVAR_block_1,VAR,t-1),not s_boolean(VAR).
 :- not 1{c_a_1_putdownBlock(GVAR_block_2,LVAR_boolean_1,t-1):s_boolean(LVAR_boolean_1)}1.
{c_a_1_putdownBlock(GVAR_block_1,GVAR_boolean_1,t-1)} :- true.
 :- c_a_1_putdownBlock(GVAR_block_1,VAR,t-1),not s_boolean(VAR).
#domain s_block(GVAR_block_3).
#domain s_block(GVAR_block_4).
 :- not 1{c_a_2_stackBlock(GVAR_block_3,GVAR_block_4,LVAR_boolean_1,t-1):s_boolean(LVAR_boolean_1)}1.
{c_a_2_stackBlock(GVAR_block_1,GVAR_block_2,GVAR_boolean_1,t-1)} :- true.
 :- c_a_2_stackBlock(GVAR_block_1,GVAR_block_2,VAR,t-1),not s_boolean(VAR).
 :- not 1{c_a_2_unstackBlock(GVAR_block_3,GVAR_block_4,LVAR_boolean_1,t-1):s_boolean(LVAR_boolean_1)}1.
{c_a_2_unstackBlock(GVAR_block_1,GVAR_block_2,GVAR_boolean_1,t-1)} :- true.
 :- c_a_2_unstackBlock(GVAR_block_1,GVAR_block_2,VAR,t-1),not s_boolean(VAR).
#base.
 :- not 1{c_f_1_on(GVAR_block_2,LVAR_loc_1,0):s_loc(LVAR_loc_1)}1.
#cumulative t.
 :- not 1{c_f_1_on(GVAR_block_1,LVAR_loc_1,t):s_loc(LVAR_loc_1)}1.
#domain s_loc(GVAR_loc_1).
{c_f_1_on(GVAR_block_1,GVAR_loc_1,t)} :- c_f_1_on(GVAR_block_1,GVAR_loc_1,t-1).
#base.
{c_f_1_on(GVAR_block_1,GVAR_loc_1,0)} :- true.
 :- c_f_1_on(GVAR_block_1,VAR,0),not s_loc(VAR).
#cumulative t.
 :- c_f_1_on(GVAR_block_1,VAR,t),not s_loc(VAR).
#base.
 :- not 1{c_f_1_clear(GVAR_block_2,LVAR_boolean_1,0):s_boolean(LVAR_boolean_1)}1.
#cumulative t.
 :- not 1{c_f_1_clear(GVAR_block_1,LVAR_boolean_1,t):s_boolean(LVAR_boolean_1)}1.
{c_f_1_clear(GVAR_block_1,GVAR_boolean_1,t)} :- c_f_1_clear(GVAR_block_1,GVAR_boolean_1,t-1).
#base.
{c_f_1_clear(GVAR_block_1,GVAR_boolean_1,0)} :- true.
 :- c_f_1_clear(GVAR_block_1,VAR,0),not s_boolean(VAR).
#cumulative t.
 :- c_f_1_clear(GVAR_block_1,VAR,t),not s_boolean(VAR).
#base.
 :- not 1{c_f_1_holding(GVAR_block_2,LVAR_boolean_1,0):s_boolean(LVAR_boolean_1)}1.
#cumulative t.
 :- not 1{c_f_1_holding(GVAR_block_1,LVAR_boolean_1,t):s_boolean(LVAR_boolean_1)}1.
{c_f_1_holding(GVAR_block_1,GVAR_boolean_1,t)} :- c_f_1_holding(GVAR_block_1,GVAR_boolean_1,t-1).
#base.
{c_f_1_holding(GVAR_block_1,GVAR_boolean_1,0)} :- true.
 :- c_f_1_holding(GVAR_block_1,VAR,0),not s_boolean(VAR).
#cumulative t.
 :- c_f_1_holding(GVAR_block_1,VAR,t),not s_boolean(VAR).
#base.
 :- not 1{c_f_0_handEmpty(LVAR_boolean_1,0):s_boolean(LVAR_boolean_1)}1.
#cumulative t.
 :- not 1{c_f_0_handEmpty(LVAR_boolean_1,t):s_boolean(LVAR_boolean_1)}1.
{c_f_0_handEmpty(GVAR_boolean_1,t)} :- c_f_0_handEmpty(GVAR_boolean_1,t-1).
#base.
{c_f_0_handEmpty(GVAR_boolean_1,0)} :- true.
 :- c_f_0_handEmpty(VAR,0),not s_boolean(VAR).
#cumulative t.
 :- c_f_0_handEmpty(VAR,t),not s_boolean(VAR).
#base.

% ---------------------------------------------------------------------


% on/1 is a fluent whose values are locations (table or another block)
% Generated constraints
% 1 A block cannot be on two different locs at the same time

 :- c_f_1_on(V_B,V_L1,0),c_f_1_on(V_B,V_L2,0),V_L1!=V_L2.
#cumulative t.
 :- c_f_1_on(V_B,V_L1,t),c_f_1_on(V_B,V_L2,t),V_L1!=V_L2.

% 2 Two different blocks cannot be on the same block at the same time

#base.
 :- c_f_1_on(V_B1,V_B,0),c_f_1_on(V_B2,V_B,0),V_B1!=V_B2.
#cumulative t.
 :- c_f_1_on(V_B1,V_B,t),c_f_1_on(V_B2,V_B,t),V_B1!=V_B2.

% 3 If a block is holding, then it is not on any loc

#base.
 :- c_f_1_holding(V_B,o_true,0),c_f_1_on(V_B,V_L,0).
#cumulative t.
 :- c_f_1_holding(V_B,o_true,t),c_f_1_on(V_B,V_L,t).

% 4 If a block is on some block, then it is not on the table

#base.
 :- c_f_1_on(V_B,V_B1,0),c_f_1_on(V_B,o_table,0).
#cumulative t.
 :- c_f_1_on(V_B,V_B1,t),c_f_1_on(V_B,o_table,t).

% 5 If a block is on the table, then it is not on any block

#base.
 :- c_f_1_on(V_B,o_table,0),c_f_1_on(V_B,V_B1,0).
#cumulative t.
 :- c_f_1_on(V_B,o_table,t),c_f_1_on(V_B,V_B1,t).

% 6 If a block is holding, then the hand is not empty

#base.
 :- c_f_1_holding(V_B,o_true,0),c_f_0_handEmpty(o_true,0).
#cumulative t.
 :- c_f_1_holding(V_B,o_true,t),c_f_0_handEmpty(o_true,t).

% 7 If the hand is empty, then no block is holding

#base.
 :- c_f_0_handEmpty(o_true,0),c_f_1_holding(V_B,o_true,0).
#cumulative t.
 :- c_f_0_handEmpty(o_true,t),c_f_1_holding(V_B,o_true,t).

% 8 At most one block can be holding at a time

#base.
 :- c_f_1_holding(V_B1,o_true,0),c_f_1_holding(V_B2,o_true,0),V_B1!=V_B2.
#cumulative t.
 :- c_f_1_holding(V_B1,o_true,t),c_f_1_holding(V_B2,o_true,t),V_B1!=V_B2.

% 9 If a block has another block on it, then it is not clear

#base.
 :- c_f_1_on(V_B1,V_B2,0),c_f_1_clear(V_B2,o_true,0).
#cumulative t.
 :- c_f_1_on(V_B1,V_B2,t),c_f_1_clear(V_B2,o_true,t).

% 10 If a block is holding, then it is not clear

#base.
 :- c_f_1_holding(V_B,o_true,0),c_f_1_clear(V_B,o_true,0).
#cumulative t.
 :- c_f_1_holding(V_B,o_true,t),c_f_1_clear(V_B,o_true,t).

% Additional state constraint needed because we use on(B)=B as a "not on anything" marker
% Forbid self-support in all states unless the block is holding

#base.
 :- c_f_1_holding(V_B,o_false,0),c_f_1_on(V_B,V_B,0).
#cumulative t.
 :- c_f_1_holding(V_B,o_false,t),c_f_1_on(V_B,V_B,t).

% Action effects and executability conditions (fixed)
% pickup: requires clear(B), on(B)=table, handEmpty
% Effects: holding(B), ~handEmpty, and remove it from its support by setting on(B)=B

c_f_1_holding(V_B,o_true,t) :- c_a_1_pickupBlock(V_B,o_true,t-1).

c_f_0_handEmpty(o_false,t) :- c_a_1_pickupBlock(V_B,o_true,t-1).

c_f_1_on(V_B,V_B,t) :- c_a_1_pickupBlock(V_B,o_true,t-1).

c_f_1_clear(V_B,o_false,t) :- c_a_1_pickupBlock(V_B,o_true,t-1).

 :- c_a_1_pickupBlock(V_B,o_true,t-1),c_f_1_clear(V_B,o_false,t-1).

 :- c_a_1_pickupBlock(V_B,o_true,t-1),GVAR_loc_1!=o_table,c_f_1_on(V_B,GVAR_loc_1,t-1).

 :- c_a_1_pickupBlock(V_B,o_true,t-1),c_f_0_handEmpty(o_false,t-1).

% putdown: requires holding(B)
% Effects: ~holding, on table, clear, handEmpty

c_f_1_holding(V_B,o_false,t) :- c_a_1_putdownBlock(V_B,o_true,t-1).

c_f_1_on(V_B,o_table,t) :- c_a_1_putdownBlock(V_B,o_true,t-1).

c_f_1_clear(V_B,o_true,t) :- c_a_1_putdownBlock(V_B,o_true,t-1).

c_f_0_handEmpty(o_true,t) :- c_a_1_putdownBlock(V_B,o_true,t-1).

 :- c_a_1_putdownBlock(V_B,o_true,t-1),c_f_1_holding(V_B,o_false,t-1).

% stack: requires holding(B1) and clear(B2) and B1\=B2
% Effects: on(B1)=B2, ~holding(B1), clear(B1), ~clear(B2), handEmpty

c_f_1_on(V_B1,V_B2,t) :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1).

c_f_1_holding(V_B1,o_false,t) :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1).

c_f_1_clear(V_B1,o_true,t) :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1).

c_f_1_clear(V_B2,o_false,t) :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1).

c_f_0_handEmpty(o_true,t) :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1).

 :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1),c_f_1_holding(V_B1,o_false,t-1).

 :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1),c_f_1_clear(V_B2,o_false,t-1).

 :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1),V_B1==V_B2.

% unstack: requires on(B1)=B2, clear(B1), handEmpty, and B1\=B2
% Effects: holding(B1), clear(B2), ~handEmpty, and remove support by setting on(B1)=B1

c_f_1_holding(V_B1,o_true,t) :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1).

c_f_1_clear(V_B2,o_true,t) :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1).

c_f_0_handEmpty(o_false,t) :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1).

c_f_1_on(V_B1,V_B1,t) :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1).

c_f_1_clear(V_B1,o_false,t) :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1).

 :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1),GVAR_loc_1!=V_B2,c_f_1_on(V_B1,GVAR_loc_1,t-1).

 :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1),c_f_1_clear(V_B1,o_false,t-1).

 :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1),c_f_0_handEmpty(o_false,t-1).

 :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1),V_B1==V_B2.

% Concurrency constraints (kept)

 :- c_a_1_pickupBlock(V_B1,o_true,t-1),c_a_1_pickupBlock(V_B2,o_true,t-1),V_B1!=V_B2.

 :- c_a_1_putdownBlock(V_B1,o_true,t-1),c_a_1_putdownBlock(V_B2,o_true,t-1),V_B1!=V_B2.

 :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1),c_a_2_stackBlock(V_B3,V_B4,o_true,t-1),V_B1!=V_B3.

 :- c_a_2_unstackBlock(V_B1,V_B2,o_true,t-1),c_a_2_unstackBlock(V_B3,V_B4,o_true,t-1),V_B1!=V_B3.

 :- c_a_1_pickupBlock(V_B1,o_true,t-1),c_a_1_putdownBlock(V_B2,o_true,t-1).

 :- c_a_1_pickupBlock(V_B1,o_true,t-1),c_a_2_stackBlock(V_B2,V_B3,o_true,t-1).

 :- c_a_1_pickupBlock(V_B1,o_true,t-1),c_a_2_unstackBlock(V_B2,V_B3,o_true,t-1).

 :- c_a_1_putdownBlock(V_B1,o_true,t-1),c_a_2_stackBlock(V_B2,V_B3,o_true,t-1).

 :- c_a_1_putdownBlock(V_B1,o_true,t-1),c_a_2_unstackBlock(V_B2,V_B3,o_true,t-1).

 :- c_a_2_stackBlock(V_B1,V_B2,o_true,t-1),c_a_2_unstackBlock(V_B3,V_B4,o_true,t-1).

% Notes on why the earlier sample runs were UNSAT:
% The earlier program was missing two critical effects:
% - pickup should make the picked block not clear (~clear(B)), otherwise it violates
%   the state constraint "impossible holding(B) & clear(B)"
% - unstack should make the removed block not clear (~clear(B1)), otherwise it violates
%   the same constraint after unstack makes it holding(B1)

% noconcurrency

% Query: 0
% Maxstep: 
#base.
 :- not c_f_0_handEmpty(o_true,0),query_label(q_0).
 :- not c_f_1_on(o_b3,o_table,0),query_label(q_0).
 :- not c_f_1_clear(o_b3,o_true,0),query_label(q_0).
 :- not c_f_1_holding(o_b3,o_false,0),query_label(q_0).
 :- not c_f_1_on(o_b1,o_table,0),query_label(q_0).
 :- not c_f_1_clear(o_b1,o_true,0),query_label(q_0).
 :- not c_f_1_holding(o_b1,o_false,0),query_label(q_0).
 :- not c_f_1_on(o_b2,o_table,0),query_label(q_0).
 :- not c_f_1_clear(o_b2,o_false,0),query_label(q_0).
 :- not c_f_1_holding(o_b2,o_false,0),query_label(q_0).
 :- not c_f_1_on(o_b4,o_b2,0),query_label(q_0).
 :- not c_f_1_clear(o_b4,o_true,0),query_label(q_0).
 :- not c_f_1_holding(o_b4,o_false,0),query_label(q_0).
 :- not c_f_0_handEmpty(o_true,0),maxstep==0,query_label(q_0).
 :- not c_f_1_on(o_b3,o_table,0),maxstep==0,query_label(q_0).
 :- not c_f_1_clear(o_b3,o_true,0),maxstep==0,query_label(q_0).
 :- not c_f_1_holding(o_b3,o_false,0),maxstep==0,query_label(q_0).
 :- not c_f_1_on(o_b2,o_table,0),maxstep==0,query_label(q_0).
 :- not c_f_1_holding(o_b2,o_false,0),maxstep==0,query_label(q_0).
 :- not c_f_1_on(o_b4,o_b2,0),maxstep==0,query_label(q_0).
 :- not c_f_1_holding(o_b4,o_false,0),maxstep==0,query_label(q_0).
 :- not c_f_1_on(o_b1,o_b4,0),maxstep==0,query_label(q_0).
 :- not c_f_1_clear(o_b1,o_true,0),maxstep==0,query_label(q_0).
 :- not c_f_1_holding(o_b1,o_false,0),maxstep==0,query_label(q_0).
 :- not c_f_1_clear(o_b4,o_false,0),maxstep==0,query_label(q_0).
 :- not c_f_1_clear(o_b2,o_false,0),maxstep==0,query_label(q_0).
#volatile t.
 :- not c_f_0_handEmpty(o_true,t),query_label(q_0).
 :- not c_f_1_on(o_b3,o_table,t),query_label(q_0).
 :- not c_f_1_clear(o_b3,o_true,t),query_label(q_0).
 :- not c_f_1_holding(o_b3,o_false,t),query_label(q_0).
 :- not c_f_1_on(o_b2,o_table,t),query_label(q_0).
 :- not c_f_1_holding(o_b2,o_false,t),query_label(q_0).
 :- not c_f_1_on(o_b4,o_b2,t),query_label(q_0).
 :- not c_f_1_holding(o_b4,o_false,t),query_label(q_0).
 :- not c_f_1_on(o_b1,o_b4,t),query_label(q_0).
 :- not c_f_1_clear(o_b1,o_true,t),query_label(q_0).
 :- not c_f_1_holding(o_b1,o_false,t),query_label(q_0).
 :- not c_f_1_clear(o_b4,o_false,t),query_label(q_0).
 :- not c_f_1_clear(o_b2,o_false,t),query_label(q_0).


% -------------------------------------------------------------------------
% noconcurrency -----------------------------------------------------------
% -------------------------------------------------------------------------

#cumulative t.
 :- c_a_1_pickupBlock(GVAR_block_1,o_true,t-1),c_a_1_pickupBlock(GVAR_block_2,o_true,t-1),GVAR_block_1!=GVAR_block_2.
 :- c_a_1_pickupBlock(GVAR_block_1,o_true,t-1),c_a_1_putdownBlock(GVAR_block_2,o_true,t-1).
 :- c_a_1_pickupBlock(GVAR_block_1,o_true,t-1),c_a_2_stackBlock(GVAR_block_2,GVAR_block_3,o_true,t-1).
 :- c_a_1_pickupBlock(GVAR_block_1,o_true,t-1),c_a_2_unstackBlock(GVAR_block_2,GVAR_block_3,o_true,t-1).
 :- c_a_1_putdownBlock(GVAR_block_1,o_true,t-1),c_a_1_putdownBlock(GVAR_block_2,o_true,t-1),GVAR_block_1!=GVAR_block_2.
 :- c_a_1_putdownBlock(GVAR_block_1,o_true,t-1),c_a_2_stackBlock(GVAR_block_2,GVAR_block_3,o_true,t-1).
 :- c_a_1_putdownBlock(GVAR_block_1,o_true,t-1),c_a_2_unstackBlock(GVAR_block_2,GVAR_block_3,o_true,t-1).
 :- GVAR_block_1!=GVAR_block_3,c_a_2_stackBlock(GVAR_block_1,GVAR_block_2,o_true,t-1),c_a_2_stackBlock(GVAR_block_3,GVAR_block_4,o_true,t-1).
 :- GVAR_block_2!=GVAR_block_4,c_a_2_stackBlock(GVAR_block_1,GVAR_block_2,o_true,t-1),c_a_2_stackBlock(GVAR_block_3,GVAR_block_4,o_true,t-1).
 :- c_a_2_stackBlock(GVAR_block_1,GVAR_block_2,o_true,t-1),c_a_2_unstackBlock(GVAR_block_3,GVAR_block_4,o_true,t-1).
 :- GVAR_block_1!=GVAR_block_3,c_a_2_unstackBlock(GVAR_block_1,GVAR_block_2,o_true,t-1),c_a_2_unstackBlock(GVAR_block_3,GVAR_block_4,o_true,t-1).
 :- GVAR_block_2!=GVAR_block_4,c_a_2_unstackBlock(GVAR_block_1,GVAR_block_2,o_true,t-1),c_a_2_unstackBlock(GVAR_block_3,GVAR_block_4,o_true,t-1).
#base.

% -------------------------------------------------------------------------
% epilogue ----------------------------------------------------------------
% -------------------------------------------------------------------------

query_label(query) :- true.
#volatile t.
 :- t<minstep.
% -------------------------------------------------------------------------

#hide s_computed/1.
#hide query_label/1.
#base.
true.
:- false.
#hide true/0.
