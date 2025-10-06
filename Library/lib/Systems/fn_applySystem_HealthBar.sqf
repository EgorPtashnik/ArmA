// call EP_applySystem_HealthBar;

[] spawn {
	private ["_health", "_displayString", "_counter", "_color", "_colorMap"];
	while { true } do {
		if (vehicle player isEqualTo player) then {
			_displayString = "";
			_health = damage player;
			_counter = 66 - _health * 66;
			for "_i" from 1 to _counter do {
				_displayString = _displayString + "I";
			};
			_color = "#ff6565";
			if (_counter > 20) then {
				_color = "#ffae8e"
			};
			if (_counter > 40) then {
				_color = "#ffffff"
			};

			[
				format ["<t font='PuristaBold' color='%1' align='left' shadow='2' size='0.5'>%2</t>", _color, _displayString],
				safeZoneW + safeZoneX * 1.616,
				safeZoneH + safeZoneY * 1.62,
				1, 0, 0, 1
			] spawn BIS_fnc_dynamicText;
			sleep 0.1;
		} else {
			["", -1, -1, 0, 0, 0, 1] spawn BIS_fnc_dynamicText;
		}
		
	};
};
