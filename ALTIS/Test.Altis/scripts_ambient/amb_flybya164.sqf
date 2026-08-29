_ambientwipeouts = [amb_jet1, amb_jet2];
{
	_x engineOn true;
	_x enableSimulation true;
	_x hideObject false;
	_x setCaptive true;
	_x setVelocity [150, 0, 0];
	_x flyInHeightASL [100, 100, 100];
}forEach _ambientwipeouts;

sleep 13;

nul = [] spawn 
{ 
	for "_i" from 1 to 5 do 
	{ 
		amb_jet1D forceWeaponFire ["CMFlareLauncher", "Burst"]; 
		sleep 3;
	}; 
};

nul = [] spawn 
{ 
	for "_i" from 1 to 5 do 
	{ 
		sleep 0.3;
		amb_jet2D forceWeaponFire ["CMFlareLauncher", "Burst"]; 
		sleep 3;
	}; 
};