case "1_Intro": {
    [[
        ["HQ (Sunray)", "Longbow, this is Sunray Control. Be advised, your transport asset is inbound. Heli ETA is two minutes to your location. Check your gear.", 7, 1],
        ["Longbow", "Sunray, Longbow copies all. Gear is secure, LZ is clear, laser designator is primed for the recon phase. Ready for extract.", 6, 1],
        ["HQ (Sunray)", "Solid copy, Longbow. Once wheels are up, you are green across the board for the mission. Out.", 5, 1]
	]] call EP_fnc_missionConversations;
};

case "1_inHeli": {
	[[
		["Crew Chief", "Alright, everyone's hooked in. Doors clear. Up, up, up!", 4, 4],
		["Pilot (Vortex 1-1)", "Copy that, Wills. Pulling pitch. Longbow, grab a handle, it's going to be a bumpy ride through the valley.", 6, 4],
		["Longbow", "Just get me there in one piece, Vortex. I left a perfectly good cup of coffee back at the ready room for this.", 7, 4],
		["Pilot (Vortex 1-1)", "Hah! If we make it back before the shift change, the next pot is on me. Don't hold your breath though.", 7, 4],
		["Crew Chief", "Don't trust his brewing, Longbow. It tastes like spent oil and battery fluid.", 6, 4],
		["Pilot (Vortex 1-1)", "Quiet in the back, Wills. Alright, jokes aside, heads up. Be prepared to dismount.", 7, 4]
	], false] call EP_fnc_missionConversations;
};

case "1_inHeliHQ": {
	[[
		["Longbow", "Control, this is Longbow. I am airborne and secure aboard Vortex One-One. En route to the primary drop zone.", 5, 1],
		["HQ (Sunray)", "Solid copy, Longbow. Radar has your asset tracked. Maintain radio silence on this frequency until you are boots on the ground.", 7, 1],
		["Longbow", "Roger that, Control. Longbow out.", 3, 1]
	]] call EP_fnc_missionConversations;
};


case "2_inserted": {
	[[
		["Longbow", "Control, this is Longbow. I am boots on the ground at the drop zone. Vortex is clear. Moving out toward the enemy base now.", 6, 1],
		["HQ (Sunray)", "Copy your sunrise, Longbow. Proceed with caution. Before you push inside, your priority is to scout the perimeter from the ridge line.", 6, 1],
		["HQ (Sunray)", "Use your optics to highlight any high-value targets, guard patrols, or heavy assets. Keep us updated. Out.", 5, 1],
		["Longbow", "Understood, Control. Getting eyes on the target area now. Longbow out.", 5, 1]
	]] call EP_fnc_missionConversations;
};

case "2_swordReady": {
	[[
		["HQ (Sunray)", "Longbow, Sunray Control. Be advised, group 'Sword' is now fully in position. Sharing their coordinates now. They are holding fire and ready to assault on your signal.", 9, 1],
		["Longbow", "Copy that, Control. Glad to hear they made it through the tree line undetected. Tell them to stay dark until I give the word.", 5, 1],
		["HQ (Sunray)", "Solid copy. Sword is standing by. Get yourself into a good overwatch position before you push the button. Sunray Out.", 5, 1]
	]] call EP_fnc_missionConversations;
};

case "2_detCarGunner": {
	[[
		["Longbow", "Sword, this is Longbow. Heads up, I've got eyes on an enemy technical. Light vehicle with a heavy machine gunner stationed near the main gate.", 7, 1],
		["Sword 1-1", "Copy that, Longbow. Good spot. That gunner will tear us to pieces if we try to push the gate. Can you take him out from the ridge before we assault?", 7, 1],
		["Longbow", "Consider it done. I'll drop the gunner the second you get the green light. Just stay clear of that crossfire loop. Out.", 5, 1]
	]] call EP_fnc_missionConversations;
};

case "2_detSniper": {
	[[
		["Longbow", "Sword, Longbow. I have eyes on a counter-sniper position.", 4, 1],
		["Sword 1-1", "Copy that. That sniper has a clear line of sight over our entire approach vector. If he pins us down in the open, we're done.", 6, 1],
		["Longbow", "Negative ghostrider, he won't get the chance. I'll make him my primary target. Keep your heads down until he's neutralized. Out.", 5, 1]
	]] call EP_fnc_missionConversations;
};

