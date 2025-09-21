[SM, "end", {
	sleep 5;
	["win01"] call BIS_fnc_endMission;
}, [
	// transitions
   	[ { false }, "" ]
]] call SM_fnc_addState;