init_done = false; // goes true after init is done

[SM, "init", { call fsm_init }, [
	[ "intro", { init_done } ]
]] call EP_fsm_addState;

[SM, "intro", { }, [
	[ "dummy", { false }]
]] call EP_fsm_addState;
