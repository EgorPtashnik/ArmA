[]spawn
{
	7 fadeMusic 0;
	sleep 7;
	playMusic "";
	0 fadeMusic 1;
	playMusic ["tf2_stinklines", 9];
};

_aafplsquad = units pl1;

//Reduce damage if nothing else installed
if ( !(isClass (configfile >> "CfgPatches" >> "ace_medical_engine")) || !(isClass (configfile >> "CfgPatches" >> "PiR")) || !(isClass (configfile >> "CfgPatches" >> "Lifeline_revive")) || !(isClass (configfile >> "CfgPatches" >> "AI_Resurrection")) || !(isClass (configfile >> "CfgPatches" >> "PAR")) || !(isClass (configfile >> "CfgPatches" >> "JBOY_SOGAI_mod")) || !(isClass (configfile >> "CfgPatches" >> "diw_armor_plates_main")) ) then
{
	pl1 addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile"];
		if (_projectile isKindOf "BulletBase") then
		{
			_damage * 0.5
		} else 
		{
			_damage
		};
	}];
	_aisquad = [pl2,pl3,pl4,harpy,scylla,gyges1,gyges2,kinos1,kinos2];
	{
		_x addEventHandler ["HandleDamage", {
			params ["_unit", "_selection", "_damage"];
			_damage * 0.2;
		}];
	}forEach _aisquad;
};

cutText ["", "BLACK OUT", 4];

if (var_dirnw == 1) then
{
	pl1 sidechat "Fellas. We're hiking up north. Let's go.";
	[pl2,squadmovesouth] call BIS_fnc_holdActionRemove;
	[pl3,squadmovenorth] call BIS_fnc_holdActionRemove;
}
else
{
	pl1 sidechat "Guys, we're heading down south. Be ready.";
	[pl2,squadmovesouth] call BIS_fnc_holdActionRemove;
	[pl3,squadmovenorth] call BIS_fnc_holdActionRemove;
};
sleep 3;

plsquad2 sidechat "Copy that.";

sleep 2;
{
	_x enableAI  "MOVE";
	_x switchMove "AmovPercMstpSlowWrflDnon";
	_x enableAI "RADIOPROTOCOL";
}forEach _aafplsquad;

var_directionchoose = 1;

if (var_dirnw == 1) then
{
	skipTime 4;
	_entracemarkers = ["m_startse","m_arrownw","m_arrownw_2","m_arrowse","m_arrowse_1","m_arrowse_2","m_basilisk","m_border"];
	{
		_x setMarkerAlpha 0;
	}forEach _entracemarkers;
	
	{
		_x setPos (getmarkerpos "m_startnw");
	}forEach _aafplsquad;
}
else
{
	skipTime 2;
	_entracemarkers = ["m_startnw","m_arrownw","m_arrownw_2","m_arrowse","m_arrowse_1","m_arrowse_2","m_basilisk","m_border"];
	{
		_x setMarkerAlpha 0;
	}forEach _entracemarkers;

	{
		_x setPos (getmarkerpos "m_startse");
	}forEach _aafplsquad;
};

pl1 action ["nvGoggles", pl1];

/*
if ( (isClass (configfile >> "CfgPatches" >> "Missions_F_lxWS")) ) then
{
	pl1 addBackpack "I_UAV_02_backpack_lxWS";
}
else
{
	pl1 addBackpack "I_UAV_01_backpack_F";
};
*/

pl2 removeAllEventHandlers "Killed";
pl3 removeAllEventHandlers "Killed";
pl4 removeAllEventHandlers "Killed";

sleep 1;

amb_jet3 enableSimulation true;
amb_jet3 hideObject false;
amb_jet3 setCaptive true;
amb_jet3 setVelocity [150, 0, 0];
amb_jet3 flyInHeightASL [100, 100, 100];
nul = [] spawn 
{
	sleep 13;
	for "_i" from 1 to 5 do 
	{ 
		amb_jet3D forceWeaponFire ["CMFlareLauncher", "Burst"]; 
		sleep 3;
	}; 
};

cutText ["", "BLACK IN", 5];
clearRadio;

[]spawn {
["<t font='PuristaBold' color='#f7f9fa' size='1'>Hours later....</t>", -1, -1, 2, 1, 0, 789] call BIS_fnc_dynamicText;
};

{
	_x disableAI "RADIOPROTOCOL";
}forEach _aafplsquad;
sleep 3;
pl1 sidechat "Okay. We've arrived.";
sleep 5;
[]spawn
{
	pl1 sidechat "Gents. What we accomplish today may not be remembered. Hell, even shunned in the future.";
	sleep 7;
	pl1 sidechat "We stand at the enemy's doorstep. A horrible fate may await inside. But, our mission is clear!";
	sleep 7;
	pl1 sidechat "We must stop this tidal wave from crashing onto our shores and hurting OUR friends, OUR families!";
	sleep 7;
	pl1 sidechat "FOR! ALTIS!";
	sleep 4;
	plsquad2 sidechat "FOR ALTIS!";
	plsquad3 sidechat "FOR ALTIS!";
	plsquad4 sidechat "FOR ALTIS!";
	sleep 4;
	pl1 sidechat "Myrmekes, Basilisk has entered the AO. We're beginning disruptions now. Out.";
	deleteVehicle plsquad2;
	deleteVehicle plsquad3;
	deleteVehicle plsquad4;
	_aafplsquad = units pl1;
	{
		_x enableAI "RADIOPROTOCOL";
	}forEach _aafplsquad;
	sleep 2;
	saveGame;
};

_entitylayers = ["Starting Area"];

{
    {
        deleteVehicle _x;
    }forEach (getMissionLayerEntities _x select 0);
}forEach _entitylayers;

backpackContainer pl2 lockInventory false;
backpackContainer pl3 lockInventory false;

execVM "haboutfits.sqf";

sleep 120;

execVM "scripts_ambient\amb_flybya164.sqf";

_light = "#lightpoint" createVehicleLocal [0, 0, 0];
_light setPosASL getPosASL medlight;
_light setLightColor [1, 1, 1];
_light setLightAmbient [0.1, 0.1, 0.1];
_light setLightBrightness 1;
_light setLightIntensity 50;
_light setLightUseFlare false;
_light setLightDayLight true;
_light setLightAttenuation [1, 0, 0, 6];

sleep 60;

execVM "scripts_ambient\amb_flybyrandom.sqf";
