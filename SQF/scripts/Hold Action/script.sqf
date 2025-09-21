[	
	// Attach to
	_leader,
	// title
	"Start Briefing",
	// Icon start
	"a3\ui_f_oldman\data\igui\cfg\holdactions\map_ca.paa",
	// Icon progress
	"a3\ui_f_oldman\data\igui\cfg\holdactions\map_ca.paa",
	// Condition to show
	"true",
	// Condition to progress
	"true",
	// Code start
	{},
	// Code progress
	{},
	// Code finish
	{ missionNamespace setVariable ["startBriefing", true] },
	// Code interupted
	{},
	// arguments to pass to above
	[],
	// duration
	3,
	// priority (show in priority if multiple actions are attached)
	1000,
	// removeCompleted
	true,
	// showUnconsious
	false,
	// showWindow (show on screen)
	false
	] call BIS_fnc_holdActionAdd;