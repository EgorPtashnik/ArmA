private _heli = searchheli;
private _group = group _heli;

// Random position within 100–200m of player
private _offset = [random 200 - 100, random 200 - 100]; // -100 to +100 on X and Y
private _targetPos = player getPos [_offset select 0, 0] vectorAdd [0, _offset select 1, 0];

// Create waypoint
private _wp = _group addWaypoint [_targetPos, 0];
_wp setWaypointType "MOVE";

private _wp = _group addWaypoint [_targetPos, 0];
_wp setWaypointType "MOVE";

private _wp = _group addWaypoint [_targetPos, 0];
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE";
_wp setWaypointLoiterRadius 150;
_group setCombatMode "BLUE";

var_objectivescomplete = 1;

if (!triggerActivated trg_meetscylla) then
{
	scylla setDamage 1;
};
if (!triggerActivated trg_meetkinos) then
{
	kinos1 setDamage 1;
	kinos2 setDamage 1;
};
if (!triggerActivated trg_meetgyges) then
{
	gyges1 setDamage 1;
	gyges2 setDamage 1;
};
if (!triggerActivated trg_meetapc) then
{
	myrmidon setDamage 1;
};
if (!triggerActivated trg_meetharpy) then
{
	harpy setDamage 1;
};
ambflybyrun = false;
//[introcover, [], false] call BIS_fnc_moduleCoverMap;
//[missioncover, [], false] call BIS_fnc_moduleCoverMap;

_showlayers = ["Spawn Reinforcements"]; //unhide layers
{
	{
		_x enableSimulation true;
        _x hideObjectGlobal false;
	}forEach (getMissionLayerEntities _x select 0);
}forEach _showlayers;

AsoundSourcefirefights = amb_firefight_source2;
ATargetfirefights = amb_firefight_source2;

_usmcvehsp1 = [getMarkerPos "m_endsp_1", 184, "B_APC_Wheeled_01_cannon_F", west] call BIS_fnc_spawnVehicle;
_usmcvehsp2 = [getMarkerPos "m_endsp_2", 172, "B_APC_Wheeled_01_cannon_F", west] call BIS_fnc_spawnVehicle;
_usmcvehsp3 = [getMarkerPos "m_endsp_3", 345, "B_APC_Wheeled_01_cannon_F", west] call BIS_fnc_spawnVehicle;
_usmcvehsp4 = [getMarkerPos "m_endsp_4", 300, "B_APC_Wheeled_01_cannon_F", west] call BIS_fnc_spawnVehicle;
_usmcvehsp4 = [getMarkerPos "m_endsp_9", 315, "B_APC_Wheeled_01_cannon_F", west] call BIS_fnc_spawnVehicle;

_markersusmcpatrol = ["m_endsp_5","m_endsp_6","m_endsp_7","m_endsp_8"];

{
	_usmcpatrol1 = [getmarkerpos _x, west, ["EF_B_Marine_SL_Des", "EF_B_Marine_LAT2_Des", "EF_B_Marine_AR_Des", "EF_B_Marine_GL_Des", "EF_B_Marine_Medic_Des", "EF_B_Marine_Mark_Des"]] call BIS_fnc_SpawnGroup; 
	[_usmcpatrol1, getMarkerPos _x, 150] call BIS_fnc_TaskPatrol;
} forEach _markersusmcpatrol;

var_escape = 1;

_hidemarkers = ["m_startnw","m_startse","marker_101","marker_102","marker_104","marker_105","marker_106","marker_111","marker_74","marker_77","marker_59","marker_58","marker_57","marker_56","marker_55","marker_54","marker_36","marker_35","marker_44","marker_43","marker_40","marker_70","marker_71","marker_72","marker_73","marker_65","marker_63","marker_62","marker_61","marker_60"];
{
	_x setMarkerAlpha 0;
}forEach _hidemarkers;

_showmarkers = ["marker_128","marker_130","marker_131","marker_132"];
{
	_x setMarkerAlpha 1;
}forEach _showmarkers;

"marker_15" setMarkerPos [15350.5,17064.6,0];

