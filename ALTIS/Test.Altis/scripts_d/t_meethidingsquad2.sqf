[kinos1, 3] call JBOY_Lip;
kinos1 sidechat "Oh Jesus! You scared me!";
sleep 4;
pl1 sidechat "Only two of you?";
sleep 4;
[kinos1, 4] call JBOY_Lip;
kinos1 sidechat "Yes. The rest of our squad were kia when we retreated...";
sleep 5;
[kinos1, 4] call JBOY_Lip;
kinos1 sidechat "We'll help out anyway we can. I've got a GL. Stavros has AT.";
sleep 5;
pl1 sidechat "Good. We're causing destruction tonight!";
sleep 5;
[kinos1, 3] call JBOY_Lip;
kinos1 sidechat "Yes sir! Let's move out!";
"m_kinos" setMarkerColor "ColorGrey";

[kinos1] joinSilent (group pl1);
kinos1 call ENH_fnc_ambientAnimations_exit;
kinos1 switchMove "AmovPercMstpSlowWrflDnon";

[kinos2] joinSilent (group pl1);
kinos2 call ENH_fnc_ambientAnimations_exit;
kinos2 switchMove "AmovPercMstpSlowWrflDnon";

sleep 2;

kinos1 setRandomLip false;

if ( (alive harpy) and (harpy in units pl1) ) then
{
	harpyradio sidechat "Don't slow us down.";
};

saveGame;