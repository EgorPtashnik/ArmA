case "NearBase": {
    3 enableChannel false;
        sleep 3;
        [[
            ["Gorgon-1", "Zeus, Gorgon-1. Approaching Mike-26. ETA - 2 minutes. What's the status on extraction heli?", 5, 6, "myin2"],
            ["Zeus", "Air asset is en route. Dig in and hold the position if needed. He will be there. Zeus out.", 5, 6, "myin5"]
        ]] call EP_fnc_missionConversations;
    3 enableChannel true;
};

case "HeliDestroyed": {
    3 enableChannel false;
        sleep 3;
        [[
            ["Gorgon-1", "What the fuck!?", 3, 6, "myin2"],
            ["Gorgon-1", "Zeus, we've lost heli. I repeat! Extraction helicopter is neutralized. How copy? Over.", 5, 6, "myin2"]
        ]] call EP_fnc_missionConversations;
        sleep 4;
        [[
            ["Zeus", "Zeus here. We are sending the boat to south-eastern beach line.", 4, 6, "myin2"],
            ["Zeus", "Move there as quick as you can. Enemy reinforcements have arrived not when we expected. God speed. Zeus out.", 7, 6, "myin2"]
        ]] call EP_fnc_missionConversations;

    3 enableChannel true;
};

case "Extracted": {
    3 enableChannel false;
        sleep 3;
        [[
            ["Gorgon-1", "Zeus, this is Gorgon. We see the boat. Preparing for extraction. Gorgon-1 out.", 5, 6, "myin2"]
        ]] call EP_fnc_missionConversations;

    3 enableChannel true;
};