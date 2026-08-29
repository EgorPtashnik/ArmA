_entitylayers = ["30 Reinforcements"];

{
    {
        _x enableSimulation true;
        _x hideObjectGlobal false;
    }forEach (getMissionLayerEntities _x select 0);
}forEach _entitylayers;

_infotext = selectRandom [
(["Oh shit! Stratios reports the enemy is pulling up tanks and APCs from Kavala. Over."] joinString ""),
(["Basilisk, Stratios reports the enemy is bringing up reinforcements from Kavala. Over."] joinString ""),
(["Basilisk be advised, multiple tanks and APCs incoming from Kavala. Over."] joinString ""),
(["Stratios called, you've got multiple tanks and APCs inbound from Kavala. Over."] joinString "")
];

mekes commandchat "Basilisk, Stratios reports enemy tanks and APCs inbound from Kavala! Over!";
playSoundUI ["ax_radioclick"];
sleep 6;
pl1 sidechat "Copy that! We'll do a bit more sabotage, then retreat! Out!";
playSoundUI ["ax_radioclick"];

_arrowmarkers = ["marker_105","marker_111"];
{
	_x setMarkerAlpha 1;
}forEach _arrowmarkers;

[] spawn 
{
	4 fadeMusic 0;
	sleep 4;
	4 fadeMusic 1;
	playMusic "EventTrack01a_F_Tacops";
	saveGame;
};