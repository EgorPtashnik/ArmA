waitUntil {
	sleep 1;
	_heliHeight = getPosATL startHeli;
	_heliHeight select 2 < 1;
};
