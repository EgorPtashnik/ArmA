case "CallTigris": {
    3 enableChannel false;
    sleep 1;
    [[
        ["Gorgon-1", "Gorgon-4, requesting target assistance on designated coordiantes. How copy? Over.", 4, 6, "myin2"],
        ["Gorgon-4", "Solid copy, Gorgon-1. Preparing weapons.", 2, 6, "myin2"]
    ]] call EP_fnc_missionConversations;
    3 enableChannel true;
};

case "CallTigris_Done": {
    3 enableChannel false;
    sleep 1;
    [[
        ["Gorgon-4", "Gorgon-1, be adviced. Target is KIA. Gorgon-4, out.", 3, 6, "myin2"]
    ]] call EP_fnc_missionConversations;
    3 enableChannel true;
};

case "CallTigris_Failed": {
    3 enableChannel false;
    [[
        ["Gorgon-4", "Negative on target. Gorgon-4, over.", 3, 6, "myin2"]
    ]] call EP_fnc_missionConversations;
    3 enableChannel true;
};