// [group player, true] call EP_applySystem_CasualHealth;

params [
	"_units",
	["_regenHealth", true],
	["_defaultDamage", 0.1],
	["_headshotKill", true]	
];

if (typeName _units == "GROUP") then {
	_units = units _units;
};

{
	_x setVariable ["EP_defaultDamage", _defaultDamage];
	_x setVariable ["EP_headshotKill", _headshotKill];
	_x setVariable ["EP_health", 0];

	_x addEventHandler ["HandleDamage", {
		private _selection = _this select 1;
		private _damage = _this select 2;
		private _directHit = _this select 8;
		if (_selection == "head" || !_directHit) exitWith { _damage; };
		0
	}];
	_x addEventHandler ["Hit", {
		params ["_unit"];

		private _headDamage = 0;
		if (_unit getVariable ["EP_headshotKill", false]) then {
			_headDamage = _unit getHit "head";
		};
		// hint str (_unit getHit "head");
		if (_headDamage >= 1) exitWith {
			_unit setDamage 1;
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		};

		_damage = (_unit getVariable "EP_health") + (_unit getVariable "EP_defaultDamage");
		_unit setDamage _damage;
		_unit setVariable ["EP_health", _damage];

		_unit setVariable ["EP_lastHitTime", ( time + 5 ), true];	
	}];
} forEach _units;

// Loop to provide heal regeneration if needed
if (_regenHealth) then {
	[_units] spawn {
		params ["_units"];

		private [ "_unitDamage", "_lastHitTime" ];
		while { (_units findIf { alive _x; }) > -1 } do {
			{
				if (alive _x) then {
					_unitDamage = _x getVariable ["EP_health", 0];
					_lastHitTime = _x getVariable ["EP_lastHitTime", time];
					if ( _unitDamage > 0.2 && _lastHitTime <= time ) then {
						_unitDamage = _unitDamage - 0.05;
						_x setDamage _unitDamage;
						_x setVariable ["EP_health", _unitDamage];
					};
				};
			}	forEach _units;
			sleep 1;
		};
	}
};