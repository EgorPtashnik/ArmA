// Initial monologue
case "Prologue": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_introduction","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// HQ info for player
case "Info": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["in_intel","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "StreetFighting": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["in_street_fighting","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Supports
case "Supp_Infantry01": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["su_support_inf01","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Supp_Infantry02": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["su_support_inf02","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Supp_Armor": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["su_support_tank","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Supp_Wiesel": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["su_support_nyx","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// City captured
case "City_Captured": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_dorida_captured","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// FOB
case "FOB_Found": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_depot_found","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "FOB_Destroyed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ta_depot_destroyed","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Maintenance
case "Refuel": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_refuel","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Repair": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_repair","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Rearm": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_rearm","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Earthquakes
case "Earthquake_01": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_earthquake_01","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Earthquake_02": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_earthquake_02","ta_tanks_m02",nil,"group"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Not following orders
case "Insubordination": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_insubordination","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Leaving AO
case "Desertion_Warning": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_leaving_ao","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Desertion_Punishment": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_left_ao","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Armata FUBAR
case "FUBAR": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["ex_fubar","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// City Infantry reports
case "Inf01_lightCasualties": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_inf01_casualties_light","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Inf01_heavyCasualties": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_inf01_casualties_heavy","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Inf01_cityApproach": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_inf01_close","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Inf01_cityInside": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_inf01_in_town","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// FOB Infantry reports
case "Inf02_lightCasualties": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_inf02_casualties_light","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Inf02_heavyCasualties": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_inf02_casualties_heavy","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Wiesel reports
case "Wiesel01_KO": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_vehicle01_ko","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Wiesel01_KIA": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_vehicle01_destroyed","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Wiesel02_KO": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_vehicle02_ko","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Wiesel02_KIA": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_vehicle02_destroyed","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Kill confirmations
case "AircraftDestroyed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_aircraft_destroyed","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "ArmourDestroyed": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_hostile_tank_destroyed","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// Leopard reports
case "Leopard_KO": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_tank_ko","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

case "Leopard_KIA": {
	waitUntil {sleep 0.1; BIS_canSpeak};
	BIS_canSpeak = false;
	["eve_support_tank_destroyed","ta_tanks_m02",nil,"side"] call BIS_fnc_kbTell;
	BIS_canSpeak = true;
};

// BLANK CONVERSATION
case "": {

};
