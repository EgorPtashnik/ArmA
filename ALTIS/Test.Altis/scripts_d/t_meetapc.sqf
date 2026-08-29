if (alive myrmidon) then {
myrmidon sidechat "Hey there...";
[myrmidon, 4] call JBOY_Lip;
sleep 5;
};
pl1 sidechat "Let's go!";
sleep 5;
if (alive myrmidon) then {
myrmidon sidechat "Take it. I'm going to surrender...";
[myrmidon, 4] call JBOY_Lip;
sleep 5;
};
if (alive myrmidon) then {
myrmidon sidechat "They destroyed everything so fast.";
[myrmidon, 4] call JBOY_Lip;
sleep 5;
};
if (alive myrmidon) then {
myrmidon sidechat "As if the devil became a rabid dog...";
[myrmidon, 4] call JBOY_Lip;
sleep 5;
};
if (alive myrmidon) then {
pl1 sidechat "Then.. I suppose I'll see you on the other side.";
sleep 5;
};
if (alive myrmidon) then {
myrmidon sidechat "Hah. Yeah.";
[myrmidon, 4] call JBOY_Lip;
};

saveGame;

sleep 5;
_mcatgroup = [[5152.91,16718.7,0], west, ["EF_B_MRAP_01_AT_MJTF_Des"],[],[],[],[],[],182] call BIS_fnc_spawnGroup;
_mcatgroup deleteGroupWhenEmpty true;
sleep 10;
{
    _x setBehaviour "COMBAT";
} forEach units _mcatgroup;