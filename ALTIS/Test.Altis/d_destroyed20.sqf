if (player inArea trg_movesquadsback) then
{
	markerspawn2 = "marker_123";
	markerspawn3 = "m_endsp_7";
	markerspawn4 = "marker_102";
}
else
{
	markerspawn2 = "m_huntersp6";
	markerspawn3 = "m_huntersp7";
	markerspawn4 = "m_huntersp8";
};

_huntergroup2 = [getmarkerpos markerspawn2,west,["B_Soldier_SL_F","B_soldier_LAT2_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_soldier_M_F"]] call BIS_fnc_SpawnGroup;
[_huntergroup2] call RYD_CH_Herne;

_huntergroup3 = [getmarkerpos markerspawn3,west,["B_Soldier_SL_F","B_soldier_LAT2_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_soldier_M_F"]] call BIS_fnc_SpawnGroup;
[_huntergroup3] call RYD_CH_Herne;

_huntergroup4 = [getmarkerpos markerspawn4,west,["B_Soldier_SL_F","B_soldier_LAT2_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_soldier_M_F"]] call BIS_fnc_SpawnGroup;
[_huntergroup4] call RYD_CH_Herne;

_infotext = selectRandom [
(["Basilisk be advised, Looks like multiple squads are inbound. Over."] joinString ""),
(["Basilisk, You've got multiple squads incoming from the southeast. Over."] joinString ""),
(["Basilisk be advised, multiple squads are falling back to your AO. Over."] joinString ""),
(["Basilisk, Myrmekes. Watch the North and South. Multiple squads incoming. Over."] joinString "")
];

mekes commandchat "Basilisk, you got them riled up! Multiple squads are falling back to your AO! Over!";
playSoundUI ["ax_radioclick"];
sleep 6;
pl1 sidechat "Copy. Things are getting a bit hairy on our end too. Out.";
playSoundUI ["ax_radioclick"];

"marker_104" setMarkerAlpha 1;
"marker_102" setMarkerAlpha 1;

[] spawn 
{
	4 fadeMusic 0;
	sleep 4;
	4 fadeMusic 1;
	playMusic "EventTrack02a_F_Tacops";
	saveGame;
};