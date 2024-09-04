{
	private _unitAnim = ["Acts_Ambient_Relax_1", "Acts_Ambient_Relax_2", "Acts_Ambient_Relax_3", "Acts_Ambient_Relax_4", "Acts_Briefing_SB_Loop"] call BIS_fnc_selectRandom;
	_x disableAI "ALL";
	sleep random [0,1,2];
	_x switchMove _unitAnim;
	_x addEventHandler ["AnimDone", {
		params ["_unit", "_anim"];
		_unit switchMove _anim;
	}];
} forEach units base_group;
