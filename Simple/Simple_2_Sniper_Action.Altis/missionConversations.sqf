case "INSERTION": {
	[[
		["Ghost", "Scout, come in. This is Ghost. I have almost reached the position. ETA 2 Mikes. How copy? Over.", 0],
		["Scout Actual", "Copy that, Ghost. Waiting for your intel. Scout Actual out.", 10]
	]] call EP_fnc_chat;
};

case "IN_POSITION": {
	[[
		["Ghost", "In position. Over.", 0],
		["Scout Actual", "Roger. We are moving out. Check check the area. Out.", 5]
	]] call EP_fnc_chat;
};

case "SCOUT_IN_POSITION": {
	[[
		["Scout Actual", "Okay, I think we're set. Can you see us? I'm sharing our position via GPS.", 0]
	]] call EP_fnc_chat;
};

case "PLAYER_SEE_SCOUT": {
	[[
		["Ghost", "See you, Scout.", 0],
		["Scout Actual", "Okay. Check buldings on our way. Is there any activity?", 5]
	]] call EP_fnc_chat;
};

case "PLAYER_SEE_STATIC_PATROL": {
	[[
		["Ghost", "I see a small patrol there. 3 soldiers and a transport. Shall I take care of them? Over.", 0],
		["Scout Actual", "We cannot afford to compromise our presence. Eliminate them quickly and quietly. Check that noone mentiones anything. How copy?", 5],
		["Ghost", "Roger that. Nice and clean. Wait for an update. Ghost out.", 15]
	]] call EP_fnc_chat;
};

case "STATIC_PATROL_KIA": {
	[[
		["Ghost", "Scout, come in. Patrol is not a threat anymore.", 0]
	]] call EP_fnc_chat;
};

case "SCOUT_OBEY": {
	[[
		["Scout", "I would prefer you to decide when we can move and when we must stop. Let's do like that: code Green - go, code Red - stop. How copy?", 0],
		["Ghost", "Solid copy. Wait for my sygnal then. Ghost out.", 5]
	]] call EP_fnc_chat;
};

case "SCOUT_GO": {
	[[
		["Ghost", "Code Green.", 0]
	], 0, false] call EP_fnc_chat;
};

case "SCOUT_STOP": {
	[[
		["Ghost", "Code Red.", 0]
	], 0, false] call EP_fnc_chat;
};

case "DYNAMIC_PATROL_KILL_RADIOMAN_FIRST": {
	[[
		["Ghost", "Need to kill Radio Operator first. Otherwise we might be compromised.", 0]
	], 0, false] call EP_fnc_chat;
};

case "SCOUT_NEAR_BASE": {
	[[
		["Scout", "Ghost, come in. We are in position near base. Merlin has joined the channel.", 0],
		["Merlin", "Come in. Raindrop has done all preparations and is ready to provide artillery support. How copy? Over.", 5],
		["Ghost", "Good to hear you, Merlin. Solid copy. How many rounds do they have?", 10],
		["Merlin", "Unfortunately two. But these are laser designated missiles. So peak the target wisely.", 15],
		["Merlin", "Report the coordinates and when ready - call for support. Feel free to join with sniping infantry units. Scout will wait for your signal to join the attack. Over.", 20],
		["Ghost", "Understood, Merlin. Please, stay on comms. Will be back shortly. Ghost out.", 30]
	]] call EP_fnc_chat;
};

case "BASE_SEE_AMMO": {
	[[
		["Ghost", "See the supply truck. Looks like they are not going anywhere in the nearest time.", 0],
		["Scout", "Good to know. These ammo should be transfered to the frontline.", 5],
		["Merlin", "That's why we must not allow this. Be adviced. Do not send scout until main defence line is down. Merlin out.", 10]
	]] call EP_fnc_chat;
};

case "BASE_MARK_TARGET": {
	[[
		["Ghost", "Merlin, this is Ghost. Transferring the coordinates. Over.", 0],
		["Merlin", "Coordinates recieved. Forwarding them to Raindrop. Merlin out.", 5]
	]] call EP_fnc_chat;
};

case "BASE_NO_MARKED_TARGETS": {
	[[
		["", "I must send target coordinates first.", 0]
	], 0, false, "mybeep"] call EP_fnc_chat;
};

case "BASE_CALL_ARTILLERY": {
	[[
		["Ghost", "Merlin, come in. Requesting artillery strike on the sent coordinates. Over.", 0],
		["Merlin", "Copy, wait one.", 5]
	]] call EP_fnc_chat;
};

case "BASE_SCOUT_ATTACK": {

};

case "BASE_CAPTURED": {

};

case "QRF_EN_ROUTE": {

};

case "QRF_SEE": {

};

case "SCOUT_COMPROMISED": {

};


