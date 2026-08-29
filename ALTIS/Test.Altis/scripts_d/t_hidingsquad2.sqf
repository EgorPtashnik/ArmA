unknown sidechat "To any AAF units still standing. We need an extraction!";
playSoundUI ["ax_radioclick"];
sleep 7;
pl1 sidechat "Who's transmitting? Over?";
playSoundUI ["ax_radioclick"];
sleep 4;
unknown sidechat "Karkinos! We're from Aggelochori trying to get back to friendly lines!";
playSoundUI ["ax_radioclick"];
sleep 5;
kinos1 sidechat "We're currently making our way back through the mountains!";
playSoundUI ["ax_radioclick"];
sleep 5;
pl1 sidechat "Basilisk here, we're a special forces team. We can't assist-";
playSoundUI ["ax_radioclick"];
sleep 5;
kinos1 sidechat "What?! Don't say that! We'll help out anyway we can!";
playSoundUI ["ax_radioclick"];
sleep 5;
pl1 sidechat "-Okay. Make your way to us if possible. Over.";
playSoundUI ["ax_radioclick"];
sleep 5;
kinos1 sidechat "Copy! Moving to a building northeast of the stadium! Out!";
playSoundUI ["ax_radioclick"];

"m_kinos" setMarkerAlpha 1;

if ( (alive harpy) && (harpy in units pl1) ) then
{
	sleep 5;
	harpyradio sidechat "Hmm.. should we really help? Clock's ticking.";
};