_ambientmortar = [mc_mortar1, mc_mortar2,mc_mortar3];
_randomtime = selectRandom [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
{
	sleep _randomtime;
	_x doArtilleryFire [getmarkerpos "m_mlrstarget", ((getArtilleryAmmo [_x]) select 0), 8];
}forEach _ambientmortar;

sleep 9;

{
	sleep _randomtime;
	_x doArtilleryFire [getmarkerpos "m_mlrstarget", ((getArtilleryAmmo [_x]) select 0), 8];
}forEach _ambientmortar;

sleep 9;

{
	sleep _randomtime;
	_x doArtilleryFire [getmarkerpos "m_mlrstarget", ((getArtilleryAmmo [_x]) select 0), 8];
}forEach _ambientmortar;

sleep 9;

{
	sleep _randomtime;
	_x doArtilleryFire [getmarkerpos "m_mlrstarget", ((getArtilleryAmmo [_x]) select 0), 8];
}forEach _ambientmortar;