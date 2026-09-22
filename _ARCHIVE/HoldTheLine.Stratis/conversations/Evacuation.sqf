case "EvacStart": {
    3 enableChannel false;
    sleep 3;
    [[
        ["Zeus", "Gorgon, Minotaur, be advised! Evacuation is almost done. Keep it up! Zeus out.", 6, 6, "myin5"]
    ]] call EP_fnc_missionConversations;
    3 enableChannel true;
};

case "EvacEnd": {
    3 enableChannel false;
    sleep 3;
    [[
        ["Zeus", "All units, be advised. Evacuation is done. I repeat! Evacuation is finished.", 4, 6, "myin5"],
        ["Zeus", "Minotaur. Retreat to the designated west position.", 4, 6, "myin5"],
        ["Zeus", "Gorgon, listen up! You are gonna retreat to the Mike-26. Rescue helicopter is en route and will take you the hell out of here. Move up! Zeus, out.", 8, 6, "myin5"]
    ]] call EP_fnc_missionConversations;
    3 enableChannel true;
};