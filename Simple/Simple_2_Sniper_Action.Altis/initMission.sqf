// Color Corrections
"colorCorrections" ppEffectEnable true; 
"colorCorrections" ppEffectAdjust [0.85, 0.95, 0, [0.1, 0.15, 0.2, 0], [0.85, 0.85, 0.9, 0.6], [0.6, 0.7, 0.8, 0]]; 
"colorCorrections" ppEffectCommit 0;

private ["_units"];

// EP_GROUP_SCOUT SETUP
_units = units EP_GROUP_SCOUT;
EP_GROUP_SCOUT setCombatMode "BLUE";
EP_GROUP_SCOUT setFormation "FILE";
{_x disableAI "MOVE"; _x setUnitPos "MIDDLE"} forEach _units;
{_x setVariable ["EP_AT", true]} forEach [EP_AT_1, EP_AT_2];
_units execVM "scripts\loadout.sqf";

// STATIC PATROL SETUP
{_x setBehaviour "SAFE"} forEach [EP_STATIC_PATROL_1, EP_STATIC_PATROL_2, EP_STATIC_PATROL_3];
EP_STATIC_PATROL_3 disableAI "MOVE";

// DYNAMIC PATROL SETUP
EP_GROUP_DYNAMIC_PATROL setCombatBehaviour "SAFE";
{_x disableAI "MOVE"} forEach units EP_GROUP_DYNAMIC_PATROL;

// BASE SETUP
{(units _x) call EP_fnc_hideUnits} forEach (getMissionLayerEntities "LAYER_BASE_UNITS" # 2);
{(units _x) call EP_fnc_hideUnits} forEach (getMissionLayerEntities "LAYER_QRF" # 2);

// MARKERS
{_x setMarkerAlpha 0} forEach [
	"EP_MARKER_STATIC_PATROL", "EP_MARKER_DYNAMIC_PATROL", "EP_MARKER_GROUP_SCOUT",
	"EP_MARKER_STATIC_PATROL_KIA", "EP_MARKER_DYNAMIC_PATROL_KIA"
];
"EP_MARKER_STATIC_PATROL_KIA" setMarkerPos (getMarkerPos "EP_MARKER_STATIC_PATROL");
"EP_MARKER_DYNAMIC_PATROL_KIA" setMarkerPos (getMarkerPos "EP_MARKER_DYNAMIC_PATROL");

// PREPARE INSERTION
enableRadio false;
enableSentences false;
["EP_BLACK_SCREEN", false] call BIS_fnc_blackOut;
[0, 1.5, false, true] call BIS_fnc_cinemaBorder;

// PLAYER PROFILE
player setName ["Aaron Lorent", "Aaron", "Lorent"];
player setRank "CAPTAIN";
player action ["WeaponOnBack", player];
group player setGroupId ["Ghost"];

private ["_musicArray"];
_musicArray = ["music_calm_full_RF","LeadTrack06_F","AmbientTrack01_F","AmbientTrack01a_F","AmbientTrack01b_F","AmbientTrack04a_F","AmbientTrack04_F","LeadTrack03_F_EPB","EventTrack02_F_EPB","EventTrack03_F_EPB","EventTrack04_F_EPB","AmbientTrack01_F_EPB","BackgroundTrack01_F_EPB","LeadTrack03_F_EPC","EventTrack01_F_EPC","BackgroundTrack01_F_EPC","BackgroundTrack04_F_EPC","AmbientTrack01_F_EXP","AmbientTrack01a_F_EXP","AmbientTrack01b_F_EXP","AmbientTrack02_F_EXP","AmbientTrack02a_F_EXP","AmbientTrack02b_F_EXP","AmbientTrack02c_F_EXP","AmbientTrack02d_F_EXP","Music_Probe_Discovered","Music_Roaming_Night","Music_Roaming_Night_02","Music_Roaming_Night_Fragment_01_20s","Music_Roaming_Night_Fragment_01_30s","Music_Roaming_Night_Fragment_01_60s","Music_Roaming_Night_Fragment_02_30s","Music_Roaming_Night_Fragment_02_60s","Music_Roaming_Night_Fragment_03_60s","Music_Roaming_Day","Music_Roaming_Day_02","Music_Freeroam_01_MissionStart","Music_Freeroam_02_MissionStart","Music_Freeroam_RootExtract","anomaly_07_05_v1","anomaly_07_05_v2"];
[_musicArray, 60] call BIS_fnc_music;

0 fadeMusic 0;

EP_MISSION_STARTED = true;
