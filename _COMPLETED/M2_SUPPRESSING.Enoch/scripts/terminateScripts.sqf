terminate EP_script_ambPickup;
terminate EP_script_ambAPC;
terminate EP_trg_lCity;
terminate EP_trg_rCity;
deleteVehicle EP_trg_baseAlarm;

// {
// 	{ deleteVehicle _x } forEach (getMissionLayerEntities _x # 0);
// } forEach ""