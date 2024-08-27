/*
	creates agent in place of driver and disable sentences
	original script is commented out
	this one if from init.sqf file
*/

enableSentences false;
playerVeh setVehicleLock "LOCKED";

private _ai = createAgent [ typeOf gunner playerVeh, [0,0,0], [], 0, "NONE"];
_ai allowDamage false;
_ai moveInDriver playerVeh;


/* 
this call {
    if (isServer) then {
        _this lockTurret [[0], true];
        _this lockTurret [[0,0], true];
        _this lockCargo true;
        _this addMPEventHandler ["MPKilled", {
            if (isServer) then {
                _d = driver (_this select 0);
                _g = gunner (_this select 0);
                if (!isNull _d) then {deleteVehicle _d};
                if (!isNull _g) then {_g setDamage 1};
            };
        }];
    };
    if (!isDedicated) then {
        _this addEventHandler ["GetIn", {
            enableSentences false;
            _tank = _this select 0;
            _unit = _this select 2;
            _unit allowDamage false;
            _unit action ["EngineOn", _tank];
            _unit action ["MoveToGunner", _tank];
            _tank lock true;
            _tank switchCamera "EXTERNAL";
            _tank addAction [localize "str_action_getout", {
                _this select 0 removeAction (_this select 2);
                _this select 1 action ["GetOut", _this select 0];
            }, "", 3, false, true, "GetOver"];
            _tank spawn {
                waitUntil {!isNull gunner _this};
                _ai = createAgent [
                    typeOf gunner _this, [0,0,0], [], 0, "NONE"
                ];
                _ai allowDamage false;
                _ai moveInDriver _this;
            };
        }];
        _this addEventHandler ["GetOut", {
            _tank = _this select 0;
            _unit = _this select 2;
            deleteVehicle driver _tank;
            _unit allowDamage true;
            _unit action ["EngineOff", _tank];
            _tank lock false;
            enableSentences true;
        }];
    };
};
*/