if (var_officerkilled == 0) then
{
	mekes commandchat "Holy shit. You've got multiple APC's inbound from the east!";
	playSoundUI ["ax_radioclick"];
	sleep 5;
	mekes commandchat "We see helicopters incoming from the coastline as well! Over!";
	playSoundUI ["ax_radioclick"];
	sleep 5;
	pl1 sidechat "Myrmekes this is Basilisk. Affirm. Getting the fuck out now.";
	playSoundUI ["ax_radioclick"];
};
sleep 5;
if ( (alive harpy) && (harpy in units pl1) ) then
{
	pl1 sidechat "Harpy is also returning with us.";
	playSoundUI ["ax_radioclick"];
	sleep 5;
};
if ( ((alive gyges1) || (alive gyges2) || (alive kinos1) || (alive kinos2) || (alive scylla)) && ((gyges1 in units pl1) || (gyges2 in units pl1) || (kinos1 in units pl1) || (kinos2 in units pl1) || (scylla in units pl1)) ) then
{
	pl1 sidechat "And, we also picked up some additional stragglers. Over.";
	playSoundUI ["ax_radioclick"];
	sleep 5;
	mekes commandchat "Myrmekes copies. Great work on the extraction!";
	playSoundUI ["ax_radioclick"];
	sleep 5;
	mekes commandchat "All of you disappear ASAP. Out.";
	playSoundUI ["ax_radioclick"];
}
else
{
	sleep 5;
	mekes commandchat "Disappear ASAP. Out.";
	playSoundUI ["ax_radioclick"];
};

["task_distract","SUCCEEDED"] call BIS_fnc_taskSetState;
[player, ["task_exfiltrate"], ["Retreat ASAP. The Americans have finally responded and are sending QRF!", "Exfiltrate out of the AO", ""], objNull, "ASSIGNED", 2, true, "Run"] call BIS_fnc_taskCreate;
[player, ["task_exfilnorth","task_exfiltrate"], ["Hide out in an abandoned house north of the AO.", "Retreat North", ""], [9289.29,17191.7,0], "CREATED", -1, true, "Run"] call BIS_fnc_taskCreate;
[player, ["task_exfilsouth","task_exfiltrate"], ["Hide out in an abandoned homestead south of the AO.", "Retreat South", ""], [8345.55,13989.1,0], "CREATED", -1, true, "Run"] call BIS_fnc_taskCreate;

_hunterspawnpoints = ["m_huntersp1", "m_huntersp2", "m_huntersp3", "m_huntersp4"];

[] spawn 
{
	4 fadeMusic 0;
	sleep 4;
	4 fadeMusic 1;
	playMusic "LeadTrack05_F_Tank";
	saveGame;
};

if (player inArea trg_aiacc) then
{
	_huntergroupf = [getmarkerpos "m_huntersp5",west,["B_Soldier_SL_F","B_soldier_LAT2_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_soldier_M_F"]] call BIS_fnc_SpawnGroup;
	[_huntergroupf] call RYD_CH_Herne;
	_duo1 = [player, player, blufor, ["EF_B_Marine_R_Des", "EF_B_Marine_LAT2_Des", "EF_B_Marine_GL_Des", "EF_B_Marine_AR_Des", "EF_B_Marine_Medic_Des","EF_B_Marine_Mark_Des"], 6, 1] spawn ax_fnc_spawnenemies;
	sleep 10;
	terminate _duo1;
}
else
{
	{
		if (side _x == west) then 
		{
			_x setSkill ["aimingAccuracy", 0];
			_x setSkill ["aimingShake", 0];
			_x setSkill ["reloadSpeed", 0];
		};
	}forEach allunits;
};

while {true} do
{
	sleep 180;
	_duo1 = [player, player, blufor, ["EF_B_Marine_R_Des", "EF_B_Marine_LAT2_Des", "EF_B_Marine_GL_Des", "EF_B_Marine_AR_Des", "EF_B_Marine_Medic_Des","EF_B_Marine_Mark_Des"], 6, 1] spawn ax_fnc_spawnenemies;
	sleep 10;
	terminate _duo1;
};