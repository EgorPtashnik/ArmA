private _mrkPos = "O_MrkGorgon" call EP_fnc_getPosition;

// Player is far
waitUntil { sleep 1; (player distance2D _mrkPos) > 200 };

// Kill units
{ _x setDamage 1 } forEach EP_WavesUnits;

// Undefine variable
EP_WavesUnits = nil;