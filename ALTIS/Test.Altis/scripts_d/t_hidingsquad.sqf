unknown sidechat "Hey! Does anyone read me on this net? We need an extraction!";
playSoundUI ["ax_radioclick"];
sleep 7;
pl1 sidechat "Uh... Who is speaking? Over?";
playSoundUI ["ax_radioclick"];
sleep 4;
unknown sidechat "Finally! We thought we got left behind. Our callsign is Gyges!";
playSoundUI ["ax_radioclick"];
sleep 5;
gyges1 sidechat "We got ambushed by the Americans and hid out in a building for the past 4 hours.";
playSoundUI ["ax_radioclick"];
sleep 7;
pl1 sidechat "This is Basilisk, we're a special forces team. We can't help-";
playSoundUI ["ax_radioclick"];
sleep 6;
gyges1 sidechat "We'll help you! Just please get us!";
playSoundUI ["ax_radioclick"];
sleep 5;
pl1 sidechat ".... We'll do so if we have the time then. Over.";
playSoundUI ["ax_radioclick"];
sleep 5;
gyges1 sidechat "Thank you! We're north of Kore! Out!";
playSoundUI ["ax_radioclick"];

"m_gyges" setMarkerAlpha 1;

if ( (alive harpy) && (harpy in units pl1) ) then
{
	sleep 5;
	harpyradio sidechat "I'm sure they'll be a burden if we get them.. Your call.";
};