// Herne Hunter AI Script 
// by Rydygier & Gunter Severloh
// 
// Best practice always is to run on the server from .sqf file (for example initServer.sqf or init.sqf under isServer condition) for named groups: 
//   call compile preprocessFileLineNumbers "Herne.sqf";
// 
// Usage:
// Give enemy squad or unit a name in their group variable name box
// then run the code below from a initServer.sqf
// =============================================
// {
// [_x] call RYD_CH_Herne;
// }
// foreach [HuntingGroup1,HuntingGroup2];
//====================================================

RYD_CH_inBuilding =
	{
	params ["_unit","_buildings"];

	private _index = (_buildings findIf
		{
		private _building = _x;

		private _bb = 0 boundingBoxReal _building;
		private _bbMin = _bb select 0;
		private _bbMax = _bb select 1;

		private _bbMinX = _bbMin select 0;
		private _bbMinY = _bbMin select 1;
		private _bbMinZ = _bbMin select 2;

		private _bbMaxX = _bbMax select 0;
		private _bbMaxY = _bbMax select 1;
		private _bbMaxZ = _bbMax select 2;

		private _w2 = [_bbMaxX,0,0];

		private _h1 = [0,_bbMinY,0];
		private _h2 = [0,_bbMaxY,0];

		private _center = [(_bbMaxX + _bbMinX)/2,(_bbMaxY + _bbMinY)/2,0];

		private _bw2 = _building modelToWorldVisual _w2;

		private _bh1 = _building modelToWorldVisual _h1;
		private _bh2 = _building modelToWorldVisual _h2;

		private _bc = _building modelToWorldVisual _center;

		private _dir = _bh1 getDir _bh2;
		private _sizeW = _bc distance2D _bw2;
		private _sizeH = _bc distance2D _bh2;

		private _area = [_bc,_sizeW,_sizeH,_dir,true,(_bbMaxZ - _bbMinZ)/2];

		([false,(_unit inArea _area)] select ((_sizeW min _sizeH) > 2))
	});

	if (_index >= 0) then
		{
		private _house = _buildings select _index;
		private _housePositions = _house buildingPos -1;
		
		if ((count _housePositions) > 0) then
			{
			[_house,_housePositions]
			}
		else
			{
			[objNull,[]]
			};
		}
	else
		{
		[objNull,[]]
		};
	};
	
RYD_CH_findClosest =
	{
	private ["_reference","_objects","_closest","_distanceMinimal","_distanceActual","_object"];

	_reference = _this select 0;
	_objects = _this select 1;
	
	private _altitudeLimit = param [2,-1,[0]];
	private _altitudeStep = param [3,0,[0]];
	
	_closest = objNull;
	
	if not (_altitudeStep isEqualTo 0) exitWith
		{
		if ((count _objects) > 0) then
			{
			while {((_altitudeLimit < 32) and {_altitudeLimit > -32})} do
				{
				private _spots = if (_altitudeStep > 0) then
					{
					(_objects select {((_x select 2) > _altitudeLimit) and {(_x select 2) <= (_altitudeLimit + _altitudeStep)}})
					}
				else
					{
					(_objects select {((_x select 2) < _altitudeLimit) and {(_x select 2) >= (_altitudeLimit + _altitudeStep)}})
					};
				
				_closest = _reference;
				_distanceMinimal = 100000;

					{
					private _spot = _x;

					_distanceActual = _reference distance _spot;

					if (_distanceActual < _distanceMinimal) then
						{
						_closest = _spot;
						_distanceMinimal = _distanceActual;
						};
					}
				forEach _spots;
				
				if not (_closest isEqualTo _reference) exitWith 
					{

					};
					
				_altitudeLimit = _altitudeLimit + _altitudeStep;
				};
			};
			
		_closest
		};

	if ((count _objects) > 0) then
		{
		_closest = _objects select 0;
		_distanceMinimal = _reference distance _closest;

			{
			_object = _x;

			_distanceActual = _reference distance _object;

			if (_distanceActual < _distanceMinimal) then
				{
				_closest = _object;
				_distanceMinimal = _distanceActual;
				};
			}
		forEach _objects;
		};
		
	_closest
	};
	
