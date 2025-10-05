params [
	["_events", []]
];

EP_em_EventMachine = createHashMap;
{
	EP_em_EventMachine set [ _x select 0, _x select 1 ];
} forEach _events;