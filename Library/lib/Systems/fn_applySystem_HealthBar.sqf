// [] spawn EP_applySystem_HealthBar;
params [
	["_healthCharNumber", 66],
	["_healthSymbol", "I"],
	["_healthMediumThreshold", 20],
	["_healthHighThreshold", 40],
	["_healthPosFromBottomPerc",1.62],
	["_healthPosFromRightPerc", 1.616],
	["_healthColorMap", ["#ff6565", "#ffae8e", "#ffffff"]],
	["_updateOnEach", 0.1]
];

private _healthBarHandler = {
	params [
		"_charNumber",
		"_symbol",
		"_mediumThreshold",
		"_highThreshold",
		"_posFromBottomPerc",
		"_posFromRightPerc",
		"_colorMap"
	];

	private _health = damage player;
	private _savedHealth = player getVariable ["EP_healthBarDamage", objNull];

	if ( (_savedHealth !== _health) || (isNull _savedHealth) ) then {

		private _displayString = "";
		private _counter = _charNumber - _health * _charNumber;
		for "_i" from 1 to _counter do {
			_displayString = _displayString + _symbol;
		};

		private _color = _colorMap select 0;
		if (_counter > _mediumThreshold) then { _color = ( _colorMap select 1 ); };
		if (_counter > _highThreshold) then { _color = ( _colorMap select 2 ); };
		
		// Show Health Bar on GUI
		[
				format ["<t font='PuristaBold' color='%1' align='left' shadow='2' size='0.5'>%2</t>", _color, _displayString],
				safeZoneW + safeZoneX * _posFromRightPerc,
				safeZoneH + safeZoneY * _posFromBottomPerc,
				1, 0, 0, 1
		] spawn BIS_fnc_dynamicText;

		player setVariable ["EP_healthBarDamage", _health];
	};
};

while { alive player } do {
	if (vehicle player isEqualTo player) then {
		[
			_healthCharNumber,
			_healthSymbol,
			_healthMediumThreshold,
			_healthHighThreshold,
			_healthPosFromBottomPerc,
			_healthPosFromRightPerc,
			_healthColorMap
		] call _healthBarHandler;
	} else {
		["", -1, -1, 0, 0, 0, 1] spawn BIS_fnc_dynamicText;
		player setVariable ["EP_healthBarDamage", objNull];
	};
	sleep _updateOnEach;
};

["", -1, -1, 0, 0, 0, 1] spawn BIS_fnc_dynamicText;
