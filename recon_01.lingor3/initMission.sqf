//***************
//Debriefing texts
//***************
"Compromised" setDebriefingText [
    "Вас обнаружили",
    "После обнаружения бандиты передислоцировали объект. Командованию ВСБ потребуется немало ресурсов для определения новой локации.",
    "Дальнейшее выполнение операции невозможно."
];

"Aborted" setDebriefingText [
    "Информация не найдена",
    "Локация объекта так и не была обнаружена. Командование ВСБ отозвала отряд Cobra обратно на базу.",
    "Дальнейшее выполнение операции невозможно."
];

"HVTKIA" setDebriefingText [
    "Package погиб",
    "Объект был убит, а вместе с ним и вся информация об активности бандитов в окрестной зоне.",
    "Дальнейшее выполнение операции невозможно."
];

//***************
//Groups/Player
//***************
EP_Player setIdentity "PlayerIdentity";
group EP_Player setGroupId ["Cobra"];

//***************
//Friendly fire
//***************
["Init", [units group player]] call BIS_fnc_moduleFriendlyFire;


//***************
//Animations
//***************
{[_x, "SitArmed", [false, true, [["sitHeight", 0], ["dirFix", getDir _x]]]] call EF_fnc_ambientAnim} forEach units EP_Bandits03_1;
{if (vehicle _x == _x) then {[_x, "Watch"] call EF_fnc_ambientAnim}} forEach units EP_Bandits04_1;
[EP_Operator01, "KneelArmed"] call EF_fnc_ambientAnim;
[EP_Operator02, "StandArmed"] call EF_fnc_ambientAnim;
[EP_Operator03, "KneelArmed"] call EF_fnc_ambientAnim;
[EP_Engineer, "Watch"] call EF_fnc_ambientAnim;


//***************
//HVT
//***************
private _hvtPos = selectRandom ("pos_hvt" call EP_fnc_collectVariables);
EP_HVT setPos getPosATL _hvtPos;
EP_HVT setDir getDir _hvtPos;
EP_HVT setCaptive true;
EP_HVT disableAI "ALL"; 
EP_HVT switchMove "Acts_ExecutionVictim_Loop";



//***************
//Hide units, markers disable triggers
//***************
[EP_Bandits02, EP_Bandits03_1, EP_Bandits03_2, EP_Bandits04_1, EP_HVT, "Extraction"] call EP_fnc_deactivateUnits;
{_x enableSimulation false} forEach [trg_Detected01, trg_Detected02, trg_Detected03, trg_EngineSound];
{_x setMarkerAlpha 0} forEach ["mrk_Camp03", "mrk_Camp04", "mrk_Extraction"];

//***************
//Loadouts
//***************
spawn {
    waitUntil {time > 0};
    {_x setUnitLoadout getUnitLoadout selectRandom [Loadout_Operator01, Loadout_Operator02]} forEach [
        EP_Player, EP_Operator01, EP_Operator02, EP_Operator03
    ];

    //Turn player NVG on start
    EP_Player action ["NVGoggles", EP_Player];
};

//***************
//Hold actions
//***************
//HVT
private _icon = "a3\ui_f\data\igui\cfg\holdactions\holdaction_unbind_ca.paa";
[
    EP_HVT, "Освободить", _icon, _icon, "true", "true",
    {playSound "ace_wardrobe_fabric_16"},
    {
        private _progressTick = _this select 4;
	    if ((_progressTick % 2) == 0) exitwith {}; 
        private _coef = _progressTick / 24;
        playSound3D ["A3\Sounds_F_Orange\MissionSFX\Orange_Action_Wheel.wss", EP_Player, false, getPosASL EP_Player, 1, 0.9 + 0.2 * _coef];
    },
    {
        EP_HVT switchMove "Acts_ExecutionVictim_Unbow";
        removeGoggles EP_HVT;
        EP_HVT addVest "UK3CB_V_Carrier_Rig_BLK";

        sleep 3;
        EP_HVT enableAI "ALL";
        EP_HVT setCaptive false;
        [EP_HVT] joinSilent player;
    },
    {}, [], 1.5, 1000, true, false, true, 2
] call BIS_fnc_holdActionAdd;

//Phone
_icon = "a3\ui_f\data\igui\cfg\holdactions\holdaction_search_ca.paa";
[
    EP_Phone, "Осмотреть", _icon, _icon, "'Camp02' call BIS_fnc_taskCompleted", "true",
    {},
    {
        private _progressTick = _this select 4;
	    if ((_progressTick % 2) == 0) exitwith {}; 
        private _coef = _progressTick / 24;
        playSound3D ["A3\Sounds_F_Orange\MissionSFX\Orange_Action_Wheel.wss", EP_Player, false, getPosASL EP_Player, 1, 0.9 + 0.2 * _coef];
    },
    {EP_EvidenceFound = true},
    {}, [], 0.5, 1000, true, false, true, 5
] call BIS_fnc_holdActionAdd;

//Generator
_icon = "a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa";
[
    EP_Generator, "Саботировать", _icon, _icon, "true", "true",
    {},
    {
        private _progressTick = _this select 4;
	    if ((_progressTick % 2) == 0) exitwith {}; 
        private _coef = _progressTick / 24;
        playSound3D ["A3\Sounds_F_Orange\MissionSFX\Orange_Action_Wheel.wss", EP_Player, false, getPosASL EP_Player, 1, 0.9 + 0.2 * _coef];
    },
    {
        player playAction "PutDown";
        sleep 1;
        playSound3D ["A3\Sounds_F\sfx\special_sfx\sparkles_wreck_1.wss", trg_EngineSound, false];
        sleep 1;
        {_x switchLight "OFF"} forEach getMissionLayerEntities "Lights 4" # 0;
        sleep 1;
        deleteVehicle trg_EngineSound; 
    },
    {}, [], 2, 1000, true, false, true, 3
] call BIS_fnc_holdActionAdd;
