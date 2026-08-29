var_officerkilled = 1;
var_usdestroy = var_usdestroy + 40;
pl1 sidechat "Mermekes! Officer down! I say again! Officer down! Over!";
playSoundUI ["ax_radioclick"];
sleep 5;
mekes commandchat "What the fuck? Christ!";
playSoundUI ["ax_radioclick"];

sleep 4;
mekes commandchat "Myrmekes copies. We're seeing enemy forces approaching from the coastline.";
playSoundUI ["ax_radioclick"];

execVM "exfiltration.sqf";