RYD_CH_sortHousePositionsByLadders = 
	{
	params ["_housePositions","_step","_limits"];
	
	private _elevationThreshold = _limits select 0;
	private _ladders = [];
	
	private _maxElevation = _limits select 1;
	
	while {_elevationThreshold < _maxElevation} do
		{
		private _newLadder = _housePositions select {((_x select 2) < _elevationThreshold) and {(_x select 2) >= (_elevationThreshold - _step)}};

		if ((count _newLadder) > 0) then
			{
			_ladders pushBack _newLadder;
			};
			
		_elevationThreshold	= _elevationThreshold + _step;
		};

	_ladders
	};

RYD_CH_Herne = 
	{
	params ["_group"];

	private _onlyKnown = param [1,0,[0]];
	private _distanceLimit = param [2,-1,[0]];
	private _updateInterval = param [3,60,[0]];
	private _debugMode = param [4,false,[true]];
	
	if not (isNil "RYD_CH_WildHunt") then
		{
		RYD_CH_WildHunt pushBackUnique _group;
		}
	else
		{		
		RYD_CH_WildHunt = [_group];
		
		RYD_CH_Handle = [_onlyKnown,_distanceLimit,_updateInterval,_debugMode] spawn
			{
			params ["_onlyKnown","_distanceLimit","_updateInterval","_debugMode"];
						
			private _players = [];
			
			RYD_CH_WildHunt_switch = true;

			while {RYD_CH_WildHunt_switch} do
				{
				waitUntil
					{
					sleep 1;
					
					_players = (allPlayers - (entities "HeadlessClient_F")) select {(alive _x)};

					(({not (_x getVariable ["RYD_CH_Protected",false])} count _players) > 0)
					};

				private _deleteAt = [];
					
					{
					private _group = _x;
					private _leader = leader _group;
					private _units = units _group;
					
					if (_debugMode) then
						{
							{
							deleteVehicle ((_x getVariable ["RYD_CH_CurrentDestination",[[0,0,1000],-61,objNull]]) select 2);
							deleteVehicle (_x getVariable ["RYD_CH_myMiddlePos",objNull]);
							}
						foreach (_units select {not (alive _x)});
						};
										
					private _units = _units select {alive _x};
					
						{
						_currentDestination = _x getVariable ["RYD_CH_CurrentDestination",[[0,0,1000],-61,objNull]];
						_currentDestination = _currentDestination select 0;
						
						if ((_x distance _currentDestination) < 2) then
							{
							doStop _x;
							};
						}
					foreach _units;
					
					private _oldPrey = _group getVariable ["RYD_CH_myPrey",objNull];
					private _interval = if (alive _oldPrey) then
						{
						private _updateFactor = (((_leader distance _oldPrey)/1000)^0.75) min 1;
						
						((_updateInterval * _updateFactor) max 15)
						}
					else
						{
						0
						};
					
					if ((time - (_group getVariable ["RYD_CH_isHunting",-60])) > _interval) then
						{									
						if ((count _units) > 0) then
							{
							private _resetHunters = true;
							
							private _potentialPrey = if (_onlyKnown isEqualTo 2) then
								{
								(_players select {(((_group knowsAbout _x) > 0) and {not (_x getVariable ["RYD_CH_Protected",false])})})
								}
							else
								{
								(_players select {not (_x getVariable ["RYD_CH_Protected",false])})
								};
							
							if ((count _potentialPrey) > 0) then
								{						
								private _prey = [_leader,_players] call RYD_CH_findClosest;
								
								if (_debugMode) then
									{
									hintSilent format ["Distance: %1m\nKnowledge: %2\nTime: %3s",(_leader distance  _prey) toFixed 0,(_group knowsAbout _prey),time toFixed 0];
									};
								
								if not (_prey isEqualTo (_group getVariable ["RYD_CH_myPrey",objNull])) then
									{
									_group setVariable ["RYD_CH_myPrey",_prey];
									_group setVariable ["RYD_CH_myPreyKnowledge",(_group knowsAbout _prey)];
									};
																			
								private _distance = _leader distance2D _prey;
								
								if ((_distanceLimit < 0) or (_distance < _distanceLimit)) then
									{						
									private _targetKnowledge = _group knowsAbout _prey;
									if (_targetKnowledge < (_group getVariable ["RYD_CH_myPreyKnowledge",0])) then
										{
										_group setVariable ["RYD_CH_myPreyKnowledge",_targetKnowledge];
										};
																											
									_group setVariable ["RYD_CH_isHunting",time];
									
									if (_distance < 100) then
										{
										private _fullKnowledge = _targetKnowledge isEqualTo 4;
										
										private _blds = nearestObjects [_prey,["house"],30,true];
										private _bld = [_prey,_blds] call RYD_CH_inBuilding;
										private _housePositions = _bld select 1;
										_bld = _bld select 0;
									
										if (not (isNull _bld) and {(_onlyKnown isEqualTo 0) or {(_targetKnowledge > 0)}}) then
											{	
											private _previousBld = _group getVariable "RYD_CH_PreviousBuilding";
											
											if ((isNil "_previousBld") or {not (_previousBld isEqualTo _bld)}) then
												{
												_group setVariable ["RYD_CH_PreviousBuilding",_bld];
												_group setVariable ["RYD_CH_PreviousBuildingSearchTime",time];
												
													{
													if (_debugMode) then
														{
														deleteVehicle ((_x getVariable ["RYD_CH_CurrentDestination",[[0,0,1000],-61,objNull]]) select 2);
														deleteVehicle (_x getVariable ["RYD_CH_myMiddlePos",objNull]);
														};
													
													_x setVariable ["RYD_CH_CurrentDestination",nil];
													_x doMove (position _x);
													}
												foreach _units;
												
												_group setVariable ["RYD_CH_myPositionsToSearch",nil];
												}
											else
												{
												private _searchTime = _group getVariable ["RYD_CH_PreviousBuildingSearchTime",-601];
												if ((time - _searchTime) > 600) then
													{
													_group setVariable ["RYD_CH_myPositionsToSearch",nil];
													};
												};
												
											private _preyPosition = getPosATL _prey;
											private _closestHPosition = [_preyPosition,_housePositions,((_preyPosition select 2) + 2),-2] call RYD_CH_findClosest;

											private _positionsToSearch = _group getVariable "RYD_CH_myPositionsToSearch";
											
											private _hPositions = if (isNil "_positionsToSearch") then
												{
												private _ladders = ([_housePositions,2,[-32,32]] call RYD_CH_sortHousePositionsByLadders);
												private _toSearch = [];
												
													{
													private _ladder = _x;
													_ladderPositionsByDistance = _ladder apply {[_x distance _leader,_x]};
													_ladderPositionsByDistance sort true;
													_ladder = _ladderPositionsByDistance apply {(_x select 1)};
													
													_toSearch appEnd _ladder;
													}
												foreach _ladders;
												
												_group setVariable ["RYD_CH_myPositionsToSearch",_toSearch];
												
												_toSearch
												}
											else
												{
												_positionsToSearch
												};

											if ((count _hPositions) isEqualTo 0) exitWith {};
	
											_resetHunters = false;
											
											private _mySpeedMode = _group getVariable "RYD_CH_mySpeedMode";
											if (isNil "_mySpeedMode") then
												{
												private _targets = _group targets [true];
												
													{
													_x setVariable ["RYD_CH_theyKnow",(_group knowsAbout _x)];
													_group forgetTarget _x;
													}
												foreach _targets;
												
												_group setVariable ["RYD_CH_mySpeedMode",(speedMode _group)];
												_group setVariable ["RYD_CH_myCombatMode",(combatMode _group)];
												_group setVariable ["RYD_CH_myBehaviour",(combatBehaviour _group)];
												
													{										
													_x setUnitCombatMode "YELLOW";//seems meaningless - group's combat mode is the one, that actually makes a change, it seems. Just picked one with "keep formation" to avoid potential "pursue" behaviors. 
													_x setCombatBehaviour "STEALTH";//no yelling, possibly bit less pointless aiming at know target through the walls (?). CARELESS loooks wierd in this mix (frequent looking at the target through the walls while weapon lowered looks silly)
													
													_x setUnitPos "UP";//essential, does what supposed

													_x setVariable ["RYD_CH_myAIFeature_TARGET",_x checkAIFeature "TARGET"];
													_x setVariable ["RYD_CH_myAIFeature_COVER",_x checkAIFeature "COVER"];
													_x setVariable ["RYD_CH_myAIFeature_AUTOCOMBAT",_x checkAIFeature "AUTOCOMBAT"];
													_x disableAI "TARGET";//essential. Prevents sending group members with weird maneuver orders that overwrite doMove. 
													_x disableAI "COVER";//prevents interferences with "find cover" behaviors. Improives fluidness of movement - less weird stops or temporary moving towards "covers"
													_x disableAI "AUTOCOMBAT";//may prevent indivudal units changing set behavior to COMBAT, but seems unnecessary
													}
												foreach _units;
												
												_group setSpeedMode "FULL";//not sure, if makes any differfence, but may prevent interferences with occasional "return to formation" stuff
												_group setCombatMode "YELLOW";//probably anything but BLUE works samey. Just picked one with "keep formation" to avoid potential "pursue" behaviors. 
												_group setCombatBehaviour "STEALTH";//seems pointless, group's behavior turns COMBAT when enemy detected even, if this is set to CARELESS

													{
													_group reveal [_x,(_x getVariable ["RYD_CH_theyKnow",0])];
													_x setVariable ["RYD_CH_theyKnow",nil];
													}
												foreach _targets;
												};
																						
											_group setVariable ["RYD_CH_PreviousBuilding",_bld];
											
											private _unitsCount = count _units;
											
												{
												private _currentDestination = if (_debugMode) then
													{
													(_x getVariable ["RYD_CH_CurrentDestination",[[0,0,1000],-61,objNull]])
													}
												else
													{
													(_x getVariable ["RYD_CH_CurrentDestination",[[0,0,1000],-61]])
													};
													
												private _debugThing = if (_debugMode) then
													{
													(_currentDestination select 2)
													}
												else
													{
													objNull
													};
													
												private _currentDestinationTime = _currentDestination select 1;
												private _currentDestination = _currentDestination select 0;
												private _oldKnowledge = _group getVariable ["RYD_CH_myPreyKnowledge",0];
												if (_fullKnowledge) then
													{
													_group setVariable ["RYD_CH_myPreyKnowledge",_targetKnowledge];
													};

												if ((unitReady _x) or ((_x distance _currentDestination) < 2.5) or ((time - _currentDestinationTime) > 60) or {(_fullKnowledge) and {(_oldKnowledge < 4)}}) then
													{
													private _bldsUnit = nearestObjects [_x,["house"],30,true];
													
													if not (((_x distance _currentDestination) < 2.5) or ((time - _currentDestinationTime) > 60)) exitWith
														{
														if (_x getVariable ["RYD_CH_wasMiddlePos",false]) exitWith
															{
															_middlePos = _x getPos [(_x distance2D _bld)/2,(_x getDir _bld)];
															_x doMove _middlePos;
															
															if (_debugMode) then
																{
																(_x getVariable ["RYD_CH_myMiddlePos",objNull]) setPosATL _middlePos;
																};															
															};
														
														_x setVariable ["RYD_CH_wasMiddlePos",true];
														
														private _inBld = [_x,_bldsUnit] call RYD_CH_inBuilding;
														private _myBld = _inBld select 0;
														private _farFromEntrance = if (isNull _myBld) then
															{
															0
															}
														else
															{
															(_x distance (_myBld buildingExit 0))
															};

														private _middlePos = switch (true) do
															{
															case (isNull _myBld) : 
																{
																([_x,_housePositions,-1,2] call RYD_CH_findClosest)
																};
																
															case (_myBld isEqualTo _bld) : 
																{
																private _posA = getPosASL _x;
																private _posB = getPosASL _prey;
																private _inBetween = ASLtoATL [((_posA select 0) + (_posB select 0))/2,((_posA select 1) + (_posB select 1))/2,((_posA select 2) + (_posB select 2))/2];
																
																([_inBetween,(_inBld select 1)] call RYD_CH_findClosest)
																};
																
															case not (isNull _myBld) : 
																{
																private _entrance = _myBld buildingExit 0;
																
																if (_entrance isEqualTo [0,0,0]) exitWith
																	{
																	[0,0,0]
																	};
																
																private _closestToEntrance = [_entrance,(_inBld select 1)] call RYD_CH_findClosest;
																
																if ((_farFromEntrance - (_closestToEntrance distance _entrance)) > 3) then
																	{
																	_closestToEntrance
																	}
																else
																	{
																	[0,0,0]
																	};
																};
															
															default 
																{
																[0,0,0]
																};
															};
															
														if not (_middlePos isEqualType []) then
															{
															_middlePos = [0,0,0];
															};

														private _noPosition = false;
														if ((_middlePos isEqualTo [0,0,0]) or ((_middlePos distance _x) > 100)) then
															{
															_middlePos = _x getPos [(_x distance2D _bld)/2,(_x getDir _bld)];

															if ((([_middlePos,_bldsUnit] call RYD_CH_inBuilding) select 0) isEqualTo _bld) then
																{
																_noPosition = true;
																};
															};
															
														if (_noPosition) exitWith {};
														
														if (_debugMode) then
															{
															private _debugThing2 = createSimpleObject ["Sign_Arrow_Blue_F",ATLtoASL _middlePos,true];
															_x setVariable ["RYD_CH_myMiddlePos",_debugThing2];
															};
															
														_x doMove _middlePos;													
														};

													_x setVariable ["RYD_CH_wasMiddlePos",nil];
													
													if (_debugMode) then
														{
														deleteVehicle _debugThing;
														deleteVehicle (_x getVariable ["RYD_CH_myMiddlePos",objNull]);
														};
																											
													private _newPosition = if ((_fullKnowledge) and {((([_x,_bldsUnit] call RYD_CH_inBuilding) select 0) isEqualTo _bld)}) then
														{
														_closestHPosition
														}
													else
														{												
														if ((count _hPositions) > 0) then
															{
															private _myNewPosition = _hPositions select 0;
															_hPositions deleteAt 0;
															_group setVariable ["RYD_CH_myPositionsToSearch",_hPositions];
															
															_myNewPosition
															}
														else
															{
															_closestHPosition
															};
														};
													
													if (_debugMode) then
														{
														private _debugThing = createSimpleObject ["Sign_Arrow_Pink_F",ATLtoASL _newPosition,true];
														_x setVariable ["RYD_CH_CurrentDestination",[_newPosition,time,_debugThing]];
														}
													else
														{
														_x setVariable ["RYD_CH_CurrentDestination",[_newPosition,time]];
														};

													_x doMove _newPosition;
													};
													
												if ((count _hPositions) isEqualTo 0) exitWith {};
												}
											foreach _units;
											};
										}
									else
										{
										private _preyPosition = getPosATL _prey;
										
										private _targetKnowledgeFactor = 1 - (_targetKnowledge/4);
										
										private _huntPosition = _preyPosition getPos [(_distance/(2 + (_targetKnowledge * 2))) * (sqrt (random [0,_targetKnowledgeFactor,1])),(random 360)];
										
										if not (surfaceIsWater _preyPosition) then
											{
											private _precision = 1;
											while {(surfaceIsWater _huntPosition)} do
												{
												_huntPosition = _preyPosition getPos [(_distance/(2 + (_targetKnowledge * 2) + _precision)) * (sqrt (random [0,_targetKnowledgeFactor,1])),(random 360)];
												_precision = _precision + 1;
												
												if (_precision > 10) exitWith {};
												};
											};
										
										_huntPosition set [2,0];
										
										_group move _huntPosition;
										};
									};
								};
								
							if (_resetHunters) then
								{
								private _mySpeedMode = _group getVariable "RYD_CH_mySpeedMode";
								if not (isNil "_mySpeedMode") then
									{
									private _cm = _group getVariable ["RYD_CH_myCombatMode","YELLOW"];
									private _beh = _group getVariable ["RYD_CH_myBehaviour","AWARE"];
									
										{
										_x setUnitCombatMode _cm;
										_x setCombatBehaviour _beh;
										
										_x setUnitPos "AUTO";
										
										if (_x getVariable ["RYD_CH_myAIFeature_TARGET",true]) then
											{
											_x enableAI "TARGET";
											};
											
										if (_x getVariable ["RYD_CH_myAIFeature_COVER",true]) then
											{
											_x enableAI "COVER";
											};
											
										if (_x getVariable ["RYD_CH_myAIFeature_AUTOCOMBAT",true]) then
											{
											_x enableAI "AUTOCOMBAT";
											};
										
										_x doMove (position _x);
										}
									foreach _units;
									
									_group setSpeedMode _mySpeedMode;
									_group setCombatMode _cm;
									_group setCombatBehaviour _beh;
									
									_group setVariable ["RYD_CH_mySpeedMode",nil];
									};
								};	
							}
						else
							{
							_deleteAt pushBack _foreachIndex;
							};
						};
					}
				foreach RYD_CH_WildHunt;
				
				if ((count _deleteAt) > 0) then
					{
					reverse _deleteAt;
					
						{
						RYD_CH_WildHunt deleteAt _x;
						}
					foreach _deleteAt;
					};
				};
				
			RYD_CH_Handle = nil;
			};
		};
	};