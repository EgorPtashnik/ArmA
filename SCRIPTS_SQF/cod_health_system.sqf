/**
    Система здоровья из Call Of Duty / Battlefield с регенерацией здоровья после повреждения
 */

{
    {
        _x setVariable ["healing", false];
        _x addEventHandler ["Hit", {
	        params ["_unit", "_source", "_damage", "_instigator"];
            private _unitDamage = damage _unit + _damage;
            private _isHealing = _unit getVariable "healing";

            if (_unitDamage > 0.4 && !_isHealing ) then {
                _unit setCaptive true;
                _unit setVariable ["healing", true];
                [_unit] spawn {
                    private _unit = _this select 0;
                    private _unitDamage = damage _unit;
                    while {_unit getVariable "healing" && alive _unit} do {
                        private _unitDamage = damage _unit - 0.025;
                        _unit setDamage _unitDamage;
                        hintSilent format ["Healing %1", str _unitDamage];
                        if (_unitDamage <= 0.2) then {
                            _unit setVariable ["healing", false];
                        };
                        sleep 1;
                    };
                    _unit setVariable ["healing", false];
                };
            };
            
            _damage;
        }];
    } forEach allUnits
} call CBA_fnc_directCall;
