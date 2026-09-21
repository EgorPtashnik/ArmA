// Finds safe positions for AAF squad near the Hunter's cabin, teleports them there and gives WP to/near the cabin

_position01 = (getPosATL BIS_ForestPos01) findEmptyPosition [0,20,"I_Soldier_F"];
_position02 = (getPosATL BIS_ForestPos02) findEmptyPosition [0,20,"I_Soldier_F"];
_position03 = (getPosATL BIS_ForestPos03) findEmptyPosition [0,20,"I_Soldier_F"];
_position04 = (getPosATL BIS_ForestPos04) findEmptyPosition [0,20,"I_Soldier_F"];

BIS_Unit01 setPosATL _position01;
BIS_Unit02 setPosATL _position02;
BIS_Unit03 setPosATL _position03;
BIS_Unit04 setPosATL _position04;

_null = BIS_Unit01 spawn {
	_this move (getPosATL BIS_Unit01Pos);
	sleep 10;
	waitUntil {sleep 1; unitReady _this};
	[_this,"WATCH1","ASIS"] call BIS_fnc_ambientAnim;
};

_null = BIS_Unit02 spawn {
	_this move (getPosATL BIS_Unit02Pos);
	sleep 10;
	waitUntil {sleep 1; unitReady _this};
	[_this,"WATCH2","ASIS"] call BIS_fnc_ambientAnim;
};

_null = BIS_Unit03 spawn {
	_this move (getPosATL BIS_Unit03Pos);
	sleep 10;
	waitUntil {sleep 1; unitReady _this};
	[_this,"WATCH1","ASIS"] call BIS_fnc_ambientAnim;
};

_null = BIS_Unit04 spawn {
	_this move (getPosATL BIS_Unit04Pos);
	sleep 10;
	waitUntil {sleep 1; unitReady _this};
	[_this,"WATCH2","ASIS"] call BIS_fnc_ambientAnim;
};