case "2_detNest": {
	[[
		["Longbow", "Sword, this is Longbow. I've located a reinforced enemy bunker nest. Heavy machine gun dug in on the sandbag line.", 6, 1],
		["Sword 1-1", "Understood. That bunker has interlocking fields of fire right across our primary breach point. We can't advance while that gun is operational.", 6, 1],
		["Longbow", "Copy. I'll see if I can put a round through the firing slit or detonate some nearby munitions to clear it out. Stand by. Out.", 5, 1]
	]] call EP_fnc_missionConversations;
};

case "2_detPatrol": {
	[[
		["Longbow", "Sword, Longbow. I have eyes on an enemy foot patrol. Two-man fireteam moving along the perimeter fence.", 6, 1],
		["Sword 1-1", "Copy that, Longbow. Are they heading toward our current assembly area, or is their route moving away from us?", 5, 1],
		["Longbow", "They are walking a predictable loop around the base. Hold steady. I'll monitor their pattern. Out.", 5, 1]
	]] call EP_fnc_missionConversations;
};

case "2_detAll": {
	[[
		["Longbow", "That's everything. Perimeter mapped, guard loops noted, priority threats identified. I've gathered enough intel out here.", 6, 2],
		["Longbow", "Time to radio Sword and give them the green light for the assault. Let's get this done.", 4, 2]
	], false] call EP_fnc_missionConversations;
};

case "2_detPlayer": {
	[[
		["Longbow", "Sword, Control, this is Longbow! Compromised! I've been detected on the ridge line, enemy elements are returning fire!", 5, 1],
		["Sword 1-1", "Copy that, Longbow! We see the muzzle flashes on your position. We are launching the assault immediately to pull the pressure off you!", 6, 1],
		["Sword 1-1", "Hold your ground and keep your head down, we are moving now! Out!", 3, 1]
	]] call EP_fnc_missionConversations;
};

case "2_swordGo": {
	[[
		["Longbow", "Sword, this is Longbow. Intel phase is complete, priority targets are locked down. You are green across the board, go for the assault!", 6, 1],
		["Sword 1-1", "Solid copy, Longbow! All stations, this is Sword One-One. Break cover and push the breach point! Assault, assault, assault!", 6, 1],
		["Sword 1-1", "Longbow, keep that rifle hot and provide overwatch from the ridge. We're moving in now! Out!", 4, 1]
	]] call EP_fnc_missionConversations;
};

case "2_baseCaptured": {
	[[
		["Sword 1-1", "Longbow, Sunray, this is Sword One-One. Base is secure. Compound is clear, and all remaining enemy threats have been neutralized.", 6, 1],
		["HQ (Sunray)", "Outstanding work, Sword. Longbow, excellent job providing overwatch from that ridge line.", 5, 1],
		["Sword 1-1", "Control, be advised we aren't getting comfortable. As planned, we are immediately digging in and preparing the ambush along the main access road for that incoming enemy convoy.", 6, 1],
		["Longbow", "Copy that, Sword. We know they're coming. I'll maintain my overwatch position on the ridge and call out the vehicles the second they hit the approach corridor. Longbow out.", 6, 1]
	]] call EP_fnc_missionConversations;
};


case "3_iedPlanted": {
	[[
		["Sword 1-1", "Longbow, this is Sword. Be advised, the IEDs are fully wired and planted along the primary kill zone on the access road.", 6, 1],
		["Sword 1-1", "We are breaking line of sight now and moving into our ambush positions. The trap is set.", 5, 1],
		["Longbow", "Solid copy, Sword. I see your deployment zone from the ridge. Ready your detonators. Longbow Out.", 6, 1]
	]] spawn EP_fnc_missionConversations;
};

case "3_convoyKIA": {
	[[
		["Sword 1-1", "Longbow, Sunray, this is Sword! Convoy is completely destroyed! The IEDs tore right through the lead vehicles and we've mopped up the rest.", 6, 1],
		["Longbow", "Good copy, Sword. I watched the whole thing from the ridge. Total devastating effect on target. No runners detected on my thermal scope.", 5, 1],
		["HQ (Sunray)", "Excellent work, gentlemen. The threat is completely neutralized. Longbow, Sword, fall back to your designated extraction points. Mission complete. Out.", 6, 1]
	]] spawn EP_fnc_missionConversations;
};