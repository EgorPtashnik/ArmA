case "C1": {
    [[
        ["Dagger Actual", "Listen up, Dagger! Check weapons and gear. One minute to drop!", 3, 1, "C1_1"],
        ["Dagger Actual", "Our objective is the coastal CSAT outpost. We wipe out the outer perimeter and dig in.", 5, 1, "C1_2"],
        ["Dagger Actual", "As soon as that ramp drops, haul ass outside and follow me!", 2, 1, "C1_3"]
    ]] call EP_fnc_missionConversations;
};

case "C2": {
    [[
        ["Dagger Actual", "Alright, we're at the LZ! Unload, unload! Go, go, go!", 4, 1, "C2_1"]
    ]] call EP_fnc_missionConversations;
};

case "C3": {
    [[
        ["Dagger Actual", "Outpost is clear! Set up a perimeter, check for wounded.", 3, 1, "C3_1"],
        ["Thunderbolt", "Dagger, this is Thunderbolt. Satellites are picking up thermal signatures in your sector.", 4, 1, "C3_2"],
        ["Thunderbolt", "A CSAT QRF is moving on your position at full speed. Infantry and light armor.", 4, 1, "C3_3"],
        ["Dagger Actual", "Copy that, Thunderbolt. Squad, space out. Prepare to engage!", 3, 1, "C3_4"]
    ]] call EP_fnc_missionConversations;
};

case "C4": {
    [[
        ["Raven-1", "Dagger, this is Raven-1. We're on approach to your LZ. Carrying three squads of infantry.", 4, 1, "C4_1"],
        ["Dagger Actual", "Here comes the cavalry. Clear the landing zone, boys, it's about to get crowded.", 5, 1, "C4_2"]
    ]] call EP_fnc_missionConversations;
};

case "C5": {
    [[
        ["Thunderbolt", "Attention all squad leaders, listen up for orders.", 2, 1, "C5_1"],
        ["Thunderbolt", "Charlie Squad — you're moving to assault Objective Alpha, tie down the enemy.", 4, 1, "C5_2"],
        ["Thunderbolt", "Alpha, Bravo, and Dagger Squads — we are pushing as one fist toward Objective Bravo.", 4, 1, "C5_3"],
        ["Thunderbolt", "Objective Bravo is their main logistics hub. Expect heavy infantry resistance.", 4, 1, "C5_4"],
        ["Charlie Actual", "Copy that, Thunderbolt. Charlie Squad moving to Objective Alpha. Out.", 3, 1, "C5_5"],
        ["Dagger Actual", "Copy, Thunderbolt. Moving out!", 1, 1, "C5_6"],
        ["Alpha Actual", "Alpha is en route.", 1, 1, "C5_7"],
        ["Bravo Actual", "Bravo stepping off.", 1, 1, "C5_8"],
        ["Thunderbolt", "Hit them from multiple flanks. Use your momentum and clear the area quickly. Thunderbolt out.", 4, 1, "C5_9"]
    ]] call EP_fnc_missionConversations;
};

case "C6": {
    [[
        ["Charlie Actual", "Thunderbolt, this is Charlie. Objective Alpha is secure. I repeat! Alpha is clear! Over.", 5, 1, "C6_1"],
        ["Thunderbolt", "Outstanding work, Charlie. Solid copy. Out.", 2, 1, "C6_2"]
    ]] call EP_fnc_missionConversations;
};

case "C7": {
    [[
        ["Dagger Actual", "Thunderbolt, this is Dagger. Objective Bravo is clear! I repeat, the supply base is under allied control.", 8, 1, "C7_1"],
        ["Bravo Actual", "Confirming that. We've cleared the last of the hangars. Enemy resistance neutralized.", 4, 1, "C7_2"],
        ["Thunderbolt", "Copy. Satellites confirm the clear. Excellent job expanding the beachhead.", 4, 1, "C7_3"],
        ["Thunderbolt", "Hold your positions until the main force and logistics arrive. Good work. Thunderbolt out.", 4, 1, "C7_4"]
    ]] call EP_fnc_missionConversations;
};