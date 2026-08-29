// Delay for 45 minutes (2700 seconds)

objtimeLeft = 2700;

[] spawn {
	while {objtimeLeft>= 0} do {
		hint format ["%1 seconds remaining", objtimeLeft];
		sleep 1;
		objtimeLeft = objtimeLeft - 1;
	};
};