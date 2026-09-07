case "p1_1": {
    [[
        ["REAPER ACTUAL", "Phalanx, there is nothing in here. I repeat. I don't see any documentation or other intel sources. Over.", 5],
        ["REAPER ACTUAL", "Phalanx?", 7],
		["PHALANX", "Reaper, be adviced. Our sattelites spotted another compound near your position.", 4],
		["PHALANX", "Looks like another guerilla compound. You are free to engage, this is restricted area.", 5],
		["PHALANX", "I'll be waiting for your report. Phalanx out.", 4]
    ]] call EP_fnc_missionConversations;
};

case "p1_2": {
    [[
        ["REAPER ACTUAL", "Phalanx, come in. I think I got something for you. Grid 055047. Check the area. Over.", 5],
        ["PHALANX", "Copy that, Reaper. Wait one.", 8],
		["PHALANX", "Target confirmed! Move there ASAP. Provide sniper support, I'm sending QRF.", 5],
		["PHALANX", "Snake, come in. Mouse in the box. Grid 055047. Advance now! How copy? Over.", 5],
		["SNAKE ACTUAL", "Solid copy, Phalanx. ETA 5 minutes. Moving out. Over.", 4],
		["PHALANX", "Copy that. Reaper, when in position, check the enemy defences and signal for Snake attack.", 6],
		["REAPER ACTUAL", "Roger that, on my way! Reaper out.", 4]
    ]] call EP_fnc_missionConversations;
};