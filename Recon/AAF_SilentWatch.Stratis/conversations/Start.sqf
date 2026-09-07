case "Start_1": {
    [[ ["REAPER ACTUAL", "Alright, that's enough. We can take it on foot from here.", 3] ], false] call EP_fnc_missionConversations;
};

case "Start_2": {
    [[
        ["REAPER ACTUAL", "Phalanx, this is Reaper Actual. We've reached the overwatch position. How copy? Over.", 5],
        ["PHALANX", "Solid copy. Observe and update on situation.", 2],
    ]] call EP_fnc_missionConversations;
};