[scylla, 4] call JBOY_Lip;
scylla sidechat "There you are!";
sleep 5;
[scylla, 5] call JBOY_Lip;
scylla sidechat "Thanks for coming to get me.";
sleep 6;
pl1 sidechat "Um. Was that your son outside?";
sleep 5;
[scylla, 6] call JBOY_Lip;
scylla sidechat "..... Could we go? -I'm a demo specialist by the way.";
sleep 7;
pl1 sidechat "Yeah. Let's go. We're blowing stuff up tonight.";
"m_scylla" setMarkerColor "ColorGrey";

[scylla] joinSilent (group pl1);
scylla call ENH_fnc_ambientAnimations_exit;
scylla switchMove "AmovPercMstpSlowWrflDnon";
scylla setCaptive false;

sleep 7;
[scylla, 6] call JBOY_Lip;
scylla sidechat "Wait, here are the keys for my son's truck.";
playsound "ax_jinglekeys";
scy_truck lock false;

sleep 5;
pl1 sidechat "May he rest in peace.";

saveGame;