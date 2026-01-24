/*
	"colorCorrections" ppEffectEnable true; 
	"colorCorrections" ppEffectAdjust [0.85, 0.95, 0, [0.1, 0.15, 0.2, 0], [0.85, 0.85, 0.9, 0.6], [0.6, 0.7, 0.8, 0]]; 
	"colorCorrections" ppEffectCommit 0;
*/

{  
    _x setskill 0.25;  
    _x setskill ["aimingAccuracy",0.05];  
    _x setskill ["aimingShake",0.05];  
    _x setskill ["aimingSpeed",0.05];  
    _x setskill ["spotDistance",0.5];  
    _x setskill ["spotTime",0.25];  
    _x setskill ["courage",0.25];  
    _x setskill ["reloadSpeed",0.5];  
    _x setskill ["commanding",0.5];  
    _x allowFleeing 0;  

} forEach allUnits;

//player group
{_x enableSimulation false; doStop _x; _x setCaptive true} forEach units grpPlayer;
grpPlayer setGroupId ["Hyena-1"];

//side chat entities
group oTiger setGroupId ["Tiger"];
oTiger enableSimulation false;

//markers
{_x setMarkerAlpha 0} forEach ["mrkBlashka", "mrkAPCs"];

//insertion combat
{_x allowDamage false} forEach getMissionLayerEntities "InsertionCombat" # 0;
{_x enableSimulation false; _x hideObject true; _x allowDamage false} forEach getMissionLayerEntities "2_KillAPCs" # 0;
{_x disableAI "MOVE"} forEach units grpWestStart;
{_x setUnitPos "UP"} forEach units grpEastStart;

//grpEastAmbush
{_x setUnitPos "DOWN"; _x disableAI "MOVE"} forEach units grpEastAmbush;	
grpEastAmbush setCombatMode "BLUE";
grpEastAmbush setBehaviourStrong "CARELESS";

//blashka
{_x setUnitPos "MIDDLE"; _x disableAI "MOVE"} forEach units grpWestBlashka;
{_x setUnitPos "UP"} forEach ((units grpEastBlashka_1) + units grpEastBlashka_2);

[] execVM "intro.sqf";
[] execVM "scripts\ambientBattlefieldSounds.sqf";
