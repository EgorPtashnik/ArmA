// BLUFOR Mine Specialists
{
	private _loadout = getUnitLoadout (selectRandom (units BluMineSpecsTemp));
	_x setUnitLoadout _loadout;
} forEach ("EP_mineSpec" call EP_fnc_collectVariables);