[gyges1, 3] call JBOY_Lip;
gyges1 sidechat "Oh thank God! You're finally here!";
sleep 4;
pl1 sidechat "Is it just the two of you?";
sleep 4;
[gyges1, 3] call JBOY_Lip;
gyges1 sidechat "Yes. The rest of our squad are kia...";
sleep 4;
[gyges1, 4] call JBOY_Lip;
gyges1 sidechat "We'll help out anyway we can. I've got an AA launcher. Angelos has a LMG.";
sleep 5;
pl1 sidechat "It's going to be a long night boys. Let's move!";
sleep 5;
[gyges1, 1] call JBOY_Lip;
gyges1 sidechat "Sir!";
"m_gyges" setMarkerColor "ColorGrey";

[gyges1] joinSilent (group pl1);
gyges1 call ENH_fnc_ambientAnimations_exit;
gyges1 switchMove "AmovPercMstpSlowWrflDnon";

[gyges2] joinSilent (group pl1);
gyges2 call ENH_fnc_ambientAnimations_exit;
gyges2 switchMove "AmovPercMstpSlowWrflDnon";

sleep 2;

gyges1 setRandomLip false;

if ( (alive harpy) and (harpy in units pl1) ) then
{
	harpyradio sidechat "You two better pull your weight.";
};

saveGame;