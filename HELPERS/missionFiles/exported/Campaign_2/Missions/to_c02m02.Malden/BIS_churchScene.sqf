BIS_Slammer01 removeAllEventHandlers "Fired";
BIS_churchTower say3D ["ChurchBell",1000];
_deleteOld = (getMissionLayerEntities "BIS_ChurchBefore") select 0;
{deleteVehicle _x} forEach _deleteOld;
{_x hideObject false} foreach BIS_churchAfterObjects;

[] spawn
{
    for "_i" from 1 to 3 do
    {
    	sleep (0.0 + random 0.8);
      _bombos = "Sh_82mm_AMOS";
    	_Bomba = _bombos createVehicle getMarkerPos "BIS_BoomPoz";
    	_Bomba setVelocity [0,0,-1];
    };
};

sleep 3;

BIS_whiteFlag hideObject false;
([BIS_timeline] call BIS_fnc_camera_getCam) cameraEffect ["Internal", "back"];
[BIS_timeline] call BIS_fnc_timeline_play;

_deleteOld = (getMissionLayerEntities "BIS_ChurchBefore") select 0;
{deleteVehicle _x} forEach _deleteOld;
{_x hideObject false} foreach BIS_churchAfterObjects;

// 1st hostage
_BIS_hostage01 = [getMarkerPos "BIS_CSATHostage01", east, ["O_A_soldier_F"]] call BIS_fnc_spawnGroup;
BIS_hostage01 = (units _BIS_hostage01 select 0);
BIS_hostage01 setUnitPos "UP";
BIS_hostage01 setBehaviour "CARELESS";
BIS_hostage01 disableAI "MOVE";
BIS_hostage01 setCaptive true;
BIS_hostage01 switchMove "AmovPercMstpSsurWnonDnon";
BIS_hostage01 setDir 258;
BIS_hostage01 setPos [7125.41,6135.29,0.00144958];
removeAllWeapons BIS_hostage01;

BIS_hostage01 addEventHandler
[
  "Killed",
	{
		_whoKill = _this select 1;
  		If (_whoKill == player) then
  			{
  				If (BIS_Infantry) then
          {
            [] spawn
            {
              ["17_Inf_PlayerKillHostage"] spawn BIS_fnc_missionConversations;
              5 fadeSound 0;
              0 fadeMusic 0;
              5 fadeMusic 1;
              playMusic "LeadTrack01_F_Orange";
              sleep 20;
              setCustomMissionData ["WarCrime", missionNamespace getVariable ["STAT_ROLE", "NoRole"]];
              ["WarCrime",false,true,false] call BIS_fnc_endMission;
            };
          };
  				If (BIS_special) then
          {
            [] spawn
            {
              ["17_Spec_PlayerKillHostage"] spawn BIS_fnc_missionConversations;
              5 fadeSound 0;
              0 fadeMusic 0;
              5 fadeMusic 1;
              playMusic "LeadTrack01_F_Orange";
              sleep 20;
              setCustomMissionData ["WarCrime", missionNamespace getVariable ["STAT_ROLE", "NoRole"]];
              ["WarCrime",false,true,false] call BIS_fnc_endMission;
            };
          };
  			};
  		BIS_hostage01 removeAllEventHandlers "killed";
  		BIS_POW removeAllEventHandlers "killed";

 	}
];

// 2nd hostage
_BIS_POW = [getMarkerPos "BIS_CSATHostage02", east, ["O_A_officer_F"]] call BIS_fnc_spawnGroup;
BIS_POW = (units _BIS_POW select 0);

BIS_POW setUnitPos "UP";
BIS_POW setBehaviour "CARELESS";
BIS_POW disableAI "MOVE";
BIS_POW setCaptive true;
removeAllWeapons BIS_POW;
BIS_POW switchMove "AmovPercMstpSsurWnonDnon";
BIS_POW setDir 176;
BIS_POW setPos [7123.14,6136.5,0.00144958];

