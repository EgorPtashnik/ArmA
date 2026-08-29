cutText ["", "BLACK FADED"];
0 fadesound 0;

call compile preprocessFileLineNumbers "scripts\Herne.sqf";
JBOY_Lip = compile preprocessFileLineNumbers "scripts\JBOY_Lip.sqf";

//Briefing

initialbrief7 = player createDiaryRecord ["Diary", ["More Tips", "
Here's additional tips if you need more guidance.<br /><br />
- Do recon before attacking major bases/areas. You are a special forces team after all...<br />
- Loot whatever you can.<br />
- Keep areas with cover in mind. Obviously don't run across open fields.<br />
- Do not try to kill everyone while you retreat, your only objective and priority is getting out alive.<br />
- Building on that, leaving your AI behind is a valid strategy too, though their families may disagree. :(<br />
- Try to find and give your AI team AT weaponry. They will definitely help.<br />
- Watch the skies."]];

initialbrief6 = player createDiaryRecord ["Diary", ["What To Target?", "
Fourth Wall Break!!!<br />
If you still aren't sure still on what to target, here's a list of things to destroy that will get some attention.<br /><br />
- Infantry<br />
- Cars<br />
- APCs<br />
- Artillery<br />
- Tanks<br />
- Helicopters (More costly)<br />
- Jets (More costly)<br />
- Radar<br />
- Anti-Air<br />
- Checkpoints<br />
- FOBs<br />
- FARPs<br /><br />
Destroying abandoned vehicles won't net attention.<br /><br />
Getting spotted at the three major bases will automatically net you some attention.<br /><br />
Important note: HVTs<br />
Killing one of their officers in the field will set them off and distract them from the frontlines. Keep your eyes and ears open for any around the area."]];

initialbrief5 = player createDiaryRecord ["Diary", ["Diary", "
It is the beginning of the end. I do not understand how we ended up in this situation.... As I reflect upon the past few months, I realise that I was in the dark more often than not.<br /><br />
President Akhanteros never gave clear reasons for striking at NATO. I wasn't there personally, but everyone I conversed with regreted it in some way. Thoughts of desertion darted around my mind ever since then. But, my team still believes in a free and independent Altis through our actions, and they will continue to fight until the end.<br /><br />
Me? I'm currently pondering. The insurgents murdered my brother after he refused to give them refuge in his home, but the president began rounding the opposition up to do 'things' that I do not really agree with...<br /><br />
Even as I stand at a crossroads, I still know I must protect Altis, our home. What was the point of the past 5 years if I do not? All that bloodshed, just to be swept away with the Americans siding with the insurgents?<br /><br />
- Haikias 8.8.2035<br />
<img image='images\photo.jpg' width='270' height='480'/>"]];

initialbrief4 = player createDiaryRecord ["Diary", ["Signal", "
Myrmekes (Me) - Officer of 1st Company.<br />
Basilisk (You) - Special forces team entering the AO on foot in the <marker name='m_basilisk'>mountains</marker>.<br />
Harpy - Recon overwatch near <marker name='m_harpy'>Topolia</marker>."]];

initialbrief3 = player createDiaryRecord ["Diary", ["Execution", "
1. Scout enemy positions and cause chaos where you can to bring the Americans' attention off of the frontline.<br />
2. I will alert you to American movements as you cause distractions.<br />
3. Fall back to friendly lines when it gets too hot."]];


initialbrief2 = player createDiaryRecord ["Diary", ["Mission", "<marker name='m_basilisk'>Basilisk</marker>, I'm tasking your team with creating a distraction around the valleys northeast of Kavala. I recommend entering the AO from the <marker name='m_startnw'>north</marker> or the <marker name='m_startse'>south</marker> where there's a gap in their surveillance.<br /><br />
<marker name='m_harpy'>Harpy</marker>, a recon sniper, has observed the 29th MEU moving about and entrenching their positions in our towns near the northwestern mountains. He's especially noted down some locations of certain high value targets.<br /><br />
In <marker name='m_kore'>Kore</marker>, mechanized units are prepping to attack <marker name='m_terminal'>Altis International Airport</marker> using the main highway. Recommend taking out their ammunition caches and apcs.<br /><br />
Near the <marker name='m_factory'>factory</marker>, it seems like they are setting up a FARP. Refueling trucks are parked around the area along with helicopters. This is a good opportunity to reduce their air power now, though Harpy reports the pilots are still around. Be cautious.<br /><br />
<marker name='m_negades'>Negades</marker> is potentially swarming with Americans. We don't have any eyes on this area, so it's up to you if you want to infiltrate there.<br /><br />
Keep an escape route back east in mind after completing your distraction. You will need to exfiltrate immediately as reinforcements will unquestionably be inbound to stop you.<br /><br />
Basilisk, you are some of the last remaining operatives... We can't have you die here.<br /><br />
-------------------------------------------------------------------------------------------------------------<br />
Wait! Before you go! One last VERY IMPORTANT thing... CSAT don't want us mucking about, so they've given us until <font color='#FBCA46'>01:00 tomorrow, August 9th</font color> to make some noise. We can bet they will not help us if we cannot do it."]];


initialbrief1 = player createDiaryRecord ["Diary", ["Situation", "Gentlemen. The Americans have finally come to kill us all. This shouldn't be too much of a suprise of course. We all knew that after the elimination of Task Force Aegis occured.<br /><br />
Early this morning, their offensive started with a swift strike onto <marker name='m_achilles'>FOB Achilles</marker> and quickly took control of the <marker name='m_factory'>factory</marker> and <marker name='m_kore'>Kore</marker>. Then, they claimed victory in <marker name='m_kavala'>Kavala</marker>. Our brothers are now in disarray, and it seems like many were killed or surrendered over the course of the offensive they've conducted today.<br /><br />
The Americans have pushed us all the way back to <marker name='m_neochori'>Neochori</marker>, but our defensive positions were able to stop their advance. I'm sure they'll begin moving on the <marker name='m_terminal'>airport</marker> when most of their heavier equipment arrives.<br /><br />
We need to hold them back for a bit longer. CSAT has requested that we give them time to move <marker name='marker_43'>their</marker> <marker name='marker_40'>equipment</marker> further back from the front line. I don't know what their objective is, but as of now, they haven't offered any assistance.<br /><br />
I'm sorry to say, but I've gathered you all right now to conduct sabotage operations behind enemy lines. You'll have minimal support, and little to no intel on the enemy.<br /><br />
I'll assign you all your tasks shortly."]];

//Variables
var_directionchoose = 0;
var_dirnw = 0;
var_dirse = 0;
var_blowup = 0;
var_carjack = 0;
var_sabfueltruck = 0;
var_sabammotruck = 0;
var_sabattacheli = 0;
var_sabtransheli = 0;
var_sabmack = 0;
var_playeroutao = 0;
var_hunterspawns = 0;
civDead = 0;
var_officerkilled = 0;
var_loudspeaker = 0;
var_objectivescomplete = 0;
var_escape = 0;

var_usdestroy = 0;

//Create initial tasks
[player, ["task_distract"], ["Take the enemy's attention away from the frontline by any means possible.<br /><br />Resupply trucks, patrols, artillery... Anything's on the table to be wasted. Good luck.", "Make Distractions", ""], objNull, "CREATED", 2, true, "Destroy"] call BIS_fnc_taskCreate;
/*
//FARP
[player, ["task_destroyfarp"], ["Harpy observed several high value targets that should be taken out to slown down their advance tomorrow.", "Sabotage the FARP", ""], [6133.57,16148.3,0], "CREATED", 2, true, "Destroy"] call BIS_fnc_taskCreate;
[player, ["task_destroyfacfuel","task_destroyfarp"], ["The fuel truck must be destroyed.", "Destroy Fuel Truck", ""], objNull, "CREATED", -1, true, "Destroy"] call BIS_fnc_taskCreate;
[player, ["task_destroyfacammo","task_destroyfarp"], ["The ammo truck needs to be destroyed.", "Destroy Ammunition Truck", ""], objNull, "CREATED", -1, true, "Destroy"] call BIS_fnc_taskCreate;
[player, ["task_destroyfacheli","task_destroyfarp"], ["Destroying the Blackfoot will lead to less air superiority on their side tomorrow.<br /><br />This is optional as we do not expect you to take too many risks.", "OP: Destroy Attack Heli", ""], objNull, "CREATED", -1, true, "Destroy"] call BIS_fnc_taskCreate;
[player, ["task_destroyfactransheli","task_destroyfarp"], ["Destroying the Ghosthawk means troops can't be moved around as easily tomorrow.<br /><br />This is optional as we do not expect you to take too many risks.", "OP: Destroy Transport Heli", ""], objNull, "CREATED", -1, true, "Destroy"] call BIS_fnc_taskCreate;
//FOB
[player, ["task_destroyfob"], ["Harpy observed a buildup of mechanized forces at Kore. Taking them out means less ground forces that oppose us.", "Sabotage the FOB", ""], [7111.11,16442.9,0], "CREATED", 2, true, "Destroy"] call BIS_fnc_taskCreate;
[player, ["task_destroyfobapc","task_destroyfob"], ["Destroy a Mack. Their mechanized advance will be crippled.", "Destroy APC", ""], objNull, "CREATED", -1, true, "Destroy"] call BIS_fnc_taskCreate;
[player, ["task_destroyfobtranstruck","task_destroyfob"], ["Destroy a HEMTT. Their troop movement tomorrow will be slowed.", "Destroy Transport Truck", ""], objNull, "CREATED", -1, true, "Destroy"] call BIS_fnc_taskCreate;
[player, ["task_destroyfobinfantry","task_destroyfob"], ["If it's possible, eliminate as much infantry as you can in Kore.", "OP: Kill Infantry", ""], objNull, "CREATED", -1, true, "Kill"] call BIS_fnc_taskCreate;
*/

//Hide Layers
_entitylayers = ["Spawn Reinforcements", "30 Reinforcements"];

{
    {
        _x enableSimulation false;
        _x hideObjectGlobal true;
    }forEach (getMissionLayerEntities _x select 0);
}forEach _entitylayers;

//Random furniture script by phonk
if ( (isServer) && !(isClass (configfile >> "CfgPatches" >> "TPW_MODS")) && !(isClass (configfile >> "CfgPatches" >> "Remasterizacion_main")) && !(isClass (configfile >> "CfgPatches" >> "furniture_mod")) ) then
{
	PFrun=false;
	[]spawn compileFinal(preprocessFile"PF\init.sqf")
};

//Hide arrows
_arrowmarkers = ["marker_101","marker_102","marker_104","marker_105","marker_106","marker_111"];
{
	_x setMarkerAlpha 0;
}forEach _arrowmarkers;

//Set AAF Squads dead
_aafdeadunits = ( (units deadunits_convoy) + (units deadunits_outpost) + (units deadunits_camp) + (units deadunits_sentry1) + (units deadunits_at1) 
);

{
	_x setDamage 1;
}forEach _aafdeadunits;

/*
_objectlayers = ["USMC HAB", "USMC HAB Surroundings"];
{
	{
		[_x] call BIS_fnc_replaceWithSimpleObject
	}forEach (getMissionLayerEntities _x select 0);
}forEach _objectlayers;
*/

execVM "squadoutfits.sqf";
intro_diag = execVM "t_intro.sqf";

{
	if ((side _x == west) && (_x isKindOf "CAManBase")) then 
	{
		_x removePrimaryWeaponItem "ef_snds_mxar_coy";
		_x removePrimaryWeaponItem "ef_optic_mbs_remote_coy";
		_x removePrimaryWeaponItem "optic_Hamr";
		//_x setDamage 0.2;
    };
	if (side _x == west) then 
	{
		_x setSkill ["aimingAccuracy", 0.3];
		_x setSkill ["aimingShake", 0.3];
		_x setSkill ["reloadSpeed", 0.1];
		_x setSkill ["spotDistance", 0.1];
	};
}forEach allunits;

plsquad = units pl1;
{
	_x setUnitTrait ["camouflageCoef", 0];
}forEach plsquad;

//pilotAI
_farppilots = [mchelipilot2];
{
	_x disableAI "TARGET";
	_x disableAI "WEAPONAIM";
	_x disableAI "FIREWEAPON";
	_x disableAI "SUPPRESSION";
	_x disableAI "AUTOCOMBAT";
	_x disableAI "RADIOPROTOCOL";
	_x disableAI "COVER";
	_x disableAI "AUTOTARGET";
	_x disableAI "LIGHTS";
}forEach _farppilots;

//remove MEH for wrecks
_disabledusveh = [clutter_rhino1, clutter_panther1, clutter_prowler1, clutter_prowler2, clutter_slammer1];

//Point system MEH
_MEHPoints = addMissionEventHandler ["EntityKilled", 
{
    params ["_killed", "_killer", "_instigator"];
	if (isNull _instigator) then 
	{ 
		_instigator = UAVControl vehicle _killer select 0;
	};
	if (isNull _instigator) then 
	{
		_instigator = _killer
	};
	if (_killed in _disabledusveh) exitWith {};
    if ( (side group _killed == west) && (_killed isKindOf "Car" || _killed isKindOf "Tank") ) then 
	{
        var_usdestroy = var_usdestroy + 1;
		//systemchat "vic destroyed";
    };
    if ( (side group _killed == west) && (_killed isKindOf "Air") ) then 
	{
        var_usdestroy = var_usdestroy + 3;
		//systemchat "air destroyed";
    };
	if ( (side group _killed == west) && (_killed isKindOf "CAManBase") ) then
	{
        var_usdestroy = var_usdestroy + 0.75;
		//systemchat "inf destroyed";
    };
	if ((isPlayer _instigator) && (side group _killed == civilian)) then 
	{
		civDead = civDead + 1;
		//_instigator sideChat "Fuck! I killed a civilian!";
	};
}];


//Increase point gain for helis
attackheli addEventHandler ["Killed", 
	{
	params ["_unit", "_killer", "_instigator"];
	var_usdestroy = var_usdestroy + 5;
}];

transportheli addEventHandler ["Killed", 
	{
	params ["_unit", "_killer", "_instigator"];
	var_usdestroy = var_usdestroy + 5;
}];

pl2 addEventHandler ["Killed", 
	{
	params ["_unit", "_killer", "_instigator"];
	if (isPlayer _instigator) then 
	{
		execVM "killedteam.sqf";
	};
}];

pl3 addEventHandler ["Killed", 
	{
	params ["_unit", "_killer", "_instigator"];
	if (isPlayer _instigator) then 
	{
		execVM "killedteam.sqf";
	};
}];

pl4 addEventHandler ["Killed", 
	{
	params ["_unit", "_killer", "_instigator"];
	if (isPlayer _instigator) then 
	{
		execVM "killedteam.sqf";
	};
}];

myrmidon addEventHandler ["Killed", 
	{
	params ["_unit", "_killer", "_instigator"];
	if (isPlayer _instigator) then 
	{
		execVM "scripts_d\t_killedmyr.sqf";
	};
}];

//Double MLRS damage
_usmcmlrs = [amb_mlrs1, amb_mlrs2, amb_mlrs3];
{
	_x addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage"];
		_damage * 2;
	}];
}forEach _usmcmlrs;

//Double Arty damage
_usmcarty = [amb_arty1, amb_arty2, amb_arty3];
{
	_x addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage"];
		_damage * 2;
	}];
}forEach _usmcarty;

//Switch all lights off
{
	_x switchLight "OFF";
} forEach (1 allObjects 0);

//Disable Simulation of Phonk's furniture disable triggers
_disablesimph = [PFBL_1,PFBL_2,PFBL_3,PFBL_4,PFBL_5,trg_movesquadsback,trg_aiacc];
{
	_x enableSimulation false;
}forEach _disablesimph;

//Hack UAV site hold action
hackuavatsite = [
	hackuavs, //Target
	"Hack UAVs", //Title
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa", //IdleIcon
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa", //ProgressIcon
	"true", //conditionShow
	"true", //conditionProgress
	{pl1 sidechat "Let's see here.."; playSound "ax_keyboardtyping"; [] spawn {sleep 1; hackuavs setObjectTexture [0, "images\desktop_s1.jpg"]; sleep 2; hackuavs setObjectTexture [0, "images\desktop_s2.jpg"];};}, //codeStart
	{}, //codeProgress
	{execVM "scripts_d\t_hackuav.sqf"; hackuavs setObjectTexture [0, "#(argb,8,8,3)color(0,0,0,0,co)"];}, //codeCompleted
	{pl1 sidechat "Maybe not now..";}, //codeInterrupted
	[], //Arguments
	5, //Duration
	nil, //Priority
	true, //removeCompleted
	false, //showUnconscious
	true //showWindow
] call BIS_fnc_holdActionAdd;

//Boost car hold action
_civcars = [civcar1,civcar2,civcar3];
{
	[
		_x, //Target
		"Boost Car", //Title
		"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_exit_CA.paa", //IdleIcon
		"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_exit_CA.paa", //ProgressIcon
		"_this distance _target < 5", //conditionShow
		"true", //conditionProgress
		{pl1 sidechat "Alright. I'll make a note of the house..."; playSound "ax_wrench";}, //codeStart
		{}, //codeProgress
		{_this select 0 lock 0;
		_playerswear = selectRandom [(["FECK!"] joinString ""),(["SHIT!"] joinString ""),(["BLOODY 'ELL!"] joinString ""),(["BOLLOCKS!"] joinString "")];pl1 sidechat _playerswear;["play", _this select 0] call BIS_fnc_carAlarm;var_carjack = 1;}, //codeCompleted
		{pl1 sidechat "Maybe not..";}, //codeInterrupted
		[], //Arguments
		5, //Duration
		nil, //Priority
		true, //removeCompleted
		false, //showUnconscious
		true //showWindow
	] call BIS_fnc_holdActionAdd;
}forEach _civcars;

/*
=========================hide or remove layers==========================
EXAMPLE: hide layers
[["layer_0", "layer_1"] true] call you_hide_layers

EXAMPLE: show layers
[["layer_0", "layer_1"]] call you_hide_layers

EXAMPLE: remove (permanent)
[["layer_0", "layer_1"], false, true] call you_hide_layers
========================================================================
*/

you_hide_layers = {

    params [["_layers", []], ["_show", false], ["_remove", false], ["_exec", {}]];

    if _remove then {_exec ={deleteVehicle _x}} else {_exec= {_x hideObjectGlobal _show}};

    for "_i" from 0 to count _layers -1  do {
        {call _exec} forEach ((getMissionLayerEntities (_layers select _i)) select 0)
    }
};

//ENABLE DEATH AND HIT REACTIONS FROM RF CDLC
if ((isClass (configfile >> "CfgPatches" >> "RF_Data")) && !(isClass (configfile >> "CfgPatches" >> "UVO")) && !(isClass (configfile >> "CfgPatches" >> "SSD_DeathScreams")) && !(isClass (configfile >> "CfgPatches" >> "SFX_Project_Remastered")) ) then
{
	[] spawn {
      sleep 1;
      if !(isNil "lxRF_initHitMarker") exitWith{};
      private _logicGroup = createGroup sideLogic;
      private _unit = _logicGroup createUnit ["ModuleHitMarker_RF", [0,0,0], [], 0, "NONE"];
      _unit setVariable ["HeadshotsOnly", true, true];
      _unit setVariable ["Scream", true, true];
      _unit setVariable ["bis_fnc_initModules_disableAutoActivation",false,true] ;
      [_unit] call BIS_fnc_moduleInit;
   };
}
else
{
	[] spawn {
      sleep 1;
      if !(isNil "lxRF_initHitMarker") exitWith{};
      private _logicGroup = createGroup sideLogic;
      private _unit = _logicGroup createUnit ["ModuleHitMarker_RF", [0,0,0], [], 0, "NONE"];
      _unit setVariable ["HeadshotsOnly", true, true];
      _unit setVariable ["Scream", false, true];
      _unit setVariable ["bis_fnc_initModules_disableAutoActivation",false,true] ;
      [_unit] call BIS_fnc_moduleInit;
   };
};

//raise bridge
if (isServer) then {
    [
        [[[6457.1,16201.8,44],[6457.85,16210.6,44],[6446.45,16205.6,44],[6464.45,16209.8,44],[6456.14,16191.2,44],[6444.79,16190.4,44],[6470.24,16197.2,44],[6449.72,16192.6,44]]]
    ] remoteExec ["setTerrainHeight", 0];
};