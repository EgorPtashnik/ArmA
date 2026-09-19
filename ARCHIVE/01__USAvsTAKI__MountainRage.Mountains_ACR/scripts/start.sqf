waitUntil {time>0};


//**************************
//Send convoy
//**************************
{
    _x setConvoySeparation 40;
    _x limitSpeed 60;
    _x lock 4;
} forEach (EP_Convoy call BIS_fnc_groupVehicles);

private "_wp";
_wp = EP_Convoy addWaypoint [markerPos "wpConvoy_1", -1];
_wp setWaypointStatements ["true", "'intro_1' spawn BIS_fnc_missionConversations"];
_wp = EP_Convoy addWaypoint [markerPos "wpConvoy_2", -1];
_wp setWaypointStatements ["true", "'intro_2' spawn BIS_fnc_missionConversations"];
_wp = EP_Convoy addWaypoint [markerPos "wpConvoy_3", -1];
_wp setWaypointStatements ["true", "EP_InPosition = true"];


//**************************
//Intro
//**************************
enableSentences false;
enableEnvironment false;
enableRadio false;
clearRadio;
["EP_Black", false] call BIS_fnc_blackOut;
sleep 5;
["EP_Black", true, 5] call BIS_fnc_blackIn;
playMusic "Track_C_19";
enableRadio true;
enableEnvironment true;
enableSentences true;
sleep 10;
[
    ["Takistan"],
    ["USA Army, team Bravo-2"],
    [format ["%1, %2", "23.10.2021", [dayTime, "HH:MM"] call BIS_fnc_timeToString]]
] call BIS_fnc_EXP_camp_SITREP;
