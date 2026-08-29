params ["_vehicle"];

if (!alive _vehicle) exitWith {};

private _alarmSound = "Orange_Car_Alarm_Loop_01";
private _alarmDuration = 10;

_vehicle setVariable ["alarmTriggered", true, true];

[_vehicle, _alarmSound, _alarmDuration] spawn {
    params ["_veh", "_sound", "_duration"];
    private _timeLimit = time + _duration;
    while {time < _timeLimit && !isNull driver _veh} do {
        _veh say3D _sound;
        sleep 2; // Adjust delay between sounds
    };
    _veh setVariable ["alarmTriggered", false, true];
};