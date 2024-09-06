playMusic "EventTrack01a_F_Tacops";
addMusicEventHandler ["MusicStop", {
	private _music = [
		"EventTrack01a_F_Tacops",
		"EventTrack01b_F_Tacops",
		"EventTrack02a_F_Tacops",
		"EventTrack02b_F_Tacops",
		"EventTrack03a_F_Tacops",
		"EventTrack03b_F_Tacops"
	] call BIS_fnc_selectRandom;
	playMusic _music;
}];

player enableStamina false;
player switchCamera "EXTERNAL";

{ _x enableSimulation false; _x hideObject true; } forEach units group_enemy_1;
group_enemy_1 deleteGroupWhenEmpty true;

{ _x enableSimulation false; _x hideObject true; } forEach units group_enemy_2;
group_enemy_2 deleteGroupWhenEmpty true;

{ _x enableSimulation false; _x hideObject true; } forEach units group_enemy_3;
group_enemy_3 deleteGroupWhenEmpty true;

{ _x enableSimulation false; _x hideObject true; } forEach units group_enemy_4;
group_enemy_4 deleteGroupWhenEmpty true;

{
	_x allowFleeing 0;
	_x disableAI "PATH";
	_x allowDamage false;
	if ( leader _x != _x) then {
		_x doWatch [3682.74,3256.93,0];
		_x setUnitPos "MIDDLE";
	} else {
		_x setUnitPos "UP";
	};
} forEach units group_friend_1;
group_friend_1 deleteGroupWhenEmpty true;

apc allowDamage false;
apcC allowDamage false;
apcD allowDamage false;
apcG allowDamage false;

{ _x enableSimulation false; _x hideObject true; _x allowFleeing 0; } forEach units group_friend_2;
group_friend_2 deleteGroupWhenEmpty true;
{ _x enableSimulation false; _x hideObject true; _x allowFleeing 0; } forEach units group_friend_3;
group_friend_3 deleteGroupWhenEmpty true;
{ _x enableSimulation false; _x hideObject true; _x allowFleeing 0; } forEach units group_friend_4;
group_friend_4 deleteGroupWhenEmpty true;
{ _x enableSimulation false; _x hideObject true; _x allowFleeing 0; } forEach units group_friend_5;
group_friend_5 deleteGroupWhenEmpty true;

[
	player, // OWNER
	"task_id", // ID: Can be [task_id, parent_id]
	["Захватите город. Выбейте все силы противника.","Освобождение"], // DESCRIPTION AND TITLE
	objNull, // DESTINATION: [X,Y,Z]
	"ASSIGNED", // STATE: CREATED, ASSIGNED, AUTOASSIGNED ("ASSIGNED" when no task is assigned yet, otherwise "CREATED"), SUCCEEDED, FAILED, CANCELED
	-1, //PRIORITY When the current task is completed, the system selects the one with the largest priority >= 0. To avoid auto assignment of that task, give it a priority of -1.
	true, // SHOW NOTIFICATION
	"attack" // task icons (see pictures/task_icons)
] call BIS_fnc_taskCreate;
