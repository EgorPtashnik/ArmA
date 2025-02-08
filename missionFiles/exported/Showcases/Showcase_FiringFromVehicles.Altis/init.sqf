//===================================================================
// PRE-INIT
//===================================================================
// Disable saving in MP
if (isMultiplayer) then {enableSaving [false, false]};

// Disable team switch
enableTeamSwitch false;

// Set callsigns
// Must be here due to different possible language settings per client
BIS_BHQ setGroupID [localize "STR_A3_CfgHQIdentities_BLU_0"];
BIS_group2 setGroupID [localize "STR_A3_Callsign_Kilo1"];
BIS_playerGroup setGroupID [localize "STR_A3_Callsign_Kilo2"];
BIS_extractD setGroupID [localize "STR_A3_Callsign_Thunder"];

// Set helicopter callsigns if the helicopters still exist
{
	if (!(isNil _x)) then {
		private ["_pilot", "_string"];
		_pilot = missionNamespace getVariable [_x, objNull];
		_string = format ["STR_A3_Callsign_Romeo%1", _forEachIndex + 1];
		_pilot setGroupID [localize _string];
	};
} forEach ["BIS_heli1D", "BIS_heli2D"];

// Set identities (in SP only)
if (!(isMultiplayer)) then {
	// Player
	BIS_player4 setIdentity "MARK_B_Player4";
	
	// Squad members
	BIS_player1 setIdentity "MARK_B_Player1";
	BIS_player2 setIdentity "MARK_B_Player2";
	BIS_player3 setIdentity "MARK_B_Player3";
};

// Ensure minimum overall & object visibility to see the helicopter wreck
if (viewDistance < 1300) then {setViewDistance 1300};
if ((getObjectViewDistance select 0) < 1300) then {setObjectViewDistance 1300};

// Helicopter particle effect control
BIS_fnc_missionEffect_smoke = {
	private ["_var", "_v"];
	_var = _this;
	_v = missionNamespace getVariable [_var, objNull];
	if (isNull _v) exitWith {};
	
	BIS_fnc_missionEffect_control = false;
	
	//--- smoke effect ---
	[_v] spawn {
		private ["_v","_smokeEffect","_vel"];
		_v = _this select 0;
		
		_smokeEffect = "#particlesource" createVehicleLocal [0,0,0];
		
		while {(alive _v) && !BIS_fnc_missionEffect_control} do {
			_vel = abs ((speed _v) + 1);
			_smokeEffect attachTo [_v,[0,/*(0.006*_vel) - 0.4*/0,0],"exhaust1"];
			if (_vel > 100) then {_vel = 100};
			_smokeEffect setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02", 8, 0, 40], "", "Billboard", 1, 4.5, [0,0,0], 
						[0, 0, 0.1], 0, 1.2, 1.0, 0.3, [0.5 + (0.0015*_vel),25 + (0.0075*_vel)], [[0.1,0.1,0.1,0.2],[0.2,0.2,0.2,0.03],[0.3,0.3,0.3,0.01],[0.4,0.4,0.4,0.001]], [0,1], 0.1, 0.05 + (0.00125 * _vel), "", "", ""];
			// ["JmenoModelu"],"NazevAnimace","TypAnimace",RychlostAnimace,DobaZivota,[Pozice],[SilaPohybu],Rotace,Hmotnost,Objem,Rubbing,[Velikost],[Barva],
			// [FazeAnimace],PeriodaNahodnehoSmeru,IntensitaNahodnehoSmeru,"OnTimer","PredZnicenim","Objekt";
			_smokeEffect setParticleRandom [2.5, [0.05, 0.05, 0.05], [0.4/_vel, 0.4/_vel, 0.4/_vel], 20, 0.05, [0, 0, 0, 0.1], 0, 0];
			//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity, {angle}, bounceOnSurface] 
			_smokeEffect setDropInterval (0.03 - (0.00018*_vel));
			sleep 0.15;
		};
		deleteVehicle _smokeEffect;
	};
};

