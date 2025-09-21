[SM, "init", {
	hint "Mission starting...";
	sleep 5;
	["task_1"] spawn fn_handleTasks;
	sleep 1;
	playMusic "CUP_A1_Arma_Magna";
}, [
	// transitions
   	[ { ({ alive _x } count units grpE_car) == 0 }, "assault" ]
]] call SM_fnc_addState;