// Initial monologue
case "Prologue": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["int_introduction_in","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Check from HQ
case "Status": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_introduction_out","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Inside Armata
case "InsideArmata": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["in_inside_angara","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Armata destroyed before western defense succeeds - continue as infantryman
case "ArmataDestroyedTooSoon": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_angara_destroyed","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "ArmataDestroyedTooSoonAlone": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_angara_destroyed_alone","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Incoming
case "Incoming": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_incoming","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Enemy attack starting
case "WTanksSpotted": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_tanks_spotted01","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Passed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_tanks_passed","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// NATO tanks/action at the east
case "ETanksSpotted": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_tanks_spotted02","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "ETanksDestroyed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_tanks_destroyed","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "ArtemisDestroyed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_artemis_wiped_out","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// NATO tanks broke the eastern defense
case "EnemyFlanking": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_panagia","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Defense failed - the conversation doesn't reflect the actual situation, maybe do not use at all, might be confusing
case "DefenseFailed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_first_line_broken","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Defense succeeded
case "Defended": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_defense_succeeded_in","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "DefendedAlone": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_defense_succeeded_alone_in","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "PanagiaSituation": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_defence_succeeded_panagia","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "ArmataSurvived": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_defence_succeeded_panagia_affirmative_out","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "ArmataDestroyed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_defence_succeeded_panagia_negative_in","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "ArmataDestroyedSurrender": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_defence_succeeded_panagia_negative_out","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Helped at Panagia
case "PanagiaHelped": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_mission_complete","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "PanagiaArmataDestroyed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_defence_succeeded_panagia_negative_tank_damaged","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "PanagiaArmataDestroyedConfirm": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_angara01_destroyed","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Taking too long to destroy Armata
case "Hurry": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_hurry_up","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Nearby friendly Armata
case "Armata02_investigate": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	// ["ta_angara_unknown","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	["ta_angara_unknown","ta_tanks_m03",["ta_tanks_m03_004_ta_angara_unknown_ARHQ_0","ta_tanks_m03_004_ta_angara_unknown_ARHQ_1"],"side"] call BIS_fnc_kbTell;
	sleep 4;
	["ta_angara_unknown","ta_tanks_m03",["ta_tanks_m03_004_ta_angara_unknown_ARHQ_2","ta_tanks_m03_004_ta_angara_unknown_ARHQ_2"],"side"] call BIS_fnc_kbTell;
	sleep 3;
	["ta_angara_unknown","ta_tanks_m03",["ta_tanks_m03_004_ta_angara_unknown_ARHQ_3","ta_tanks_m03_004_ta_angara_unknown_ARPLAYER_0"],"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Armata02_nearby": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_angara02_discovered","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Armata02_nearbyAlone": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_angara02_discovered_alone","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Armata02_inside": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_angara02_inside","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Armata02_report": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_angara02_report","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Armata02_destroyed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_angara02_destroyed","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Armata blown up in the end
case "ArmataCeasedToBe": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_angara01_destroyed","ta_tanks_m03",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Leaving AO
case "Desertion_Punishment": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_leaving_ao","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Desertion_Warning": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_left_ao","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Kill confirmations
case "EnemyTankKIA01": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_enemy_tank_destroyed01","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "EnemyTankKIA02": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_enemy_tank_destroyed02","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// NATO heli loudspeaker
case "NATOHeli": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_blackfoot_message","ta_tanks_m03",nil,"global"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Player injured
case "Injured": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_player_injured","ta_tanks_m03",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};
