private _toShowMarkers = ((getMissionLayerEntities "Layer_Markers_Mission_Start") # 1);
disableMapIndicators [true, true, true, true];

[
    [
        [0,     { [markerSize "BR_Zone_1", markerPos "BR_Zone_1", 0] call BIS_fnc_zoomOnArea }],
        [0.2,   { "BR_1" call EP_fnc_missionConversations }],
        [3.1,   { "BR_2" call EP_fnc_missionConversations }],
        [9,     { "BR_3" call EP_fnc_missionConversations }],
        [10,    { ["I_MrkBase"] call BIS_fnc_showMarker }],
        [14,    { ["I_MrkBaseCross"] call BIS_fnc_showMarker }],
        [17,    { "BR_4" call EP_fnc_missionConversations }],
        [17.1,  { ["O_MrkCompound_1"] call BIS_fnc_showMarker }],
        [24,    { "BR_5" call EP_fnc_missionConversations }],
        [24.1,  { ["BR_Car"] call BIS_fnc_showMarker }],
        [25,    { ["BR_Car", markerPos "BR_1", 2] call BIS_fnc_moveMarker }],
        [26,    { "BR_6" call EP_fnc_missionConversations }],
        [31,    { "BR_7" call EP_fnc_missionConversations }],
        [31.1,  { ["BR_Recon"] call BIS_fnc_showMarker }],
        [31.2,    { ["BR_Recon", markerPos "I_MrkOverwatch_1", 2] call BIS_fnc_moveMarker }],
        [34,    { "BR_8" call EP_fnc_missionConversations }],
        [39,    { "BR_9" call EP_fnc_missionConversations }],
        [46,    { disableMapIndicators [false, false, false, false] }]
    ],
    0,
    "",
    allMapMarkers,
    _toShowMarkers,
    "BR_Zone_1"
] spawn BIS_fnc_animatedBriefing;

waitUntil { !(missionNamespace getVariable ["BIS_fnc_eventTimeline_playing", true]) };
