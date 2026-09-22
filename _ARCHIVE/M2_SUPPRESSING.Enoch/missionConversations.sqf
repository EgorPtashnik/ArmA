case "landed": {
	[[
		["Ten-2", "On the deck. Parachutes detached. Check your gear.", 0],
		["Ten-3", "Ten-2, this is Ten-3. All elements are down and accounted for. No injuries.", 5],
		["Ten-2", "Copy that. Activate NVGs and check weapons. The enemy artillery base is one kilometers south.", 13],
		["Ten-3", "Understood. Shifting to stealth frequency. Moving out towards the LZ now. Out.", 23]
	], 7] call EP_fnc_showSubtitles;
};

case "atLZ": {
	[[
		["Ten-2", "Ten-1, this is Ten-2. All squad members have gathered at the rendezvous point. We are fully assembled.", 0],
		["Ten-1", "Copy that, Ten-2. Glad to hear you're in one piece. Sitrep on your current visibility and local opposition.", 6],
		["Ten-2", "The drop area is quiet. Zero enemy contact so far. We are maintaining absolute light and radio discipline.", 12],
		["Ten-1", "Understood. The window of opportunity is narrow. Proceed to the perimeter of the artillery base. Out.", 18]
	], 6] call EP_fnc_showSubtitles;
};

case "nearBase": {
	[[
		["Ten-2", "Ten-1, we have reached the outer perimeter. The base is 300 meters ahead.", 0],
		["Ten-1", "Copy, Ten-2. Remember your objectives. Plant the charges quietly and do not trigger a base-wide alert.", 8],
		["Ten-2", "Wish us luck. Out.", 16]
	], 5] call EP_fnc_showSubtitles;
};

case "artyKIA": {
	[[
		["Ten-2", "Ten-1, charges detonated! Primary targets are completely destroyed. The artillery pieces are down.", 0],
		["Ten-1", "Excellent work, Ten-2. The entire sector is waking up. Get your squad out of there immediately.", 5],    // Displays for 10 - 5 = 5 seconds
		["Ten-2", "Roger that, Ten-1. Disengaging from the base. We are heading directly back to the LZ for extraction.", 10], // Displays for 16 - 10 = 6 seconds
		["Ten-1", "Copy. Extraction bird is inbound to your position. Do not keep them waiting in the hot zone. Out.", 16]     // Displays for 5 seconds (from trailing parameter)
	], 5] call EP_fnc_showSubtitles;
};

case "apcSee": {
	[[
		["Ten-2", "Ten-1, we have a problem. An enemy APC is patrolling the main road ahead.", 0],
		["Ten-1", "Copy that, Ten-2. Do not engage unless compromised. Keep low, let it pass, and maintain absolute stealth. Destroy only if possible.", 6],
		["Ten-2", "Understood, Ten-1. Holding position in the treeline. Waiting for it to cycle out of our sector. Out.", 18]
	], 6] call EP_fnc_showSubtitles;
};

case "apcKIA": {
	[[
		["Ten-2", "Ten-1, the enemy armor has been neutralized. The patrolling APC is burning. Area is temporarily secure.", 0],
		["Ten-1", "Damn it, Ten-2. That explosion will compromise your position. Hurry up and move to the primary target.", 7], // 5 - 0
		["Ten-2", "Solid copy, Ten-1. Continue maintaining the mission. Ten-2 out.", 14] // 10 - 5
	]] call EP_fnc_showSubtitles;
};

case "casualties": {
	[[
		["Ten-2", "Ten-1, this is Ten-2. My entire squad is down. I am the only one left. Repeat, all teammates are KIA.", 0],
		["Ten-1", "Break, Ten-2! The mission is compromised. Do not commit suicide, pull back to the extraction zone immediately.", 6],
		["Ten-2", "Understood, Ten-1. Attempting to break contact and escape the perimeter. Keep the chopper ready. Out.", 11]
	]] call EP_fnc_showSubtitles;
};

case "inHeli": {
	[[
		["Ten-2", "Ten-1, this is Ten-2. Whole squad is aboard the extraction bird. Weapons safe, preparing for liftoff.", 0],
		["Ten-1", "Solid copy, Ten-2. Change of plans. The artillery threat is down, but we have a situation developing elsewhere.", 5], // Displays for 12 - 5 = 7 seconds
		["Ten-2", "Standing by for orders, Ten-1. What is our new objective?", 12],                                                   // Displays for 16 - 12 = 4 seconds
		["Ten-1", "A mechanized platoon is hitting our southern flank. We need you to redirect immediately to provide support.", 16],  // Displays for 23 - 16 = 7 seconds
		["Ten-2", "Understood, Ten-1. Pilot, reroute to the southern coordinates. Prepare for a hot insertion. Out.", 23]             // Displays for 5 seconds (from trailing parameter)
	], 5] call EP_fnc_showSubtitles;
};

case "landed": {
	[[
		["Ten-2", "We're down! Touchdown! Go, go, go! Clear the bird!", 0],
		["Ten-2", "Get off the ramp! Push into the tree line and secure a perimeter!", 4], // Displays for 8 - 4 = 4 seconds
		["Ten-2", "Ten-1, this is Ten-2. We are on the ground and taking incoming fire. Engaging now. Out!", 8] // Displays for 5 seconds (from trailing parameter)
	], 5] call EP_fnc_showSubtitles;
};

case "cityDone": {
	[[
		["Ten-2", "Ten-1, this is Ten-2. Main streets are clear. Remaining enemy forces are retreating from the sector. The city is ours.", 0],
		["Ten-1", "Outstanding work, Ten-2. Command is confirming total sector control. You held the line when it mattered most.", 6],   // Displays for 12 - 6 = 6 seconds
		["Ten-2", "Copy that. My squad is consolidation positions and treating the wounded. Standing by for further coordination. Out.", 12] // Displays for 5 seconds (from trailing parameter)
	], 5] call EP_fnc_showSubtitles;
}