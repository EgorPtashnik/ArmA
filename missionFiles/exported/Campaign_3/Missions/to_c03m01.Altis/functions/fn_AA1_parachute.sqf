// Create falling parachute of existing object

params ["_object"];

private _para = createVehicle ["B_Parachute_02_F", getPos _object, [], 0, "FLY"]; 
_object attachTo [_para, [0, 0, 0]];

private _pos = getPos _para;
_pos set [2, (_pos select 2) + 0];
_para setPos _pos;

[_para, _object] spawn {
	params ["_para", "_crate"];
	waitUntil {sleep 0.2; (getPosATL _para) select 2 < 2}; 
	detach _crate;
};