BIS_POW addEventHandler
[
  "Killed",
	{
		_whoKill = _this select 1;
  		If (_whoKill == player) then
  			{
  				If (BIS_Infantry) then
          {
            [] spawn
            {
              ["17_Inf_PlayerKillHostage"] spawn BIS_fnc_missionConversations;
              5 fadeSound 0;
              0 fadeMusic 0;
              5 fadeMusic 1;
              playMusic "LeadTrack01_F_Orange";
              sleep 20;
              setCustomMissionData ["WarCrime", missionNamespace getVariable ["STAT_ROLE", "NoRole"]];
              ["WarCrime",false,true,false] call BIS_fnc_endMission;
             };
          };
          If (BIS_special) then
          {
            [] spawn
            {
              ["17_Spec_PlayerKillHostage"] spawn BIS_fnc_missionConversations;
              5 fadeSound 0;
              0 fadeMusic 0;
              5 fadeMusic 1;
              playMusic "LeadTrack01_F_Orange";
              sleep 20;
              setCustomMissionData ["WarCrime", missionNamespace getVariable ["STAT_ROLE", "NoRole"]];
              ["WarCrime",false,true,false] call BIS_fnc_endMission;
            };
          };
  			};
  		BIS_hostage01 removeAllEventHandlers "killed";
  		BIS_POW removeAllEventHandlers "killed";

 	}
];

sleep 4;
["14_Inf_ChurchWhiteFlag"] spawn BIS_fnc_missionConversations;

If (BIS_Infantry) then
{
  //this will happend if player is infantry

  ["BIS_c02_m02_ti01", "SUCCEEDED"] call BIS_fnc_taskSetState;
  //second task added
  [
  	WEST,
  	"BIS_c02_m02_ti02",
  	[
  		format [
          localize "STR_A3_TO_c02m02_Task02_INF_Description",
          "<marker name = 'BIS_Katami'>", // %1
          "</marker>",       // %2
          "<marker name = 'BIS_Carlsbad'>" // %3
        ],
    "STR_A3_TO_c02m02_Task02_INF_Destination",
  		nil
  	],
  	getMarkerPos "BIS_infantryTask02",
  	true,
  	nil,
  	true,
  	"attack",
  	false
  ] call BIS_fnc_taskCreate;

  ["BIS_c02_m02_ti02", "ASSIGNED"] call BIS_fnc_taskSetState;

  sleep 5;
  saveGame;

  driver BIS_Slammer01 enableAI "MOVE";
  BIS_canMoveSlammer = true;
  driver BIS_Panther01 enableAI "MOVE";
  BIS_canMovePanther = true;
  gunner BIS_Slammer01 lookAt objNull;
}
else
{
  //this will happend if player is special forces
  [
  WEST,
  "BIS_c02_m02_ts06",
  [
    format [
          localize "STR_A3_TO_c02m02_Task06_SPEC_Description",
          "<marker name = 'BIS_Task04'>", // %1
          "</marker>"       // %2
        ],
      "STR_A3_TO_c02m02_Task06_SPEC_Destination",
      nil
    ],
    getMarkerPos "BIS_Task04",
    true,
    nil,
    true,
    "default",
    false
  ] call BIS_fnc_taskCreate;

["BIS_c02_m02_ts06", "ASSIGNED"] call BIS_fnc_taskSetState;


  BIS_Slammer01 move getMarkerPos "BIS_Slammer01WP03";
  BIS_Slammer01 forceSpeed 8;
  gunner BIS_Slammer01 lookAt objNull;
  _wp1 = group BIS_Panther02 addwaypoint [getMarkerPos "BIS_Panther02WP03",0];
  if (!isNil "BIS_Alpha") then {_wp2 = BIS_Alpha addwaypoint [getMarkerPos "BIS_Carlsbad",0]};
  if (!isNil "BIS_Bravo") then {_wp3 = BIS_Bravo addwaypoint [getMarkerPos "BIS_Slammer02WP03",0]};
};


