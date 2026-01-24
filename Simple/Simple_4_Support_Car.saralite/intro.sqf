playMusic "CUP_A1_S_Sahrani_3";
enableRadio false;
enableSentences false;
enableEnvironment false;

private ["_thread"];
_thread = [[3475.6,6752.94,0], "Southern Sahrani Conflict", 200, 200, random 360, 1] call BIS_fnc_establishingShot;
waitUntil {_thread};

enableRadio true;
enableSentences true;
enableEnvironment true;

[oPlayer] joinSilent grpPlayer;
grpPlayer selectLeader oPlayer; 
{_x enableSimulation true} forEach units grpPlayer;
sleep 10;
oEastStartAPC setDamage 1;
sleep 1;
{_x allowDamage true} forEach getMissionLayerEntities "InsertionCombat" # 0;
_thread = ["Sahrani Liberation Front", format ["Year %1", date select 0], mapGridPosition player] spawn BIS_fnc_infoText;

waitUntil {scriptDone _thread};

ep_mission_started = true;
