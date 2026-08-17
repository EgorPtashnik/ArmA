//******************************************************
// Set Base Patrol
//******************************************************
[EP_ambPatrol, "EP_wpStartBasePatrol", true, 0, 0, [5, 20, 10], 10] call EP_fnc_taskPatrol;
[EP_actor_1, "Exercise"] call EF_fnc_ambientAnim;
[EP_actor_2, "Lean"] call EF_fnc_ambientAnim;
[EP_actor_3, "RepairKneel"] call EF_fnc_ambientAnim;
[EP_actor_4, "StandArmed"] call EF_fnc_ambientAnim;
[EP_actor_5, "StandArmed"] call EF_fnc_ambientAnim;
[EP_actor_6, "Watch"] call EF_fnc_ambientAnim;
