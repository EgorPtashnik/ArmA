_group = group player;
addSwitchableUnit phase_3_player;
selectPlayer phase_3_player;
{ removeSwitchableUnit _x; deleteVehicle _x; } forEach units _group;