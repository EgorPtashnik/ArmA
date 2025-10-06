// [group player, true] call EP_applySystem_CasualHealth;

params [
	"_units",
	["_regenHealth", true]
];

if (typeName _units == "GROUP") then {
	_units = units _units;
};

{
	// DAMAGE HANDLER: Headshot \ neck is a 100% kill, other parts are 10% of health each time
	_x addEventHandler ["HandleDamage", {
		private _unit = _this select 0;
		private _damage = _this select 2;
		private _hitPoint = _this select 7;
		private _directHit = _this select 8;
		private _fatalSelections = ["hithead", "hitface", "hitneck"];
		private _resultDamage = 0;
		_unit setVariable ["EP_lastHitTime", ( time + 5 ) ];

		if (_hitPoint in _fatalSelections) then {
			_unit setDamage 1;
			_unit removeEventHandler [_eventName, _eventHandler];
		};

		if (_selection isEqualTo "") then {
			_resultDamage = 0.1;
		};

		if (!_directHit) then {
			_resultDamage = _damage;
		};

		_resultDamage;
	}];

} forEach _units;

// Loop to provide heal regeneration if needed
if (_regenHealth) then {
	private [ "_unitDamage", "_lastHitTime" ];
	while { _units findIf { alive _x; } > 0 } do {
		{
			if (alive _x) then {
				_unitDamage = damage _x;
				_lastHitTime = _x getVariable ["EP_lastHitTime", time];
				if ( _unitDamage > 0.8 && _lastHitTime <= time ) then {
					_x setDamage ( _unitDamage + 0.05 );
				};
			};
		}	forEach _units;
		sleep 1;
	};
};