// [group1, true] call EP_fnc_showHideUnits;

params [
  "_units",
  ["_toHide", true]
];

if (typeName _units == "GROUP") then {
  _units = units _units;
};

private _vehicle;
{
  _vehicle = vehicle _x;
  _vehicle enableSimulation !_toHide;
  _vehicle hideObject _toHide;
  _vehicle setCaptive _toHide;
  _vehicle allowDamage !_toHide;
} forEach _units;

_units;