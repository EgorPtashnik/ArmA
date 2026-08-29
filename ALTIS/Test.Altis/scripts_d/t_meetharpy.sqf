pl1 sidechat "Friendlies coming in!";
sleep 3;
harpy sidechat "Shit. You guys should've warned me you were coming up...";
sleep 6;
pl1 sidechat "Hehe... Anything new you observed?";
sleep 5;
harpy sidechat "Well, they've been moving in heavy equipment.";
sleep 6;
pl1 sidechat "Shit. Then, any tips for sabotaging?";
sleep 6;
harpy sidechat "Stay as quiet as you can, and set up the team before attacking..";
sleep 6;
harpy sidechat "I also recommend searching around the bases that were destroyed for extra AT capabilities.";
//[player, ["task_destroysilent"], ["Harpy recommends that we scavenge more AT material from the surrounding bases before we attack.", "Search Surrounding Bases", ""], objnull, "CREATED", -1, true, "Destroy"] call BIS_fnc_taskCreate;
sleep 7;
pl1 sidechat "Copy. We'll be on our way then.";
"m_harpy" setMarkerColor "ColorGrey";
sleep 5;

harpy call ENH_fnc_ambientAnimations_exit;
harpy switchMove "AmovPercMstpSrasWrflDnon";
[harpy] joinSilent (group pl1);
harpy setCombatMode "GREEN";

harpy sidechat "I'll join you. It feels like the end is near, and I don't want to be left alone out here.";
sleep 8;
pl1 sidechat "No issues with that! Let's move out then!";
sleep 5;
harpy sidechat "Civis left their cars from that cluster of houses to our south.";
"marker_108" setMarkerAlpha 1;

saveGame;