if (!(isDedicated)) then {
	if (isNull player) then {
		[] spawn {
			scriptName "init.sqf: JIP control";
			
			waitUntil {alive player};
			
			player setPos [10,10,0];
			player enableSimulation false;
			
			sleep 1;
			
			// Respawn player
			forceRespawn player;
		};
	};
	
	waitUntil {!(isNull player)};
	
	// Briefing setup
	// Showcase subject
	player createDiarySubject [
		"Showcase",
		localize "STR_A3_Diary_Showcase_title"
	];
	
	// Showcase entry
	player createDiaryRecord [
		"Showcase",
		[
			localize "STR_A3_Diary_Summary_title",
			"<img image = '\a3\missions_f_mark\data\img\showcase_firingfromvehicles_briefing_ca.paa' width = '370' align = 'center'/>"
			+
			localize "STR_A3_Showcase_FiringFromVehicles_Overview"
		]
	];
	
	// Signal
	player createDiaryRecord [
		"Diary",
		[
			localize "STR_A3_Diary_Signal_title",
			format [
				localize "STR_A3_Showcase_FiringFromVehicles_Briefing_Signal_text1",
				"<marker name = 'BIS_heli2'>",	// %1
				"</marker>",			// %2
				"<br/>",			// %3
				"<marker name = 'BIS_heli1'>",	// %4
				"</marker>",			// %5
				"<br/>",			// %6
				"<marker name = 'BIS_heli1'>",	// %7
				"</marker>",			// %8
				"<br/>",			// %9
				"<br/>",			// %10
				"",				// %11 (for remote turrets)
				"",				// %12 (for remote turrets)
				"<br/>"				// %13 (for remote turrets)
			]
		]
	];
	
	// Execution
	player createDiaryRecord [
		"Diary",
		[
			localize "STR_A3_Diary_Execution_title",
			localize "STR_A3_Showcase_FiringFromVehicles_Briefing_Execution_text"
		]
	];
	
	// Mission
	player createDiaryRecord [
		"Diary",
		[
			localize "STR_A3_Diary_Mission_title",
			format [
				localize "STR_A3_Showcase_FiringFromVehicles_Briefing_Mission_text",
				"<marker name = 'BIS_heli1'>",		// %1
				"</marker>",				// %2
				"<marker name = 'BIS_heli2'>",		// %3
				"</marker>",				// %4
				"<marker name = 'BIS_crashSite'>",	// %5
				"</marker>"				// %6
			]
		]
	];
	
	// Situation
	player createDiaryRecord [
		"Diary",
		[
			localize "STR_A3_Diary_Situation_title",
			format [
				localize "STR_A3_Showcase_FiringFromVehicles_Briefing_Situation_text1",
				"<marker name = 'BIS_crashSite'>",	// %1
				"</marker>",				// %2
				"<br/><br/>",				// %3
				"<marker name = 'BIS_heli1'>",		// %4
				"</marker>",				// %5
				"<marker name = 'BIS_heli2'>",		// %6
				"</marker>",				// %7
				"<br/><br/>",				// %8 (for remote turrets)
				"",					// %9 (for remote turrets)
				""					// %10 (for remote turrets)
			]
		]
	];
	
	if (!(isMultiplayer)) then {
		 // Select the Showcase tab by default in SP
		 [] spawn {
			disableSerialization;
			
			scriptName "init.sqf: showcase tab default select";
			
			private ["_display", "_ctrl"];
			_display = findDisplay 37;
			_ctrl = _display displayCtrl 1001;
			
			// Wait for briefing to be populated
			waitUntil {lbSize _ctrl > 4};
			
			// Select the Showcase tab
			_ctrl lbSetCurSel 4;
		};
	};
};



waitUntil {time > 0};
//===================================================================
// POST-INIT
//===================================================================
// Sentries
{
	private ["_vehicle"];
	_vehicle = missionNamespace getVariable [_x, objNull];
	if (isNull _vehicle) exitWith {};
	_vehicle setCaptive true;
} forEach ["BIS_sentry1D", "BIS_sentry2D", "BIS_sentry1", "BIS_sentry2"];

