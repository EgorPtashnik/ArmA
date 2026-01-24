// player - Hyena-1
// oTiger - Tiger

case "startDone": {
	[[
		[oPlayer, "Right... That should be all of them...", 5]
	], 1] call EP_fnc_chat;
};

case "blashkaNeedHelp": {
	[[
		[oTiger, "Hyena-1, Tiger. Enemy forces attack point 'Blashka' pretty bad. Can you help with the vehicles? They should not expect anything from the rear. Over.", 10],
		[oPlayer, "Roger, Tiger. Share the position. Over.", 5],
		[oTiger, "Grid 022056. Hurry up. Our defence line cannot hold much longer. Tiger our.", 5]
	]] call EP_fnc_chat;
};

case "getInHunter": {
	[[
		[oPlayer, "Alright. Everyone - get in that hunter! Move, move, move!", 5]
	], 1] call EP_fnc_chat;
};

case "ambush": {
	[[
		[oPlayer, "Contact! Infantry!", 5]
	], 1] call EP_fnc_chat;
};
