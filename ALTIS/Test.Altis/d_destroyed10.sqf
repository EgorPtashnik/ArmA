if (player inArea trg_movesquadsback) then
{
	markerspawn1 = "marker_123";
}
else
{
	markerspawn1 = "m_huntersp6";
};
_huntergroup1 = [getmarkerpos markerspawn1,west,["B_Soldier_SL_F","B_soldier_LAT2_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_soldier_M_F"]] call BIS_fnc_SpawnGroup;
[_huntergroup1] call RYD_CH_Herne;

[] spawn 
{
	4 fadeMusic 0;
	sleep 4;
	4 fadeMusic 1;
	playMusic "Music_Roaming_Night_Fragment_01_30s";
	sleep 11;
	saveGame;
};
_infotext = selectRandom [
(["Basilisk be advised, We're observing a squad of Americans that's inbound from the east. Over."] joinString ""),
(["Basilisk, A squad of Americans are retreating back to your AO. Over."] joinString ""),
(["Basilisk be advised, A squad of Americans seems to be falling back. Over."] joinString ""),
(["Basilisk, Myrmekes. You've got a squad of Americans incoming from the frontline. Over."] joinString "")
];

mekes commandchat "Basilisk, Myrmekes. UAV Operators spotted enemy special forces incoming from the frontline to your position. Over.";
playSoundUI ["ax_radioclick"];
sleep 6;
pl1 sidechat "Copy. Looks like we got their attention then. Over.";
playSoundUI ["ax_radioclick"];
sleep 4;
mekes commandchat "They're hunting your arses down. Stay vigilant. Out.";
playSoundUI ["ax_radioclick"];

"marker_101" setMarkerAlpha 1;