// Crew status
{
	private ["_unit"];
	_unit = _x;
	{_unit disableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
	_unit setCaptive true;
} forEach [BIS_crew1, BIS_crew2];

[] spawn {
	scriptName "init.sqf: crew status";
	
	waitUntil {!(isNil "BIS_crewStatus")};
	
	private ["_inAnim"];
	_inAnim = false;
	
	if (BIS_crewStatus == 0) then {
		// Move into animations
		_inAnim = true;
		{_x switchMove "Acts_AidlPsitMstpSsurWnonDnon_loop"; sleep 1} forEach [BIS_crew1, BIS_crew2];
	};
	
	waitUntil {BIS_crewStatus == 1};
	
	if (!(_inAnim)) then {
		// Enable movement
		{
			private ["_unit"];
			_unit = _x;
			{_unit enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
		} forEach [BIS_crew1, BIS_crew2];
	} else {
		if (isServer) then {
			{
				// Play animation
				_x playMove "Acts_AidlPsitMstpSsurWnonDnon_out";
				
				// Track when animation finishes
				private ["_animEH"];
				_animEH = _x addEventHandler [
					"AnimDone",
					{
						private ["_unit", "_anim"];
						_unit = _this select 0;
						_anim = _this select 1;
						
						if (_anim == "Acts_AidlPsitMstpSsurWnonDnon_out") then {
							// Remove eventhandler
							_unit removeEventHandler ["AnimDone", _unit getVariable "BIS_animEH"];
							
							// Enable movement
							{_unit enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"];
							[[[_unit], {{(_this select 0) enableAI _x} forEach ["AUTOTARGET", "MOVE", "TARGET"]}], "BIS_fnc_spawn"] call BIS_fnc_MP;
						};
					}
				];
				
				_x setVariable ["BIS_animEH", _animEH];
				
				sleep 2;
			} forEach [BIS_crew1, BIS_crew2];
		};
	};
};

{
	private ["_heli"];
	_heli = missionNamespace getVariable [_x, objNull];
	if (isNull _heli) exitWith {};
	
	// Helicopter captive status
	_heli spawn {
		private ["_heli"];
		_heli = _this;
		
		scriptName (format ["init.sqf: heli captive status - [%1]", _heli]);
		
		private ["_units", "_variable"];
		_units = ([_heli] + units group driver _heli);
		_variable = format ["%1Captive", _heli];
		
		waitUntil {!(isNil _variable)};
		
		while {true} do {
			private ["_status"];
			_status = missionNamespace getVariable _variable;
			
			if (_status == 0) then {
				// Disable captive
				{_x setCaptive false} forEach _units;
			} else {
				// Enable captive
				{_x setCaptive true} forEach _units;
			};
			
			waitUntil {missionNamespace getVariable _variable != _status};
		};
	};
	
	// Helicopter lock status
	_heli spawn {
		private ["_heli"];
		_heli = _this;
		
		scriptName (format ["init.sqf: heli lock status - [%1]", _heli]);
		
		private ["_variable"];
		_variable = format ["%1Lock", _heli];
		
		waitUntil {!(isNil _variable)};
		
		while {true} do {
			private ["_status"];
			_status = missionNamespace getVariable _variable;
			
			// Apply lock
			_heli lock _status;
			
			waitUntil {missionNamespace getVariable _variable != _status};
		};
	};
} forEach ["BIS_heli1", "BIS_heli2"];

// Crash site captive status
[] spawn {
	scriptName "init.sqf: crash site captive status";
	
	waitUntil {{isNil _x} count ["BIS_crashCaptive", "BIS_crashUnits"] == 0};
	
	private ["_units"];
	_units = (["BIS_crashTruck1", "BIS_crashTruck2", "BIS_crashTruck3", "BIS_crashTruck4"] + BIS_crashUnits);
	
	if (BIS_crashCaptive == 0) then {
		waitUntil {BIS_crashCaptive == 1};
	};
	
	// Set as captive
	{
		private ["_unit"];
		_unit = missionNamespace getVariable [_x, objNull];
		if (!(isNull _unit)) then {_unit setCaptive true};
	} forEach _units;
};

// Town status
[] spawn {
	scriptName "init.sqf: town status";
	
	waitUntil {{isNil _x} count ["BIS_townStatus", "BIS_townUnits", "BIS_townTrucks"] == 0};
	
	private ["_changeStatus"];
	_changeStatus = {
		private ["_status"];
		_status = _this;
		
		if (_status == 0) then {
			// Hide units
			{
				_x setCaptive true;
				_x allowDamage false;
				
				if (isServer) then {
					_x hideObjectGlobal true;
					_x enableSimulationGlobal false;
					
					_x setVariable ["BIS_height", getPosATL _x select 2];
					[_x, 1000] call BIS_fnc_setHeight;
				};
			} forEach (BIS_townUnits + BIS_townTrucks + [BIS_secretGuard]);
		} else {
			// Unhide units
			{
				if (isServer) then {
					if (_x == BIS_gas1) then {
						BIS_gas1 assignAsGunner BIS_gasTruck1;
						BIS_gas1 moveInGunner BIS_gasTruck1;
					} else {
						[_x, _x getVariable "BIS_height"] call BIS_fnc_setHeight;
					};
					
					_x hideObjectGlobal false;
					_x enableSimulationGlobal true;
				};
				
				_x setCaptive false;
				_x allowDamage true;
			} forEach (BIS_townUnits + BIS_townTrucks + [BIS_secretGuard]);
		};
	};
	
	if (BIS_townStatus == 0) then {
		0 call _changeStatus;
		waitUntil {BIS_townStatus == 1};
		1 call _changeStatus;
	};
};

// Civilians status
[] spawn {
	scriptName "init.sqf: civilian status";
	
	waitUntil {{isNil _x} count ["BIS_townStatus", "BIS_civUnits"] == 0};
	
	private ["_changeStatus"];
	_changeStatus = {
		private ["_status"];
		_status = _this;
		
		if (_status == 0) then {
			// Hide units
			{
				private ["_unit"];
				_unit = missionNamespace getVariable [_x, objNull];
				
				if (!(isNull _unit)) then {
					_unit allowDamage false;
					
					if (isServer) then {
						_unit hideObjectGlobal true;
						_unit enableSimulationGlobal false;
						
						_unit setVariable ["BIS_height", getPosATL _unit select 2];
						[_unit, 1000] call BIS_fnc_setHeight;
					};
				};
			} forEach BIS_civUnits;
		} else {
			// Unhide units
			{
				private ["_unit"];
				_unit = missionNamespace getVariable [_x, objNull];
				
				if (!(isNull _unit)) then {
					if (isServer) then {
						if (_unit == BIS_civ4) then {
							_unit setPosATL [8630.73,18255.8,4.09308];
						} else {
							[_unit, _unit getVariable "BIS_height"] call BIS_fnc_setHeight;
						};
						
						_unit hideObjectGlobal false;
						_unit enableSimulationGlobal true;
					};
					
					_unit allowDamage true;
				};
			} forEach BIS_civUnits;
		};
	};
	
	if (BIS_townStatus == 0) then {
		0 call _changeStatus;
		waitUntil {BIS_townStatus == 1};
		1 call _changeStatus;
	};
};

// Extract status
[] spawn {
	scriptName "init.sqf: extract status";
	
	waitUntil {!(isNil "BIS_extractStatus")};
	
	private ["_changeStatus"];
	_changeStatus = {
		private ["_status"];
		_status = _this;
		
		if (_status == 0) then {
			// Hide extract
			{
				_x setCaptive true;
				_x allowDamage false;
				
				if (isServer) then {
					_x hideObjectGlobal true;
					_x enableSimulationGlobal false;
				};
			} forEach ([BIS_extract] + units group BIS_extractD);
			
			if (isServer) then {
				BIS_extract setVariable ["BIS_height", getPosATL BIS_extract select 2];
				[BIS_extract, 1000] call BIS_fnc_setHeight;
			};
		} else {
			// Unhide extract
			if (isServer) then {
				[BIS_extract, BIS_extract getVariable "BIS_height"] call BIS_fnc_setHeight;
			};
			
			{
				if (isServer) then {
					_x hideObjectGlobal false;
					_x enableSimulationGlobal true;
				};
				
				_x setCaptive false;
				_x allowDamage false;
			} forEach ([BIS_extract] + units group BIS_extractD);
		};
	};
	
	if (BIS_extractStatus == 0) then {
		0 call _changeStatus;
		waitUntil {BIS_extractStatus == 1};
		1 call _changeStatus;
	};
};

// Extract lock
[] spawn {
	scriptName "init.sqf: extract lock";
	
	waitUntil {!(isNil "BIS_extractLock")};
	
	while {true} do {
		private ["_lock"];
		_lock = BIS_extractLock;
		BIS_extract lock _lock;
		waitUntil {BIS_extractLock != _lock};
	};
};