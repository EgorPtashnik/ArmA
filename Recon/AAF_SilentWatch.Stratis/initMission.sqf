//************************************************************************************************************
// PP EFFECTS
//************************************************************************************************************
// "filmGrain" ppEffectEnable true;
// "filmGrain" ppEffectAdjust [0.5, 1.2, 2, 0.2, 0.2, true];
// "filmGrain" ppEffectCommit 0;

// "colorCorrections" ppEffectEnable true;
// "colorCorrections" ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1.1, 1.3, 1.1, 0.8], [0.299, 0.587, 0.114, 0]];
// "colorcorrections" ppeffectcommit 0;


//************************************************************************************************************
// DESTROY BASE BUILDINGS
//************************************************************************************************************
{ _x setDamage 1 } forEach (nearestObjects [(markerPos "S_DestroyBase"), ["house"], 200 ]);



//************************************************************************************************************
// UNITS SETUP
//************************************************************************************************************

// Player group
group player setGroupId ["Reaper"];

// Compound 1 Defenders
{ [_x, (selectRandom ["StandArmed", "Watch"])] call EF_fnc_ambientAnim } forEach units O_Compound_1_Defenders;


//************************************************************************************************************
// HIDE LAYERS
//************************************************************************************************************
["Mission_Start", false] call EP_fnc_showObjects;
["Mission_Compound_1_Units", false] call EP_fnc_showObjects;