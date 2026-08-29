_ambientmlrs = [amb_mlrs1, amb_mlrs2, amb_mlrs3];
_randomtime = selectRandom [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
{
	sleep _randomtime;
	_x doArtilleryFire [getmarkerpos "m_mlrstarget", ((getArtilleryAmmo [_x]) select 0), 12];
}forEach _ambientmlrs;

//sleep 4;
//pl1 sidechat "NO! They're firing rockets at our brothers!";

sleep 20;

execVM "scripts_ambient\amb_firemortar.sqf";