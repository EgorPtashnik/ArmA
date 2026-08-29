_ambientarty = [amb_arty1, amb_arty2, amb_arty3];
_randomtime = selectRandom [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];
{
	sleep _randomtime;
	_x doArtilleryFire [getmarkerpos "m_mlrstarget", "32Rnd_155mm_Mo_shells", 20];
}forEach _ambientarty;