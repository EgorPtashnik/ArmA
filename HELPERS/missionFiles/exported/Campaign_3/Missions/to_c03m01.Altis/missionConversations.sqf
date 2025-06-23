case "b_01": {
	["br_briefing","to_c03_m01",[["BIS_bowker",0],["BIS_bowker",19]] , "SIDE"] call bis_fnc_kbTell;
	sleep 4;
};
case "b_end": {
	["br_briefing","to_c03_m01",[["BIS_bowker",20],["BIS_pilot02",2]] , "SIDE"] call bis_fnc_kbTell;
	sleep 4;
};
case "b_10": {
};
case "b_15": {
};
case "b_20": {
};
case "00_intro": {
};

case "01_commAttempt": {
	["int_crash_site","to_c03_m01",[["BARKLEM",0],["BARKLEM",4]], "DIRECT"] call bis_fnc_kbTell;
	//save game
	sleep 12;
	saveGame;
	BIS_to_firstSaveGameTime = time;
};

case "02_commAttempt": {
	["int_crash_site","to_c03_m01",[["PILOT",0],["BARKLEM",9]], "SIDE"] call bis_fnc_kbTell;
};

case "03_commAttempt_2": {
	["am_pilot_chatter","to_c03_m01", nil, "SIDE"] call bis_fnc_kbTell;
	{
		BIS_hillPatrol reveal _x;
		_x setCaptive false;
	} forEach units BIS_deadPilots;
};

case "05_PilotFound": {
	["ta_pilot_found","to_c03_m01", nil, "DIRECT"] call bis_fnc_kbTell;	
};

case "10_GivingFAK": {
	["ta_pilot_checked","to_c03_m01", nil, "DIRECT"] call bis_fnc_kbTell;

	if(alive BIS_medic && BIS_medic distance BIS_pilot < 20) then {
		["ta_pilot_checked_medic","to_c03_m01", nil, "DIRECT"] call bis_fnc_kbTell;
	} else {
		["ta_pilot_checked_alone","to_c03_m01", nil, "DIRECT"] call bis_fnc_kbTell;
	};	

	["ta_pilot_checked_out","to_c03_m01", [["pilot",0],["barklem",0]], "DIRECT"] call bis_fnc_kbTell;
	missionNamespace setVariable ["BIS_to_pilotConversationOver", true];
};

case "10_PilotInterrupted": {

	["eve_pilot_interrupted","to_c03_m01", nil, "DIRECT"] call bis_fnc_kbTell;
};

case "20_atMedic": {

	["ta_medic_found","to_c03_m01", nil, "DIRECT"] call bis_fnc_kbTell;
};

case "20_MedicInterrupted": {

	["eve_medic_interrupted","to_c03_m01", nil, "DIRECT"] call bis_fnc_kbTell;
};

case "21_injuredDead": {

	["ex_player_wounded","to_c03_m01", nil, "DIRECT"] call BIS_fnc_kbTell;
};

case "25_gaveMedikit": {

	//played in medicFSM
/*
	["ta_wounded_soldier_revived","to_c03_m01", nil, false] call bis_fnc_kbTell;	

	["ta_wounded_soldier_revived","to_c03_m01", [["BARKLEM",0],["BARKLEM",0]], "DIRECT"] call bis_fnc_kbTell;	

	["ta_wounded_soldier_revived","to_c03_m01", [["MEDIC",0],["MEDIC",1]], "DIRECT"] call bis_fnc_kbTell;	

	["ta_wounded_soldier_revived","to_c03_m01", [["BARKLEM",1],["BARKLEM",2]], "DIRECT"] call bis_fnc_kbTell;

	["ta_wounded_soldier_revived","to_c03_m01", [["MEDIC",2],["MEDIC",3]], "DIRECT"] call bis_fnc_kbTell;		

	["ta_wounded_soldier_revived","to_c03_m01", [["BARKLEM",3],["BARKLEM",3]], "DIRECT"] call bis_fnc_kbTell;
	*/
};

case "27_anySurvivors": {

};

case "30_commanderCall": {
	["ERV","Mortar"] call BIS_fnc_TO_activateUnits;

	["ta_contact_reestablished","to_c03_m01", nil, "SIDE"] call bis_fnc_kbTell;	
	["tsk_regroup", BIS_regroup] call BIS_fnc_taskSetDestination;

	//add ERV marker
	["mrk_regroup_1", 1] spawn BIS_fnc_showMarker;
	saveGame;
};

case "33_reconsReporting": {
	["am_pariah_argument","to_c03_m01", nil, "SIDE"] call bis_fnc_kbTell;

	// Task: Defend Regroup Zone
	[
		TRUE,
		"tsk_recon",
		[
			localize "STR_A3_TO_C03m01_tskReconDesc",
			localize "STR_A3_TO_C03m01_tskReconTitle",
			nil
		],
		BIS_omicron,
		true,
		1,
		true,
		"move",
		false
	] call BIS_fnc_taskCreate;

	missionNamespace setVariable ["BIS_to_reconsConversationOver", true];
};

case "35_foundRecons": {
	//, nil, "DIRECT"
	["ta_recon_position","to_c03_m01", nil, "SIDE"] call bis_fnc_kbTell;
	BIS_atReconHouse = true;
};

case "38_failedRecons": {

};

case "40_helpedRecons": {

};

case "45_getMortar": {
	["ta_mortar_needed","to_c03_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "50_gotMortar": {
	["eve_mortar_secured_in","to_c03_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "52_oscarCalling":{
	["am_oscar_late","to_c03_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "55_regroupCalling": {
	["am_regroup_point_under_fire_a","to_c03_m01", nil, "SIDE"] call bis_fnc_kbTell;
};

case "60_atRegroup": {
	//count attackers
	private _attackers = ["Final Attack"] call BIS_fnc_to_unitList;
	private _countAlive = {alive _x} count _attackers;

	sleep 1;

	["ta_regroup_point_in","to_c03_m01", nil, "SIDE"] call bis_fnc_kbTell;
	["ta_regroup_point","to_c03_m01", nil, "SIDE"] call BIS_fnc_kbTell;
	
	if(_countAlive > 3) then
	{
		["ta_regroup_point_out","to_c03_m01", nil, "SIDE"] call BIS_fnc_kbTell;
	};
	
	if(!isNil {BIS_to_mortarSaved} && {BIS_to_mortarSaved})then
	{
		["ta_regroup_point_out_mortar","to_c03_m01", nil, "SIDE"] call BIS_fnc_kbTell;
	}; 

	
	sleep 2;

	if(_countAlive > 3) then
	{
		saveGame;
	};

	missionNamespace setVariable ["BIS_to_regroupConversationOver", true];
};

case "65_regroupDefense": {

};

case "70_defenseSuccesful": {
	["ta_regroup_defended","to_c03_m01", nil, "SIDE"] call BIS_fnc_kbTell;
};

case "75_defenseFailing": {
	["ta_regroup_defended_fail","to_c03_m01", nil, "SIDE"] call BIS_fnc_kbTell;
};

case "x00_playerLost": {
	["ex_ao_boundary","to_c03_m02",nil,"SIDE"] call BIS_fnc_kbTell;
};
