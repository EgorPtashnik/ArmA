_hitVehicle = _this select 0;
If (canMove _hitVehicle) exitWith {};


while {!canMove _hitVehicle && alive _hitVehicle} do {

	_hitVehicle setDamage (damage _hitVehicle - 0.01);
	sleep 0.1;

};

