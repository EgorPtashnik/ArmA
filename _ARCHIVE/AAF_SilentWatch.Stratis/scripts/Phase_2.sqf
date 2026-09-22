sleep 1;

private _dialog = createDialog ["EP_ChoiceDialog", false];
private _sniperButton = _dialog displayCtrl 1600;
private _qrfButton = _dialog displayCtrl 1601;

_sniperButton ctrlAddEventHandler ["buttonClick", {
    closeDialog 1;
    Scenario = "SNIPER";
    [O_Compound_3_Defenders, true] call EP_fnc_showObjects;
    [O_Compound_3_LightPatrol, true] call EP_fnc_showObjects;
}];

_qrfButton ctrlAddEventHandler ["buttonClick", {
    closeDialog 1;
    Scenario = "QRF";
    { [_x, true] call EP_fnc_showObjects } forEach [I_QRF, I_QRF_APC, O_Compound_3_Defenders, O_Compound_3_LightPatrol];
    { _x disableAI "PATH" } forEach units I_QRF;
}];

waitUntil { !isNil "Scenario" };
I_QRF_GO = false;

if (Scenario == "SNIPER") then {
    savegame;
    waitUntil {sleep 1; !isSaving };

    waitUntil {sleep 1; (player distance2D (markerPos "O_MrkCompound_3")) < 600 };

    script = "p2_1" call EP_fnc_missionConversations;
    waitUntil { scriptDone script };

    sleep (random [10, 15, 20]);
    [I_QRF, true] call EP_fnc_showObjects;
    [I_QRF_APC, true] call EP_fnc_showObjects;
    script = "p2_3" call EP_fnc_missionConversations;
    waitUntil { scriptDone script };
    sleep 2;
    [player, "QRF_GO"] call BIS_fnc_addCommMenuItem;

} else {
    // Fade to black screen
    ["EP_Black", true] call BIS_fnc_blackOut;
    waitUntil { BIS_fnc_blackOut_completed };
    enableEnvironment false;
    enableRadio false;
    enableSentences false;

    // Switch to QRF soldier and unfade
    selectPlayer I_QrfPlayer;
    sleep 1;
    ["EP_Black", true] call BIS_fnc_blackIn;
    waitUntil { BIS_fnc_blackIn_completed };

    savegame;
    waitUntil {sleep 1; !isSaving };

    I_QRF_GO = true;
};

waitUntil {sleep 1; I_QRF_GO };

Trg_Compound_3_KIA enableSimulation true;
script = "p2_2" call EP_fnc_missionConversations;
waitUntil { scriptDone script };
[I_QRF, "O_MrkCompound_3", "AWARE", "FULL"] call EP_fnc_taskAttack;

// Loop to check for APC got stuck
spawn {
    private _pos = "O_MrkCompound_3" call EP_fnc_getPosition;
    private _lead = leader I_QRF_APC;
    while { (_lead distance2D _pos) > 100 } do {
        [I_QRF_APC, _pos] call EP_fnc_taskAttack;
        sleep 30;
    };
};

waitUntil {sleep 1; (combatBehaviour O_Compound_3_Defenders) == "COMBAT" };
[O_Compound_3_LightPatrol, "O_MrkCompound_3", "AWARE", "FULL"] call EP_fnc_taskAttack;
[O_Compound_3_QRF, true] call EP_fnc_showObjects;


waitUntil {sleep 1; triggerActivated Trg_Compound_3_KIA && (player distance2D (markerPos "O_MrkCompound_3")) < 50 };
script = "p2_4" call EP_fnc_missionConversations;

waitUntil { scriptDone script };

"Win" call BIS_fnc_endMission;
