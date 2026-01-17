// OP Bearclaw
// OP Hedgehog
// Guardian
// Kilo-1

case "START_REPORT": {
	[[
		["Guardian", "Situation check. OP Hedgehog? Over.", 0],
		["OP Hedgehog", "OP Hedgehog, all clear. Kilo-1 just passed by. No signs of EIF. How copy? Over.", 10],
		["Guardian", "Solid copy. OP Bearclaw? Over.", 15],
		["Taylor", "OP Bearclaw, all clear. No EIF presence detected. Over.", 20],
		["Guardian", "Copy that. Proceed with the watch. Guardian out.", 25]
	]] call EP_fnc_chat;
};

case "REPORT_HELI_CRASH": {
	[[
		["Guardian", "OP Bearclaw, come in.", 0],
		["Taylor", "Listening, Guardian.", 5],
		["Guardian", "We've recieved a SOS sygnal from Kilo-1. Your base is the one with ready to go helicopter, isn't it?", 10],
		["Taylor", "Correct, sir. We have a Little Bird. Em... What do you mean SOS?", 15],
		["Guardian", "It means our heli is down. You will join the rescue group. Your task is to find the wreck and destroy it. Would be good to find any survivors as well. How copy?", 20],
		["Taylor", "Fuck...", 30],
		["Taylor", "Yes sir. Moving out immediately. Over.", 35],
		["Guardian", "Good. 'Fox' is aware of the situation. Get in the Little Bird. Your sergeant will tell you more. Good luck! Guardian out.", 40]
	], 10] call EP_fnc_chat;
};

case "IN_HELI": {
	[[
		["Taylor", "So what is the plan, sir?", 0],
		["Sergeant", "According to guardian the crash was really bad. Probably no survivors...", 5],
		["Sergeant", "Our task is move in, identify the wreck and blow it up. It is possible that we can meet EIF on our way so eyes open!", 10],
		["Taylor", "Roger, sergeant! But what about extraction?", 20],
		["Sergeant", "We cannot risk and leave our heli unprotected while we're doing business...", 25],
		["Sergeant", "So after job is done we must contact Guardian and clarify the LZ. Nothing more, nothing less.", 30],
		["Taylor", "Got it, sir. Thank you for the intel...", 40]
	]] call EP_fnc_chat;
};

case "DISMOUNTED": {
	[[
		["Sergeant", "Alright, let's move out!", 0],
		["Sergeant", "Guardian, this is Fox-1. Approaching crash site. Over.", 10],
		["Guardian", "Solid copy, Fox-1. Be adviced. We don't have any reinforcements near AO. Over.", 20],
		["Sergeant", "Roger that. Fox-1 out.", 25]
	]] call EP_fnc_chat;
};

case "ENEMY_EN_ROUTE": {
	[[
		["Guardian", "Fox, be adviced. We have detected enemy infantry forces moving out to your position. Make it fast. Guardian out.", 0]
	], 10] call EP_fnc_chat;
};

case "DESTROY_HELI_ALIVE": {
	[[
		["Sergeant", "Alright, set up charges on the wreck. Everyone else - check the perimeter. Fire at will!", 0]
	]] call EP_fnc_chat;
};

case "DESTROY_HELI_KIA": {
	[[
		["Sergeant", "Fuck, sapper is KIA. Taylor - take his charges and prepare this wreck for the show. Move out, corporal!", 0]
	]] call EP_fnc_chat;
};

case "RETREAT": {
	[[
		["Sergeant", "Alright, let's get the hell out of here! Move, move, move!", 0]
	]] call EP_fnc_chat;
};

case "RETREATED": {
	[[
		["Fox", "Guardian, this is Fox Actual. We are retreating towards our positions. Please advice LZ destination. How copy? Over.", 0],
		["Guardian", "Well done! We will pick you up at grid 093096. Sending the coordinates. Guardian out.", 10]
	]] call EP_fnc_chat;

};