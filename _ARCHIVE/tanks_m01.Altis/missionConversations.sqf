// Initial monologue
case "Prologue": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["int_introduction","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Idling before taking the Toolkit
case "Toolkit_Timeout": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_toolkit_timeout","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// HQ announcement
case "HQ_Announcement": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["sfx_announcement_01","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Wiesel
case "Wiesel_Nearby": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ap_nyx_close","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Wiesel_Inside": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_nyx_inside","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Wiesel_Idle01": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_nyx_idle_01","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Wiesel_Idle02": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_nyx_idle_02","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Random conversations to fill the empty spaces
case "Conv_generator": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["fil_conv_01","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Conv_Armata": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["fil_conv_02","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Lies": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["fil_conv_02","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "KeepYourEyesOpened": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["fil_conv_03","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Checkpoint A
case "CheckpointA_Close": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ap_checkpoint_a","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "CheckpointA_Wait": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ap_checkpoint_a_wait","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "CheckpointA_Info": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_checkpoint_a","ta_tanks_m01",nil,"direct"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "CheckpointA_Report": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["am_checkpoint_a_report","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Forest
case "Forest_Close": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_hunter_approach","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Forest_HunterFound": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_hunter","ta_tanks_m01",nil,"global"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Forest_HunterKilled": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_hunter_killed","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Forest_ReportHunterAlive": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_hunter_alive_report","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Forest_ReportHunterDead": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_hunter_dead_report","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Forest_AftermathAlive": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["in_hunter_consequences_alive","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Forest_AftermathDead": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["in_hunter_consequences_dead","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Forest_ReportOut": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_hunter_report_out","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Checkpoint B
case "CheckpointB_Close": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ap_checkpoint_b","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "CheckpointB_CloseAlone": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ap_checkpoint_b_alone","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "CheckpointB_Report": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_checkpoint_b_report","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Village
case "Village_Attack": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_attack","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Wiesel_Available": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["su_supports_available","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Village_Seized": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_in","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Casualties - attack aftermath
case "Casualties_AAF_NA": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_na","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_AAF_None": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_none","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_AAF_Light": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_light","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_AAF_Heavy": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_heavy","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_Continue": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_civilians","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_CIV_None": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_civilians_none","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_CIV_Light": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_civilians_light","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_CIV_Heavy": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_civilians_heavy","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_End": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_out","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_Perfect": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_perfect_out","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Casualties_Terrible": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_village_captured_terrible_out","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Maintenance
case "Refuel": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_refuel","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Repair": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_repair","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Rearm": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_rearm","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Calling supports
case "Supp_Infantry": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["su_support_inf","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Supp_Vehicle": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["su_support_nyx","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Not following orders
case "Insubordination": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_insubordination","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Leaving AO
case "Desertion_Warning": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_leaving_ao","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Wiesel FUBAR
case "FUBAR": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_fubar","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Earthquakes
case "Earthquake": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_earthquake","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "EarthquakeAlone": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_earthquake_alone","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Infantry support
case "Infantry_nearby": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_inf_close","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Infantry_lightCasualties": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_inf_casualties_light","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Infantry_heavyCasualties": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_inf_casualties_heavy","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Vehicle support
case "Vehicle_nearby": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_nyx_close","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Vehicle_immobile": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_nyx_m_kill","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Vehicle_cannotFire": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_nyx_f_kill","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Vehicle_confirmIssues": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_nyx_m_or_f_kill_out","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Vehicle_KIA": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_nyx_k_kill","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// First contact with the enemy
case "FirstContact01": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_fia_contact","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "FirstContact02": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_fia_report_in","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "FirstContact03": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_fia_report_out","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "FirstContact04": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_fia_report_out_ignored","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Conversations when nearby empty houses, whel searching for FIA
case "Hut02": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["loc_house_01","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Hut03": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["loc_house_02","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Hut04": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["loc_house_03","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Hut05": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["loc_house_04","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Hut06": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["loc_house_05","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Flipping Wiesel back on tracks
case "FlipWiesel00": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_nyx_overturned_01","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "FlipWiesel01": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_nyx_overturned_02","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "FlipWiesel02": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_nyx_overturned_03","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "FlipWiesel03": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_nyx_overturned_04","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Fuel leak
case "FuelLeak": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_fuel_leak","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Injured
case "Injured": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_player_injured","ta_tanks_m01",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// No entry on Tower
case "NoEntry": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["loc_no_access","ta_tanks_m01",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// BLANK CONVERSATION
case "": {
        BIS_Player groupChat "";
};
