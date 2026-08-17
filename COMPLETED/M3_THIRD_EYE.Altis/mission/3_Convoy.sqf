sleep 5;

savegame;
"EPTaskDestroyConvoy" call EP_fnc_missionTasks;
sleep 5;

private _IEDPos = getMarkerPos "EPMrkIEDPos";
private _planter = leader EP_sword;
_planter doMove _IEDPos;
waitUntil { moveToCompleted _planter };
sleep 1;
_planter playMove "AinvPknlMstpSrasWrflDnon_Putdown_AmovPknlMstpSrasWrflDnon";
sleep 1.5;
private _demoCharge = "DemoCharge_Remote_Ammo_Scripted" createVehicle _IEDPos;
_planter doFollow _planter;

sleep 5;
"3_iedPlanted" call EP_fnc_missionConversations;

EP_sword call EP_fnc_clearWaypoints;
[EP_sword, "EPWPAmbush", "AWARE", "NORMAL"] call EP_fnc_addWaypoint;

waitUntil { sleep 1; unitReady _planter };

[units EP_sword, "DOWN", "WHITE", "CARELESS"] call EP_fnc_setAIMode;
[ (getMissionLayerEntities "OPF_CONVOY" # 0), true ] call EP_fnc_showObjects;
[EPConvoy, "EPMrkConvoyPath"] spawn EP_fnc_taskConvoy;


waitUntil {sleep 1; (EPConvoyAPC distance2D (getPos _demoCharge)) < 3 };
_demoCharge setDamage 1;
EPConvoyAPC setDamage 1;

sleep 2;

playMusic "CUP_A2EWEW_ToWar";

{
	private _veh = vehicle _x;
	if !(canFire _veh) then {
		unassignVehicle _x;
	};
} forEach units EPConvoy;
[EPConvoy, EPConvoy, true] call EP_fnc_taskAttack;
[units EP_sword, "AUTO", "RED", "COMBAT"] call EP_fnc_setAIMode;
[EP_sword, EPConvoy, true] call EP_fnc_taskAttack;

waitUntil { sleep 1; { alive _x } count (units EPConvoy) < 3 };
EPConvoy call EP_fnc_clearWaypoints;
[units EPConvoy, "CARELESS"] call EP_fnc_setAIMode;
private _handle = "3_convoyKIA" call EP_fnc_missionConversations;

waitUntil { sleep 1; scriptDone _handle };
["EPTaskDestroyConvoy", "SUCCEEDED"] call EP_fnc_missionTasks;

sleep 5;

"Win" call BIS_fnc_endMission;