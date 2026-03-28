aEastToSpawn = [
	["CUP_O_TK_Soldier", "CUP_O_TK_Soldier", "CUP_O_TK_Medic", "CUP_O_TK_Engineer"], //Common riflemans
	["CUP_O_TK_Soldier_AR", "CUP_O_TK_Soldier_SL", "CUP_O_TK_Soldier_AT"], //Machine gun and AT
	["CUP_O_TK_Soldier_AA", "CUP_O_TK_Soldier_SL", "CUP_O_TK_Soldier", "CUP_O_TK_Soldier_GL"] //AA and grenadier
];
{_x disableAI "MOVE"; _x setUnitPos "UP"} forEach units grpStaticGuard_1;