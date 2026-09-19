//************************************************************************************************************
// SET TASK, PREPARE EVAC START, SAVEGAME
//************************************************************************************************************
S_DynamicMedic = execVM "scripts\1_Defend\DynamicMedic.sqf";
"Defend" call EP_fnc_missionTasks;

sleep 2;

savegame;

//************************************************************************************************************
// TRIGGER TO START EVACUATION
//************************************************************************************************************
private _trg =  execVM "scripts\1_Defend\ProcessEvacuation.sqf";

sleep (selectRandom [10,20,30]);

// Spawn first wave
[6] call EP_spawnWave;
private _cap_casualties = 2;

// First wave KIA
waitUntil {sleep 1; {alive _x} count EP_WavesUnits < _cap_casualties };

// Spawn second wave
sleep 5;
[12] call EP_spawnWave;
EP_WavesUnits = (EP_WavesUnits select { alive _x });
_cap_casualties = (count EP_WavesUnits) * 0.2;

// Second wave KIA
waitUntil {sleep 1; {alive _x} count EP_WavesUnits < _cap_casualties };

// Spawn third wave
sleep 5;
[10] call EP_spawnWave;
EP_WavesUnits = (EP_WavesUnits select { alive _x });
_cap_casualties = (count EP_WavesUnits) * 0.2;

//************************************************************************************************************
// PHASE LOOP
//
// After third wave is spawned Evac is started.
// Continue spawning waves and add a little bit of random spawning around (Minotaur death or Heli spawn)
//************************************************************************************************************
private _sendHeli = false;
private _killMinotaur = false;
private _minotaurAlive = true;
while { sleep 5; true } do {
    // Wave KIA
    if ( {alive _x} count EP_WavesUnits < _cap_casualties) then {
        [6] call EP_spawnWave;

        sleep 10;

        // 25% to spawn a helicopter on each new wave
        _sendHeli = selectRandom [true, false, false, false];
        if (_sendHeli) then {
            _sendHeli = false;
            spawn EP_spawnHeli;
        };

        // 33% to kill some minotaur group and spawn flank attack
        if (_minotaurAlive) then {
            _killMinotaur = selectRandom [true, false, false];
            if (_killMinotaur) then {
                _minotaurAlive = false;
                execVM "scripts\1_Defend\MinotaurKIA.sqf";
            };
        };
    };

    // Exit if evacuation is done
    if (scriptDone _trg) exitWith {
         //Cleanup wave units after player is far
         execVM "scripts\1_Defend\Cleanup.sqf"
    };
};

sleep 5;
["Defend", true] call EP_fnc_missionTasks;

//************************************************************************************************************
// NEXT PHASE
//************************************************************************************************************
execVM "scripts\2_Retreat\__Phase_2_Retreat.sqf";
