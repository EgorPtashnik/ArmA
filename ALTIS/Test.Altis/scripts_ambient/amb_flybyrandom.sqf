ambflybyrun = true;

_usvehiclespawn = ["B_Plane_CAS_01_dynamicLoadout_F","EF_B_AH99J_MJTF_Des","EF_B_Heli_Transport_01_MJTF_Des","B_Plane_Fighter_01_F"];

_usflywaypoint = [];
sleep 180;

//sleep random 30;
/*
while {ambflybyrun == true} do
{
	sleep 120;
	if (selectRandom [TRUE,FALSE]) then {
		[getmarkerpos "m_spawnair1", getmarkerpos "m_spawnair1wp", 100, "FULL", selectRandom _usvehiclespawn, west] call ax_fnc_ambflyby;
	}
	else
	{
		if (selectRandom [TRUE,FALSE]) then
		{
			[getmarkerpos "m_spawnair2", getmarkerpos "m_spawnair2wp", 100, "FULL", selectRandom _usvehiclespawn, west] call ax_fnc_ambflyby;
		}
		else
		{
			[getmarkerpos "m_spawnair3", getmarkerpos "m_spawnair3wp", 100, "FULL", selectRandom _usvehiclespawn, west] call ax_fnc_ambflyby;
		};
	};
};
*/

while {ambflybyrun} do
{
	sleep 120;
	_spawnMarker = selectRandom ["m_spawnair1", "m_spawnair2","m_spawnair3"];
	[getMarkerPos _spawnMarker, getMarkerPos (_spawnMarker + "wp"), 100, "FULL", selectRandom _usvehiclespawn, west] call ax_fnc_ambflyby;
};