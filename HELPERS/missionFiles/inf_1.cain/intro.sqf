0 fadeSound 0;
enableRadio false;
cutText ["", "BLACK IN", 999];
sleep 5;
private _handle = [
	"Колгуев,",
	"Близ ремонтной базы СССР",
	"Подразделение Viper..."
] spawn BIS_fnc_infoText;
cutText ["", "BLACK IN", 7];
5 fadeSound 1;
enableRadio true;
waitUntil {
	sleep 1;
	scriptDone _handle;
};

_handle = ["intro-1"] call fnc_comms;

waitUntil {
	sleep 1;
	scriptDone _handle;
};
sleep 2;

_handle = ["intro-2"] call fnc_comms;

waitUntil {
	sleep 1;
	scriptDone _handle;
};

f_introDone = true;
