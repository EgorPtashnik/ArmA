case "NearBase": {
    3 enableChannel false;
        sleep 3;
        [[
            ["Gorgon-1", "Zeus, Gorgon-1. Approaching Mike-26. ETA - 2 minutes. What's the status on extraction heli?", 5, 6, "myin2"],
            ["Zeus", "Air asset is en route. Dig in and hold the position if needed. He will be there. Zeus out.", 5, 6, "myin5"]
        ]] call EP_fnc_missionConversations;
    3 enableChannel true;
};