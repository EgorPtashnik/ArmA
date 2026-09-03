// Zeus
// Minotaur-Red
// Gorgon-1

// Intro phase comms
#include "conversations\Intro.sqf";

// Defend phase comms
#include "conversations\Evacuation.sqf";
#include "conversations\TigrisSupport.sqf";
case "MinoDead": {
    3 enableChannel false;
        sleep 3;
        [[
            ["Zeus", "Gorgon, come in! Enemy has breached minotaur defences. Prepare for flank attack with light APC escort!", 5, 6, "myin5"],
            ["Gorgon-1", "Roger that, Zeus. Preparing our AT weapons. Gorgon, out.", 6, 6, "myin2"]
        ]] call EP_fnc_missionConversations;
    3 enableChannel true;
};

// Retreat phase comms
#include "conversations\Retreat.sqf";
