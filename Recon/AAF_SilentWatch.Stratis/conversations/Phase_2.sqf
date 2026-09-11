case "p2_1": {
    [[
        ["REAPER ACTUAL", "Phalanx, this is Reaper. Getting closer to the compound.", 4],
        ["PHALANX", "Good. Check the area for any threats. Snake will wait for your sygnal to start the assault. Phalanx out.", 5]
    ]] call EP_fnc_missionConversations;
};

case "p2_2": {
    [[
        ["REAPER ACTUAL", "Snake, come in. You are free to start the assault. How copy? Over.", 5],
        ["SNAKE ACTUAL", "Solid copy. Everyone - let's move out! Go! Go! Go!", 4]
    ]] call EP_fnc_missionConversations;
};

case "p2_3": {
    [[
        ["SNAKE ACTUAL", "Be adviced! We are in position and ready to advance. Snake, out.", 4]
    ]] call EP_fnc_missionConversations;
};

case "p2_4": {
    private _actor = "REAPER ACTUAL";
    if (Scenario == "QRF") then {
        _actor = "SNAKE ACTUAL";
    };
    [[
        [_actor, "Phalanx, come in. We took the camp but there is no sign of the warlord. Seemd slicky bastard went off. How copy? Over.", 6],
        ["PHALANX", "Solid copy. Dig in and wait for the reinforcements. At least he will think twice before dealing with us.", 5],
        ["PHALANX", "Outstanding job! RTB after reinforcements and rest well. Phalanx out.", 5]
    ]] call EP_fnc_missionConversations;
};