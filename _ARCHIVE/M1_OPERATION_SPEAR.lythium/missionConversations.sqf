case "intro": {
	[[
		["Eagle", "Bravo, this is Eagle. Operation Spear is now active. Move to the outpost and neutralize all hostiles. Do not let them raise the alarm.", 0],
		["Eagle", "Once the outpost is secure, move to the ridge overlooking the town and neutralize any heavy assets. Alpha is holding and won't move until you give the word.", 8],
		["Bravo", "Copy Eagle. Bravo is moving to the objective now. Alpha, stay frosty at your assembly point. We'll signal once the path is clear.", 20],
		["Alpha", "Solid copy, Bravo. Alpha is in position and waiting for the signal. Good luck. Out.", 30]
	]] call ep_fnc_showSubtitles;
};

case "inPosition": {
	[[
		["Bravo", "Eagle, this is Bravo. We are in position on the ridge overlooking the town. We have eyes on the target area.", 0],
		["Eagle", "Copy, Bravo. Scan the town and identify any enemy motorized assets. You are cleared to engage—destroy those vehicles to soften their defenses.", 8],
		["Eagle", "Once the vehicles are neutralized, send the signal to Alpha to initiate the main assault. They are standing by for your word.", 16],
		["Bravo", "Understood, Eagle. We'll take out the armor and give Alpha the green light. Bravo out.", 24]
	]] call ep_fnc_showSubtitles;
};

case "vehicleDestroyed": {
	private _reports = [
		"Scratch one enemy vehicle.",
		"Target neutralized. One less asset to worry about.",
		"That's a confirmed kill on the motor asset. Continue to hold.",
		"Alpha, we've got a burning wreck on the ridge. Enemy armor capacity reduced.",
		"One hostile vehicle is out of the fight. Stand by for the green light.",
		"Alpha, direct hit. We're softening the town up for you. Wait for our signal."
	];

	[[ ["Bravo", (selectRandom _reports), 0] ]] call ep_fnc_showSubtitles;
};

case "lostStryker_1": {
	[[
		["Alpha", "Eagle, Stryker-1 is hit! It is burning — we have multiple casualties! We're bailing out, cover us!", 0]
	]] call ep_fnc_showSubtitles;
};

case "lostStryker_2": {
	[[
		["Alpha", "Bravo, Stryker-2 is gone! We're dead in the water here! Clear those AT forces or Alpha is going to be wiped out!", 0]
	]] call ep_fnc_showSubtitles;
};

case "town_start": {
	[[
		["Bravo ", "Alpha, this is Bravo. The path is clear. You are green light for the assault. I repeat: Green Light!", 0],
		["Alpha ", "Solid copy, Bravo. We have your signal. All Alpha units, engines on! Strykers, lead the push into the town!", 7],
		["Alpha ", "Bravo, stay on those heights and keep the heat off us. We are moving in now!", 14],
		["Eagle", "All stations, Phase Two is underway. Bravo, provide continuous overwatch. Alpha, godspeed. Out.", 20]
	], 6] call ep_fnc_showSubtitles;
};

case "town_casualties": {
	[[
		["Alpha", "Eagle! Alpha has taken unsustainable casualties! We're down to a few men and we're being overrun! We can't hold the town!", 0],
		["Eagle", "Copy, Alpha. All stations, Operation Spear is a total loss. Alpha, break contact and withdraw to the rally point immediately.", 8],
		["Eagle", "Bravo, providing covering fire for Alpha's retreat is now your primary objective. Once they are clear, RTB. Mission aborted.", 15],
		["Bravo", "Copy Eagle... Bravo is moving to cover the withdrawal. We're coming for you, Alpha. Out.", 22]
	]] call ep_fnc_showSubtitles;
};

case "town_siezed": {
	[[
		["Alpha ", "Eagle, this is Alpha. All sectors are clear and we have established a defensive perimeter around the town hall. The town is secure.", 0],
		["Eagle", "Solid copy, Alpha. Excellent work. Bravo, your reconnaissance and suppression were key to this victory.", 10],
		["Bravo ", "Copy Eagle. Glad we could clear the path. Alpha, nice work down there. We're packing up our gear and moving to the rally point.", 18],
		["Alpha ", "Thanks for the overwatch, Bravo. We'll buy the first round back at base. Alpha out.", 26],
		["Eagle", "All units, Operation Spear is a success. Return to base for debrief. Out.", 34]
	]] call ep_fnc_showSubtitles;
};
