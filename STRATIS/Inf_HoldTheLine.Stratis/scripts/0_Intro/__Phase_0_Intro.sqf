//************************************************************************************************************
// ESTABLISHING SHOT && INTRO
//************************************************************************************************************

private _establishingShotPosition = player call ep_fnc_getPosition;
private _stablishingShotParameters = [
    "Stratis Island",
    500,
    200,
    random 360,
    1,
    [["a3\ui_f\data\map\markers\flags\csat_ca.paa", [0.5,0,0,0.5], markerPos "O_MrkGorgon", 1, 1, 0]]
];
private _sitrepTexts = [
    "CSAT AA Position",
    mapGridPosition player,
    groupId O_GrpPlayer
];


_establishingShotPosition = player call ep_fnc_getPosition;
private _params = [_establishingShotPosition] + _stablishingShotParameters;

_params call BIS_fnc_establishingShot;

sleep 3;

private _handle = _sitrepTexts spawn BIS_fnc_EXP_camp_SITREP;
waitUntil {scriptDone _handle};


//************************************************************************************************************
// CONVERSATIONS
//************************************************************************************************************

// Music
private _tracks = ["BackgroundTrack04_F_EPC", "LeadTrack01_F_EPC", "BackgroundTrack01_F_EPB", "Track10_StageB_action", "LeadTrack03_F_EPA"];
[_tracks, 15] spawn BIS_fnc_music;

_handle = "Intro" call EP_fnc_missionConversations;
waitUntil {sleep 1; scriptDone _handle };


//************************************************************************************************************
// NEXT PHASE
//************************************************************************************************************
execVM "scripts\1_Defend\__Phase_1_Defend.sqf";
