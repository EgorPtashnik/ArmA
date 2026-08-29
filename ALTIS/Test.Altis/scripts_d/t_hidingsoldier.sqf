unknown sidechat "Hello? Anyone out there? Heard close gunshots.";
playSoundUI ["ax_radioclick"];
sleep 6;
pl1 sidechat "Who's talking on this net? Over.";
playSoundUI ["ax_radioclick"];
sleep 5;
unknown sidechat "I'm a soldier from 3rd Squad of 1st Company, callsign Scylla.";
playSoundUI ["ax_radioclick"];
sleep 6;
scylla sidechat "I was helping my son evacuate when the FIA came. Over.";
playSoundUI ["ax_radioclick"];
sleep 7;
pl1 sidechat "Copy. Where is your location? Will come if possible. Over.";
playSoundUI ["ax_radioclick"];
sleep 5;
scylla sidechat "I'm north of Negades. Please help! Out!";
playSoundUI ["ax_radioclick"];
"m_scylla" setMarkerAlpha 1;

if ( (alive harpy) && (harpy in units pl1) ) then
{
	sleep 5;
	harpyradio sidechat "Bet he's an old guy. I bet he won't be much help...";
};