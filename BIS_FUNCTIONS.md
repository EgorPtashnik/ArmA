# MENU
1. [BIS_fnc_addCommMenuItem](#bis_fnc_addcommmenuitem)
1. [BIS_fnc_removeCommMenuItem](#bis_fnc_removecommmenuitem)
1. [BIS_fnc_advHint](#bis_fnc_advhint)
1. [BIS_fnc_ambientAnim](#bis_fnc_ambientanim)
1. [BIS_fnc_ambientFlyby](#bis_fnc_ambientflyby)
1. [BIS_fnc_attachToRelative](#bis_fnc_attachtorelative)
1. [BIS_fnc_blackIn](#bis_fnc_blackin)
1. [BIS_fnc_blackOut](#bis_fnc_blackout)
1. [BIS_fnc_cinemaBorder](#bis_fnc_cinemaborder)
1. [BIS_fnc_dynamicText](#bis_fnc_dynamictext)
1. [BIS_fnc_earthquake](#bis_fnc_earthquake)
1. [BIS_fnc_enemyDetected](#bis_fnc_enemydetected)
1. [BIS_fnc_establishingShot](#bis_fnc_establishingshot)
1. [BIS_fnc_fireSupport](#bis_fnc_firesupport)
1. [BIS_fnc_fireSupportVirtual](#bis_fnc_firesupportvirtual)
1. [BIS_fnc_fireSupportCluster](#bis_fnc_firesupportcluster)
1. [BIS_fnc_getArea](#bis_fnc_getarea)
1. [BIS_fnc_holdActionAdd](#bis_fnc_holdactionadd)
1. [BIS_fnc_holdActionRemove](#bis_fnc_holdactionremove)
1. [BIS_fnc_moveIn](#bis_fnc_movein)
1. [BIS_fnc_jukebox](#bis_fnc_jukebox)
1. [BIS_fnc_infoText](#bis_fnc_infotext)
1. [BIS_fnc_lookAtArray](#bis_fnc_lookatarray)
1. [BIS_fnc_randomPos](#bis_fnc_randompos)
1. [BIS_fnc_findSafePos](#bis_fnc_findsafepos)
1. [BIS_fnc_randomPosTrigger](#bis_fnc_randompostrigger)
1. [BIS_fnc_showSubtitle](#bis_fnc_showsubtitle)
1. [BIS_fnc_spawnCrew](#bis_fnc_spawncrew)
1. [BIS_fnc_spawnEnemy](#bis_fnc_spawnenemy)
1. [BIS_fnc_spawnGroup](#bis_fnc_spawngroup)
1. [BIS_fnc_spawnObjects](#bis_fnc_spawnobjects)
1. [BIS_fnc_spawnVehicle](#bis_fnc_spawnvehicle)
1. [BIS_fnc_spotter](#bis_fnc_spotter)
1. [BIS_fnc_stalk](#bis_fnc_stalk)
1. [BIS_fnc_taskDefend](#bis_fnc_taskdefend)
1. [BIS_fnc_taskPatrol](#bis_fnc_taskpatrol)
1. [BIS_fnc_taskAttack](#bis_fnc_taskattack)
1. [BIS_fnc_textTiles](#bis_fnc_texttiles)
1. [BIS_fnc_typeText](#bis_fnc_typetext)
1. [BIS_fnc_typeText2](#bis_fnc_typetext2)
1. [BIS_fnc_fadeEffect](#bis_fnc_fadeeffect)

Some script commands
```
isEqualTo (val1 isEqualTo val2) - более строгое сравнение
setUnconscious (unit setUnconscious true) - падает без сознания
```

# BIS_fnc_addCommMenuItem
Добавляет комм меню (0-8) юниту.
```
[owner, itemClass, textArguments, expressionArguments, notification] call BIS_fnc_addCommMenuItem
```
- owner: Object - кому добавить
- itemClass: String - класс из `CfgCommmunicationMenu` (создается в `description.ext`)
- textArguments: Anything (o) - доп текст для оторбажения в `text` атрибуте. `%1` будет замененм первым элементом массива, `%2` вторым и т.д.
- expressionArguments: Anythin (o) - тоже самое, но для `expression`
- notification: String (o) - класс из `CfgNotification`. Пустая строка значит, что показывать ничего не надо
- RETURNS: Number - айди айтема (используется в BIS_fnc_removeCommMenuItem)

#### ПРИМЕР
https://community.bistudio.com/wiki/Arma_3:_Communication_Menu
```
class CfgCommunicationMenu
{
	class Attack;
	class Bravo: Attack
	{
		text = $STR_A3_radio_b;
		expression = "BIS_bravoGo = TRUE;";
		icon = "\a3\ui_f\data\map\markers\nato\b_inf.paa";
		removeAfterExpressionCall = 1;
	};
	class Echo: Attack
	{
		text = $STR_A3_radio_e;
		expression = "BIS_echoGo = TRUE;";
		icon = "\a3\ui_f\data\map\markers\nato\b_motor_inf.paa";
		removeAfterExpressionCall = 1;
	};
};
```
```
private _supportHeli = [player,"Support_Request_CAS_Heli"] call BIS_fnc_addCommMenuItem;

_supportHeli = [player,"Support_Request_CAS_Heli",nil,nil,""] call BIS_fnc_addCommMenuItem; // don't show notification
```

# BIS_fnc_removeCommMenuItem
Убирает комм меню (0-8) у юнита
```
[owner,itemID] call BIS_fnc_removeCommMenuItem
```
- owner: Object - у кого убрать
- itemID: Number - айди айтема (возвращается функцией BIS_fnc_addCommMenuItem)
#### ПРИМЕР
```
[player, 2] call BIS_fnc_removeCommMenuItem;

private _supportHeli = [player, "Support_Request_CAS_Heli"] call BIS_fnc_addCommMenuItem;
[player, _supportHeli] call BIS_fnc_removeCommMenuItem;
```

# BIS_fnc_advHint
Shows advanced hint to player.
```
[classes, duration1, condition1, duration2, condition2, showing, onlyFullHint, onlyOnce, useSound] call BIS_fnc_advHint
```
- classes: Array - array in format ["hint main class", "hint class"]
- duration1: Number - (Optional, default 15) duration of short hint in seconds
- condition1: String - (Optional, default "") condition for hiding the short hint
- duration2: Number - (Optional, default 35) duration of full hint in seconds
- condition2: String - (Optional, default "") condition for hiding the full hint
- showing: Boolean - (Optional, default false) true shows hint even if tutorial hints are disabled in game settings
- onlyFullHint: Boolean - (Optional, default false) true shows full hint without using of short hint
- onlyOnce: Boolean - (Optional, default false) show the hint in mission only once (true) or multiple times (false)
- useSound: Boolean - (Optional, default true) true plays a sound when the hint is opened
- RETURN: Nothing
#### EXAMPLES
```
[["Common", "GPS"]] call BIS_fnc_advHint;

[["Common", "GPS"], 15, "", 35, "", false, false, false, true] call BIS_fnc_advHint; // default
```

# BIS_fnc_ambientAnim
Play set of ambient animations on given unit. If the unit should react to combat, use BIS_fnc_ambientAnimCombat instead.
```
[unit, animationSet, equipmentLevel, snapTo, interpolate, attachToLogic] call BIS_fnc_ambientAnim
```
- unit: Object - unit that will play the animations
- animationSet: String - the animation set to play. Possible values: ```
STAND1
STAND2
STAND_U1
STAND_U2
STAND_U3
WATCH
WATCH2
GUARD
LISTEN_BRIEFING
LEAN_ON_TABLE
LEAN
SIT_AT_TABLE
SIT1
SIT
SIT3
SIT_U1
SIT_U2
SIT_U3
SIT_HIGH1
SIT_HIGH
SIT_LOW
SIT_LOW_U
SIT_SAD1
SIT_SAD2
KNEEL
REPAIR_VEH_PRONE
REPAIR_VEH_KNEEL
REPAIR_VEH_STAND
PRONE_INJURED_U1
PRONE_INJURED_U2
PRONE_INJURED
KNEEL_TREAT
KNEEL_TREAT2
BRIEFING
BRIEFING_POINT_LEFT
BRIEFING_POINT_RIGHT
BRIEFING_POINT_TABLE```
- equipmentLevel: String - the equipment level of the unit. Possible values: ```
NONE
LIGHT
MEDIUM
FULL
ASIS
RANDOM```
- snapTo: Object - (Optional, default objNull) the object where the unit will be snapped to
- interpolate: Boolean - (Optional, default false) should try to interpolate into the ambient animation. Works only for some default stances
- attachToLogic: Boolean - (Optional, default true) true to attach the unit to the created logic object, forcing it in one position
- RETURNS: Nothing
#### Examples
```
[player, "STAND1", "ASIS"] call BIS_fnc_ambientAnim;

// will search for a chair within 2 meters around the unit and will place the unit on it
[_unit, "SIT", "NONE"] call BIS_fnc_ambientAnim;

// instead of BIS_fnc_ambientAnimCombat
[this, "SIT2"] call BIS_fnc_ambientAnim;
0 = this spawn {
	waitUntil { behaviour _this == "combat"};
	_this call BIS_fnc_ambientAnim__terminate;
};
```

# BIS_fnc_ambientFlyby
Spawns an air unit that moves from point A to point B, never engaging nor being engaged. It is set as captive and will despawn once it reaches its destination.
```
[startPos, endPos, altitude, speedMode, classname, side] call BIS_fnc_ambientFlyby
```
- startPos: Position - start position of the air unit. The Z value does not matter and is replaced by altitude
- endPos: Array format PositionAGL - end position where the air unit moves to and despawns (through addWaypoint)
- altitude: Number - (Optional, default 100) height at which air unit will spawn and fly above ground level
- speedMode: String - (Optional, default "NORMAL") speed mode at which air unit travels. Possible values are `"LIMITED", "NORMAL"` and `"FULL"`
-classname: String - (Optional, default `"B_Heli_Light_01_F"`) vehicle classname defined in CfgVehicles
- side: Side - (Optional, default west) side to which the vehicle belongs
- RETURNS Boolean - true if function executed successfully.

#### Examples
```
// spawns a Littlebird that flies from position 200,200,50 to 250,250,75 at altitude 100 and normal speed
[[200,200,50], [250,250,75]] call BIS_fnc_ambientFlyby;

[getPosATL player, getPosATL opforUnit, 400, "FULL", "B_Heli_Light_01_Armed_F", west] call BIS_fnc_ambientFlyby;
```

# BIS_fnc_attachToRelative
Attaches object 1 to object 2, while preserving object 1 initial position and orientation against object 2.
```
[object1, object2, visual] call BIS_fnc_attachToRelative
```
- object1: Object
- object2: Object
- visual: Boolean (Optional, default true) if true render scope is used else simulation scope. See Simulation vs Render Time Scope for more information
- RETURNS: Nothing

#### Examples
`[tank, car] call BIS_fnc_attachToRelative;`

# BIS_fnc_blackIn
Unregister a black screen. When none other black screen is registered, fade it out.
```
[id, smoothing, fadeSpeed] call BIS_fnc_blackIn
```
- id: String - black screen id used for registration (case sensitive)
- smoothing: Boolean - (Optional, default true) smooth transition - false for an immediate blackout
- fadeSpeed: Number - (Optional, default 2) transition duration (if smoothing is true)
- RETURNS: Nothing
#### Examples
`["TAG_aVeryUniqueID", false, 5] call BIS_fnc_blackIn;`

# BIS_fnc_blackOut
Register a black screen. Start the black screen when the first request is registered.
```
[id, smoothing, fadeSpeed] call BIS_fnc_blackIn
```
- id: String - black screen id used for registration (case sensitive)
- smoothing: Boolean - (Optional, default true) smooth transition - false for an immediate blackout
- fadeSpeed: Number - (Optional, default 2) transition duration (if smoothing is true)
- RETURNS: Nothing
#### Examples
`["TAG_aVeryUniqueID", false, 5] call BIS_fnc_blackOut;`

# BIS_fnc_cinemaBorder
Creates cinematic borders. Player cannot move during cutscene.
```
[mode, duration, sound, view] call BIS_fnc_cinemaBorder
```
- mode: Number - can be:``` 
0 - In
1 - Out```
- duration: Number - (Optional, default 1.5) duration in seconds
- sound: Boolean - (Optional, default true) play sound
- view: Boolean - (Optional, default false) lock 1st-person-view
- RETURNS: Nothing
#### Example
`[1, 2, true, true] call BIS_fnc_cinemaBorder;`

# BIS_fnc_dynamicText
Shows dynamic opening credits or any type of text.
```
[text, x, y, duration, fadeInTime, deltaY, rscLayer] spawn BIS_fnc_dynamicText
```
- text: String - text to display
- x: Number or Array - (Optional, default -1)```
Number - Position in x
Array
0: Position in x
1: Width of the control```
- y: Number or Array - (Optional, default -1)```
Number - Position in y
Array
0: Position in y
1: Height of the control```
- duration: Number - (Optional, default 4) display duration
- fadeInTime: Number - (Optional, default 1) fade-in time
- deltaY: Number - (Optional, default 0) Y position delta:```
= 0: Text will not move > 0: Text will move down < 0: Text will move up
duration and the absolute deltaY value will influence the movement speed.```
- rscLayer: Number - resource layer
- RETURNS: Nothing
#### Example
`["<t color='#ff0000' size='.8'>Warning!<br />Stop doing what you are doing</t>",-1,-1,4,1,0,789] spawn BIS_fnc_dynamicText;`

# BIS_fnc_earthquake
Earthquake simulation - now just camera shake and sound. Stamina is impacted by the earthquake too. Earthquake will last between 13 and 20 seconds. While earthquake is in progress missionNamespace variable BIS_fnc_earthquake_inprogress will be true.
```
[intensity] spawn BIS_fnc_earthquake
```
- intensity: Number - (Optional, default 2) can be 1, 2, 3 or 4. Any other value will fall back to the default value
- RETURNS: Nothing

#### Example
`[4] spawn BIS_fnc_earthquake;`

# BIS_fnc_enemyDetected
Returns true if unit knows about nearby enemy unit or driven vehicle.
```
unit call BIS_fnc_enemyDetected
```
- unit - Object: unit that is inspected
- distance - Number: radius around unit to check
- RETURNS: Boolean: True if an enemy was detected
#### Example
```
private _enemyDetected = _unit call BIS_fnc_enemyDetected;

private _enemyDetected = [_unit, 100] call BIS_fnc_enemyDetected;
```

# BIS_fnc_establishingShot
Plays a fake UAV observational sequence which serves as an establishing shot.
```
[target, text, altitude, radius, angle, rotation, iconOptions, mode, fadeIn, waitTime] spawn BIS_fnc_establishingShot
```
- target: Object or Array - target or target's position
- text: String - (Optional, default "") text to display
- altitude: Number - (Optional, default 500) altitude in meters
- radius: Number - (Optional, default 200) radius of the circular movement in meters
- angle: Number - (Optional, default random) viewing angle in degrees
- rotation: Number - (Optional, default random) direction of camera movement```
0: anti-clockwise
1: clockwise```
- iconOptions: Array of Arrays - (Optional, default []) each array in format [icon, color, target, sizeX, sizeY, angle, text, shadow]:```
icon: String - path to icon texture
color: Array format Color (RGBA)
target: Object, Position or Group - where the texture should be drawn
sizeX: Number - (Optional, default 1) icon width
sizeY: Number - (Optional, default 1) icon height
angle: Number - (Optional, default random 360) icon angle
text: String - (Optional, default "") text displayed underneath the icon
shadow: Number - (Optional, default 0)
0 to draw a flat icon
1 to draw a shadowed icon```
- mode: Number - (Optional, default 0)```
0: normal (disables saving and sets BIS_missionStarted to nil)
1: world scenes (i.e. for main menu background, doesn't display text and does not end)```
- fadeIn: Boolean - (Optional, default true) fade in after completion
- waitTime: Number - (Optional, default 2) wait time in seconds after the shot has been completed
- RETURNS: Boolean - true when done
#### Examples
```
In order to change the camera to TI or NVG mode execute the following right after BIS_fnc_establishingShot was spawned.
true setCamUseTI 1;
The effect will automatically be terminated once the establishing shot ended.
```
```
[player, "I can see my house from here", 500, 250, 75, 1, [], 0, true] spawn BIS_fnc_establishingShot;

[
	[5229.97, 5233.07, 0],
	"BLUFOR and OPFOR firefight",
	500,
	250,
	75,
	1,
	[
		["\A3\ui_f\data\map\markers\nato\b_inf.paa", [0, 0.3, 0.6, 1], group_1, 1, 1, 0, "BLUFOR"],
		["\A3\ui_f\data\map\markers\nato\o_inf.paa", [0.5, 0, 0, 1], group_2, 1, 1, 0, "OPFOR"]
	],
	0,
	true,
	15
] spawn BIS_fnc_establishingShot;
```

# BIS_fnc_fireSupport
Mortar/artillery fire support.
```
[arty,target,mag,radius,rounds,delay,conditionEnd,safezone] spawn BIS_fnc_fireSupport
```
- arty: Object - artillery unit.
- target: Position or Object or String - target position, can be object/position 3D or marker name
- mag: String - magazine (if left empy, first magazine available will be used)
- radius: Number - radius of target area in meters
- rounds: Number - number of rounds to be fired
- delay: Array or Number - delay between rounds:```
Array
1: Min delay
2: Max dela
Number - Precise delay```
- conditionEnd: Code - condition to end bombardment before all rounds are fired
- safezone: Number - safezone radius - minimal distance from the target position where shells may be directed at
- RETURNS: Boolean - true if successful

#### Examples
```
[BIS_Mortar, [3600,3600,0], "", 100, 24, 10] spawn BIS_fnc_fireSupport;

[BIS_Mortar, BIS_Player, "8Rnd_82mm_Mo_shells", 100, 24, 10] spawn BIS_fnc_fireSupport;

[BIS_Mortar, "BIS_mrkTargetArea", "8Rnd_82mm_Mo_shells", 100, 24, 10, { BIS_Player distance BIS_EscapeZone < 100 }] spawn BIS_fnc_fireSupport;
```

# BIS_fnc_fireSupportVirtual
Fires virtual mortar/artillery fire support.
```
[target, ammo, radius, rounds, delay, conditionEnd, safezone, alt, speed, sounds] spawn BIS_fnc_fireSupportVirtual
```
- target: Position, Object or String - target position, can be object, position or marker name
- ammo: String - (Optional, default "Sh_82mm_AMOS") ammunition to be used (if left empty, Sh_82mm_AMOS ammunition will be used)
- radius: Number - (Optional, default 100) radius of target area in meters
- rounds: Number - (Optional, default 10) number of rounds to be fired
- delay: Array or Number - (Optional, default 10) delay between rounds```
Array [min, max]:
min: Number - min delay
max: Number - max delay```
```Number - Precise delay```
- conditionEnd: Code - (Optional, default { false }) condition to end bombardment before all rounds are fired
- safezone: Number - (Optional, default 0) safezone radius - minimal distance from the target position where shells may be directed at
- alt: Number - (Optional, default 250) altitude where the shell will be created
- speed: Number - (Optional, default 150) descending velocity, in m/s. Default is 150, if you use flare as ammo, set it to lower value (1-5) to let it fall down slowly
- sounds: Array of Strings - (Optional, default [""]) sounds to be played on the incoming shell
- REUTNRS: Boolean - true if successful

#### Examples
```
[BIS_Player, "Sh_82mm_AMOS", 100, 24, 10] spawn BIS_fnc_fireSupportVirtual;

[[3600, 3600, 0], nil, 100, 24, 10] spawn BIS_fnc_fireSupportVirtual;

[BIS_Player, nil, 100, 24, 10, {dayTime > 20}, 50] spawn BIS_fnc_fireSupportVirtual;
```

# BIS_fnc_fireSupportCluster
Virtual fire support - cluster shell.
```
[position,ammo,radius,rounds,delay,conditionEnd,safezone,altitude,velocity,sounds] spawn BIS_fnc_fireSupportCluster
```
- position: Position, Object or String - can be position, an object, or a marker
- ammo: String - (Optional, default "G_40mm_HEDP") ammunition class, nil or empty string to use 40mm HEDP shells
- radius: Number - (Optional, default 100) radius of the area in metres
- rounds: Array - (Optional, default [1,20]) number of rounds to be fired, can be:```
0: Number of shells
1: Number of submunition```
- delay: Array or Number - (Optional, default 10) delay between rounds in seconds, can be Number for precise delay or Array to set min and max delay
- conditionEnd: Code - (Optional, default {}) condition to end fire support
- safeZone: Number - (Optional, default 0) safezone radius in metres
- altitude: Number - (Optional, default 100) altitude in metres where the submunition will be spawned
- velocity: Number - (Optional, default 100) descending velocity, in m/s
- sounds: Array - (Optional, default [""]) strings of sounds to be played on the incoming submunition
- RETURNS: Boolean

#### Examples
```
[BIS_Player, "G_40mm_HEDP", 100, [4,10], 10] spawn BIS_fnc_fireSupportCluster;

[BIS_Victim,"G_40mm_HEDP", 100, [5,25], 10, { dayTime > 20 }, 75, 500, 150, ["shell1", "shell2"]] spawn BIS_fnc_fireSupportCluster;

["BIS_mrkTargetArea", "", 100, [4,10], 10, { BIS_Player distance BIS_EscapeZone < 100 }] spawn BIS_fnc_fireSupportCluster;
```

# BIS_fnc_getArea
Extracts area information from trigger, marker, location or array
```
param call BIS_fnc_getArea
```
- param:```
Object - trigger
String - marker
Location - location
Array - array in format [center, distance] or [center, [a, b, angle, rect]] or [center, [a, b, angle, rect, height]]```
- RETURNS: Array - in format [center, a, b, angle, isRectangle, height]
#### Examples
`private _area = [player, 100] call BIS_fnc_getArea;`

# BIS_fnc_holdActionAdd
Adds an action to an object which requires the user to hold a key to perform the action.
```
[target, title, idleIcon, progressIcon, conditionShow, conditionProgress, codeStart, codeProgress, codeCompleted, codeInterrupted, arguments, duration, priority, removeCompleted, showUnconscious, showWindow] call BIS_fnc_holdActionAdd
```
- target: Object - object the action is attached to
- title: String - title of the action shown in the action menu.It can contain Structured Text tags, such as ```<t color='#FFAA00'>text</t>```
- idleIcon: String - (Optional, default "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa") path of the idle icon shown on screen
- progressIcon: String - (Optional, default "\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa") path of the progress icon shown on screen
- conditionShow: String - (Optional, default "true") condition for the action to be shown.
Special arguments passed to the code: _target (action-attached object), _this (caller/executing unit)
- conditionProgress: String - (Optional, default "true") condition for the action to progress; if false is returned action progress is paused.
Special arguments passed to the code: _target, _caller, _actionId, _arguments
- codeStart: Code - (Optional, default {}) code executed when action starts.
Special arguments passed to the code: _target, _caller, _actionId, _arguments
Passed arguments are:
```
params ["_target", "_caller", "_actionId", "_arguments"];
target: Object - the object which the action is assigned to
caller: Object - the unit that activated the action
actionId: Number - ID of the activated action (same as ID returned by addAction)
arguments: Array - arguments given to the function
```
- codeProgress: Code - (Optional, default {}) code executed on every progress tick.
Special arguments passed to the code: _target, _caller, _actionId, _arguments, _frame
Passed arguments are:
```
params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];
target: Object - the object which the action is assigned to
caller: Object - the unit that activated the action
actionId: Number - ID of the activated action (same as ID returned by addAction)
arguments: Array - arguments given to the function
```
- frame: Number - current progress, goes from 1 to 24
- maxFrame: Number - maximum progress (24)
- codeCompleted: Code - (Optional, default {}) code executed on completion.
Special arguments passed to the code: _target, _caller, _actionId, _arguments
Passed arguments are:
params ["_target", "_caller", "_actionId", "_arguments"]; // same as codeStart
- codeInterrupted: Code - (Optional, default {}) code executed on interrupted.
Special arguments passed to the code: _target, _caller, _actionId, _arguments
Passed arguments are:
params ["_target", "_caller", "_actionId", "_arguments"]; // same as codeCompleted
- arguments: Array - (Optional, default []) arguments passed to codeStart, codeProgress, codeCompleted and - codeInterrupted (max 10) in format:
```
params [
	"_a0", "_a1", "_a2", "_a3", "_a4", "_a5", "_a6", "_a7", "_a8", "_a9", // custom arguments
	"_target", "_title", "_iconIdle", "_iconProgress",
	"_condShow", "_condProgress", "_codeStart", "_codeProgress", "_codeCompleted", "_codeInterrupted",
	"_duration", "_removeCompleted"
];
```
- duration: Number - (Optional, default 10) action duration, i.e. how much time it takes to complete the action
- priority: Number - (Optional, default 1000) priority value; actions are arranged in descending order according to this value
- removeCompleted: Boolean - (Optional, default true) remove on completion
- showUnconscious: Boolean - (Optional, default false) show in unconscious state
- showWindow: Boolean - (Optional, default true) show on screen; if false action needs to be selected from action menu to appear on screen
- RETURNS: Number - action ID

#### Examples
```
[
	player,
	"Kill",
	"", "",
	"true", "true",
	{ hint "Started!" },
	{ systemChat str (_this select 3) },
	{ player setDamage 1 },
	{ hint "Afraid of death?" },
	[], 10, nil, true, false
] call BIS_fnc_holdActionAdd;

// adds the action to every client and JIP, but also adds it when it was already removed. E.g., Laptop has already been hacked by a player
[
	_myLaptop,														// Object the action is attached to
	"Hack Laptop",													// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",									// Condition for the action to be shown
	"_caller distance _target < 3",									// Condition for the action to progress
	{},																// Code executed when action starts
	{},																// Code executed on every progress tick
	{ _this call MY_fnc_hackingCompleted },							// Code executed on completion
	{},																// Code executed on interrupted
	[],																// Arguments passed to the scripts as _this select 3
	12,																// Action duration in seconds
	0,																// Priority
	true,															// Remove on completion
	false															// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _myLaptop];				// MP-compatible implementation
```
holdActionAdd icons
```
"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_access_fm_CA.paa"
"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_end_sim_CA.paa"
"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_exit_CA.paa"
"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_start_sim_CA.paa"
"\a3\Missions_F_Orange\Data\Img\Showcase_LawsOfWar\action_view_article_CA.paa"
"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_loadVehicle_ca.paa"
"\a3\data_f_destroyer\data\UI\IGUI\Cfg\holdactions\holdAction_unloadVehicle_ca.paa"
"\a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa"
"\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_start_ca.paa"
"\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_stop_ca.paa"
"\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa"
"\a3\props_f_enoch\items\tools\data\tinfoil_action_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_passleadership_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_requestleadership_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff2_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa"
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_0_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_1_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_2_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_3_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_4_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_5_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_6_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_7_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_8_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_9_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_10_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\idle\idle_11_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\in\in_0_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\in\in_1_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\in\in_2_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\in\in_3_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_0_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_1_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_2_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_3_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_4_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_5_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_6_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_7_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_8_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_9_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_10_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_11_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_12_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_13_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_14_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_15_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_16_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_17_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_18_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_19_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_20_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_21_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_22_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_23_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress2\progress_24_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_0_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_1_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_2_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_3_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_4_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_5_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_6_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_7_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_8_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_9_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_10_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_11_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_12_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_13_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_14_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_15_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_16_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_17_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_18_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_19_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_20_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_21_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_22_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_23_ca.paa"
"\a3\ui_f\data\igui\cfg\holdactions\progress\progress_24_ca.paa"
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\attack_ca.paa"
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa"
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\holdAction_market_ca.paa"
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\holdAction_sleep2_ca.paa"
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\holdAction_sleep_ca.paa"
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa"
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\meet_ca.paa"
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\refuel_ca.paa"
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa"
"\a3\ui_f_orange\Data\CfgOrange\Missions\action_aaf_ca.paa"
"\a3\ui_f_orange\Data\CfgOrange\Missions\action_csat_ca.paa"
"\a3\ui_f_orange\Data\CfgOrange\Missions\action_escape_ca.paa"
"\a3\ui_f_orange\Data\CfgOrange\Missions\action_fia_ca.paa"
"\a3\ui_f_orange\Data\CfgOrange\Missions\action_fragment_back_ca.paa"
"\a3\ui_f_orange\Data\CfgOrange\Missions\action_fragment_ca.paa"
"\a3\ui_f_orange\Data\CfgOrange\Missions\action_idap_ca.paa"
"\a3\ui_f_orange\Data\CfgOrange\Missions\action_nato_ca.paa"
"\a3\ui_f_aow\data\igui\cfg\holdactions\holdaction_charity_ca.paa"
```

addAction Icons
```
"\a3\ui_f\data\igui\cfg\actions\takeflag_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\talk_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\unloadallvehicles_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\unloadincapacitated_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\unloadvehicle_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\vtolvectoring_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\vtolvectoringcancel_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\arrow_down_gs.paa"
"\a3\ui_f\data\igui\cfg\actions\arrow_up_gs.paa"
"\a3\ui_f\data\igui\cfg\actions\autohover_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\bandage_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\beacons_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\beacons_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\cancelhover_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\clear_empty_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\close_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\eject_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\engine_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\engine_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\flapsextend_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\flapsretract_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\gear_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\getincargo_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\getincommander_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\getindriver_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\getingunner_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\getinpilot_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\getout_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\heal_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_batt_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_batt_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_brk_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_col_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_col_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_land_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_land_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_start_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_start_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_thtl_idl_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_thtl_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_cpt_thtl_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ico_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ladderdown_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ladderoff_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\ladderup_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\landingautopilot_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\landingautopilot_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\loadvehicle_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\open_door_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\periscopedepth_off_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\periscopedepth_on_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\radaroff_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\radaron_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\reammo_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\refuel_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\reload_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\repair_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\returnflag_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\settimer_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\take_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_arrow_up_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_cancel_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_cancel_manualfire_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_deactivate_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_enter_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_exit_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_fire_in_flame_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_fire_put_down_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_gear_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_getin_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_getincargo.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_ladderondown_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_ladderonup_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_manualfire_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_open_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_takemagazine_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_takemine_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_takeweapon_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_teamswitch_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_turnin_ca.paa"
"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_turnout_ca.paa"
"\a3\ui_f_jets\data\igui\cfg\actions\action_attachtocatapult_ca.paa"
"\a3\ui_f_jets\data\igui\cfg\actions\action_detachtocatapult_ca.paa"
"\a3\ui_f_jets\data\igui\cfg\actions\action_launchfromcatapult_ca.paa"
```
SCRIPT TO SHOW ALL ICONS
```
0 spawn
{
	// EXECUTE IN EDEN EDITOR OR EDITOR PREVIEW!
	disableSerialization;

	private _display = findDisplay 313 createDisplay "RscDisplayEmpty";

	private _edit = _display ctrlCreate ["RscEdit", 645];
	_edit ctrlSetPosition [safezoneX + 50 * pixelW, safezoneY + 50 * pixelH, safezoneW - 500 * pixelW, 50 * pixelH];
	_edit ctrlSetBackgroundColor [0,0,0,1];
	_edit ctrlCommit 0;

	private _status = _display ctrlCreate ["RscEdit", 1337];
	_status ctrlSetPosition [safezoneX + safezoneW - 400 * pixelW, safezoneY + 50 * pixelH, 350 * pixelW, 50 * pixelH];
	_status ctrlSetBackgroundColor [0,0,0,1];
	_status ctrlCommit 0;
	_status ctrlEnable false;

	private _tv = _display ctrlCreate ["RscTreeSearch", -1];
	_tv ctrlSetFont "EtelkaMonospacePro";
	_tv ctrlSetFontHeight 0.05;
	_tv ctrlSetPosition [safezoneX + 50 * pixelW, safezoneY + 125 * pixelH, safezoneW - 100 * pixelW, safeZoneH - 175 * pixelH];
	_tv ctrlSetBackgroundColor [0,0,0,1];
	_tv ctrlCommit 0;

	_tv ctrlAddEventHandler ["treeSelChanged",
	{
		params ["_ctrlTV", "_selectionPath"];
		copyToClipboard (_ctrlTV tvText _selectionPath);
		playSound ("RscDisplayCurator_ping" + selectRandom ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"]);
		(ctrlParent _ctrlTv) displayCtrl 1337 ctrlSetText "Path copied to clipboard!";
	}];

	private _counter = 0;
	{
		private _files = addonFiles [_x # 0, ".paa"];
		{
			if ("\actions" in _x || "\holdaction" in _x) then
			{
				_counter = _counter + 1;
				_status ctrlSetText format ["%1 textures found.", _counter];
				private _index = _tv tvAdd [[], _x];
				_tv tvSetPicture [[_index], _x];
			};
		} forEach _files;
	} foreach allAddonsInfo;

	_tv tvSortall [[], false];
};
```

# BIS_fnc_holdActionRemove
Removes a hold action. This does exactly the same as removeAction.
```
[target,ID] call BIS_fnc_holdActionRemove
```
- target: Object - object the action is attached to
- ID: Number - action ID
- RETURNS: Nothing
#### Example
```
[player,10] call BIS_fnc_holdActionRemove;
```

# BIS_fnc_moveIn
Moves a unit into vehicle. Compatible with assignedVehicleRole output.
```
[vehicle, unit, role] call BIS_fnc_moveIn
```
- vehicle: Object
- unit: Object - the unit to move into vehicle - must be local
- role: Array - wanted seat, in format ["role"] or ["role", turretPath]. Can be one of:
```
"driver"
"gunner"
"commander"
"cargo"
"turret"
"": will load unit in the first available seat (using moveInAny)
```
- RETURNS: Boolean - true if moved in successfully
#### Example
```
[myCar, player, "cargo"] call BIS_fnc_moveIn;

[myTank, player, ["turret", [0]]] call BIS_fnc_moveIn;

[myTank, player, ["turret", -1]] call BIS_fnc_moveIn; // will moveInDriver the player
```

# BIS_fnc_jukebox
Plays music, depending on the player group status.
```
[function, parameters] call BIS_fnc_jukebox
```
- function: String - (Optional, default "initialize") can be one of:
```
"initialize"
"terminate"
"readContainerFromConfig"
"isInitialized"
"forceBehaviour"
"status"
"randomMusic"
"selectMusic"
"playMusic"
"nearEnemies"
"hasContact"
"isContact"
"isStealth"
"isCombat"
"isSafe"
"onEachFrame"
```
- parameters: Array - (Optional)
    - "initialize": [stealthMusics, combatMusics, safeMusics, volume, transition, radius, executionRate, noRepeat]
        - stealthMusics: Array of Strings
        - combatMusics: Array of Strings
        - safeMusics: Array of Strings
        - volume: Number
    - "terminate": none
    - "readContainerFromConfig": [wantedTheme]
    - "isInitialized": none
    - "forceBehaviour": [behaviour]
        - behaviour: String - can be "stealth", "combat" or "safe". Any other value will reset the forced behaviour.
    - "status": none
    - "randomMusic": [container]
        - container: Array of Strings - music list to choose from
    - "selectMusic": none
    - "playMusic": [musicName]
        - musicName: String
    - "nearEnemies": none
    - "hasContact": none
    - "isContact": none
    - "isStealth": none
    - "isCombat": none
    - "isSafe": none
    - "onEachFrame": none
- RETURNS:
```
Array for:
    "readContainerFromConfig"
    "nearEnemies" - a list of enemies nearby
Boolean for:
    "isInitialized"
    "hasContact"
    "isContact"
    "isStealth"
    "isCombat"
    "isSafe"
String for:
    "status" - can be "stealth", "combat", "safe" or "error"
    "randomMusic" - one of the available musics
    "selectMusic"
Nothing for:
    "initialize"
    "terminate"
    "forceBehaviour"
    "playMusic"
    "onEachFrame"
```

#### Example
`[] call BIS_fnc_jukebox;`

# BIS_fnc_infoText
Display a text in the "mission" GUI area with some effects. Good for the beginning of a mission.
```
[string_1, string_2, string_n] spawn BIS_fnc_infoText
```
- Array of Strings
- RETURNS: Nothing
#### Example
```
["Somewhere on Altis", format ["Year %1", date select 0], mapGridPosition player] spawn BIS_fnc_infoText;
```

# BIS_fnc_lookAtArray
Executes a code when one of the specified objects is looked at (player's cursor pointed towards it) for enough time
```
[initialize, lookAtData] call BIS_fnc_lookAtArray
```
- initialize: Boolean - true to initialize, false to remove it
-lookAtData: Array - an array with arrays of look-up-data in form of:
```
0: Object - Object to be looked at
1: Number - How long player has to look at it
2: Boolean - true to remove it from array when player looked at it
3: Code - Code spawned when player looked long enough at the object
```
- RETURNS: Nothing
#### Example
```
private _lookAtArray =
[
	[
		BIS_apc,										// name of object
		2,												// time we have to look at it
		false,											// do we destroy the entry after we looked at it
		{ ["What a wonderful APC"] call BIS_fnc_log; }	// code
	],
	[
		BIS_otherUnit,
		2,
		false,
		{ ["apc looked at"] call BIS_fnc_log; }
	]
];
[true, _lookAtArray] spawn "BIS_fnc_lookAtArray";
sleep 15;
[false] spawn "BIS_fnc_lookAtArray";
```

# BIS_fnc_randomPos
Selects random position according to given params within given area
```
[whitelist, blacklist, code] call BIS_fnc_randomPos
```
- whitelist: Array - whitelisted areas. If not given, whole map is used. Areas can be:
```
Object - trigger
String - marker
Array - in format [center, radius] or [center, [a, b, angle, rect]]
Location - location
```
- blacklist: Array - (Optional, default []) blacklisted areas. If not given, water is blacklisted. Areas can be:
```
Object - trigger
String - marker name or special tags names: "water" - exclude water, "ground" - exclude land
Array - in format [center, radius] or [center, [a, b, angle, rect]]
Location - location
```
- code: Code - (Optional, default { true }) custom condition which should return true for current position candidate passed in _this variable to be accepted. If not specified all candidates are accepted
- RETURNS: Array - position candidate in format [x,y,z] or [0,0] if position cannot be found
#### Example
```
private _randomPosMapNoWater = [] call BIS_fnc_randomPos;

private _randomPosMapNoWater = [nil, ["water"]] call BIS_fnc_randomPos;

private _randomPosMapNoLand = [nil, ["ground"]] call BIS_fnc_randomPos;

private _randomPosMap = [nil, []] call BIS_fnc_randomPos;

private _randomPosAroundPlayer = [[[position player, 50]], []] call BIS_fnc_randomPos;
```

# BIS_fnc_findSafePos

This function generates position on a map according to several given parameters (see diagram).

Diagram
The position pos will be generated inside an area which resides between minDist and maxDist from the given center. If objDist is also specified, the position will be selected objDist away from nearest terrain object. If maxGrad > 0 then the position will be also checked for how flat the area around is within objDist radius. The function can additionally be instructed to generate position specifically on water or land (waterMode) or on a shoreline (shoreMode). The shoreLine param will be ignored if position is not requested specifically on land.


Additionally, generated position could be checked against the list of blacklisted positions blacklistPos. If search for suitable position failed, defaultPos position will be used. The format for defaultPos is array with 2 positions: [posOnLand, posOnWater].
```
[center, minDist, maxDist, objDist, waterMode, maxGrad, shoreMode, blacklistPos, defaultPos] call BIS_fnc_findSafePos
```

# BIS_fnc_randomPosTrigger
Selects random position within trigger, marker, location area or area defined by array
```
param call BIS_fnc_randomPosTrigger
```
- param: can be one of:
	- Object - trigger
	- String - marker
	- Location - location
	- Array - array in format [center, distance] or [center, [a, b, angle, rect]] or [center, [a, b, angle, rect, height]]
- RETURNS: Array - random position in format [x,y,z]

#### Example
`marker1 call BIS_fnc_randomPosTrigger;`

# BIS_fnc_showSubtitle
Displays a subtitle at the bottom of the screen.
```
[name, subtitle] spawn BIS_fnc_showSubtitle
```
- name: String - name of the speaker
- subtitle: String - subtitle to display
- RETURNS: Script Handle - script controlling the displayed subtitle
#### Example
`["CROSSROAD", "Mission is a go, I repeat, mission is a go, Crossroad, out."] spawn BIS_fnc_showSubtitle;`

# BIS_fnc_spawnCrew
Function to fill all crew positions in a vehicle, including turrets. In dummy mode no objects are created and the returned array contains only ones; this mode can be used to count the actual crew of an existing vehicle or vehicle type (see also crew, fullCrew).
```
[vehicle, group, dummyMode, dummyType, crewType] call BIS_fnc_spawnCrew
```
- vehicle: Object - vehicle
- group: Group - crew's group
- dummyMode: Boolean - (Optional, default false) true to enable dummy mode
- dummyType: String - (Optional, default "") dummy type
- crewType: String - (Optional, default "") crew type
- RETURNS: Array or Number - created crew objects or crew count

#### Example
`[BIS_vehicle, group player] call BIS_fnc_spawnCrew;`

# BIS_fnc_spawnEnemy
Constantly spawns enemies around a player according to array of enemy classes. The units will try to hunt down the player.
```
[aPlayer, target, side, classes, maxEnemies, delay, code] spawn BIS_fnc_spawnEnemy
```
- aPlayer: Object - a unit that is a player
- target: Object - reference object (enemies will be spawned on same direction in respect to the player)
- side: Side - side of the spawned enemies
- classes: Array of Strings - list of enemy classes (units will form a group together) ⚠ Classes must be of the defined side, otherwise they will attack each other.
- maxEnemies: Number - (Optional, default 10) maximum number of enemies at once
- delay: Number - (Optional, default 30) time between spawn waves
- code: Code - (Optional, default {}) - code to execute on each unit (referenced by _this)
- RETURNS: Nothing
`[player, player, opfor, ["O_Soldier_F"]] spawn BIS_fnc_spawnEnemy;`

# BIS_fnc_spawnGroup
Function which handles the spawning of a dynamic group of characters. The composition of the group can be passed to the function. Alternatively a number can be passed and the function will spawn that amount of characters with a random type.
```
[position, side, toSpawn, relPositions, ranks, skillRange, ammoRange, randomControls, azimuth, precisePos, maxVehicles] call BIS_fnc_spawnGroup
```
- position: Array format Position - group's starting position
- side: Side - group's side
- toSpawn - can be one of:
	- Array - list of character types
	- Number - amount of characters to spawn
	- Config - CfgGroups entry
- relPositions: Array of Positions (Optional, default []) a list of relative positions
- ranks: Array of Strings/Numbers - (Optional, default []) ranks (see BIS_fnc_setRank) - must be same size as toSpawn's array
- skillRange: Array of Numbers - (Optional, default []) skill range format [min, max]
- ammoRange: Array of Numbers - (Optional, default []) ammunition range (0..1) format [min, max]
- randomControls: Array of Numbers - (Optional, default [-1, 1]) to format [minUnits, chance]:
	- minUnits: Number - (Optional, default -1) amount of mandatory units
	- chance: Number - (Optional, default -1) spawn chance for remaining units in range 0..1
- azimuth: Number - (Optional, default 0) azimuth/direction
- precisePos: Boolean - (Optional, default true) forces precise position placement
- maxVehicles: Number - (Optional, default 10e10) vehicle number limit
- RETURNS: Group

#### Example
```
//Spawn five random EAST units at aPosition:
[getPosATL aPosition, east, 5] call BIS_fnc_spawnGroup;

//Spawn a Stryker MGS Platoon at marker "tankSpawn":
[getMarkerPos "tankSpawn", side player, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Armored" >> "US_MGSPlatoon")] call BIS_fnc_spawnGroup;

//Spawn a TK Militia Medic and Soldier at aPos facing south:
[getPos aPos, east, ["TK_INS_Bonesetter_EP1", "TK_INS_Soldier_2_EP1"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
```

# BIS_fnc_spawnObjects
Create a stack of objects at given position or on top of given object (eg. table).
```
[position, className, count, offsetMatrix, offsetDir, dirNoise, enableSimulation] call BIS_fnc_spawnObjects
```
- position: Array format PositionASL, or Array as [referenceObject, placement]
	- referenceObject: Object
	- placement: String - can be:
		- "BOTTOM" = at the bottom of the object
		- "TOP" = top of the objects boundingbox
		- "GROUND" = sitting just on the ground
		- "ROADWAY" = sitting just on the ground
- className: String - class of the object(s) to spawn; all will use the same class
- count: Number - (Optional, default: 1) how many objects will be spawned
- offsetMatrix: Array - (Optional, default: [0,0,0]) starting spawning position offset
- offsetDir: Number - (Optional, default: 0) starting spawning direction offset
- dirNoise: Code - (Optional, default: {0}) spawned object direction delta from the starting direction, defined as code returning dir delta value
- enableSimulation: Boolean - (Optional, default: false) shall the simulation of the spawned objects be enabled or not
- RETURNS: Array of created Objects

#### Example
```
private _randomPos = [(random 0.2) -0.1, (random 0.2) -0.1, 0];
_objects = [[_table, "TOP"], "Box_NATO_Wps_F", 3, _randomPos,(random 20)-10] call BIS_fnc_spawnObjects;
```

# BIS_fnc_spawnVehicle
Function to spawn a certain vehicle type with all crew (including turrets). The vehicle can either become part of an existing group or create a new group.
```
[position, direction, type, sideOrGroup] call BIS_fnc_spawnVehicle
```
- position: Array format Position - desired position
- direction: Number - desired azimuth/direction
- type: String - type of the vehicle
- sideOrGroup: Side or Group - side or existing group
- RETURNS: Array format [createdVehicle, crew, group]:
	- createdVehicle: Object - the created vehicle
	- crew: Array of Objects - the vehicle's crew members
	- group: Group - created or passed group

#### Examples
```
[getPos player, 180, "BMP3", east] call BIS_fnc_spawnVehicle;

private _result = [getPos player, 180, "BMP3", east] call BIS_fnc_spawnVehicle;

private _vehicle = _result select 0;
_result params ["_vehicle", "_crew", "_group"];
```

# BIS_fnc_spotter
Make spotter report target distance to sniper. Will only stop if one of the two units dies.
```
[sniper, spotter] spawn BIS_fnc_spotter
```
- sniper: Object - sniper unit
- spotter: Object - spotter unit
- RETURNS: Nothing
#### Example
`[player, spotter] spawn BIS_fnc_spotter;`

# BIS_fnc_stalk
Continuously set WP of one group to a different group to hunt it. It does not change the group's behaviour.
Script terminates if one of the groups is eliminated or if the optional condition is activated.
```
[stalker, stalked, refresh, radius, endCondition, endDestination] spawn BIS_fnc_stalk
```
- stalker: Group - the group that will move towards the other
- stalked: Group - the group that will be followed
- refresh: Number - (Optional, default 10, minimum 5) time between waypoint updates
- radius: Number - (Optional, default 0, minimum 0) waypoint "precision"
- endCondition: Code - (Optional, default {false}) condition that if true stops stalker to follow stalked
- endDestination: String or Position or Object or Number - (Optional, default 0) destination stalker will go after endCondition is met (or stalked is killed)
	- String - destination marker name
	- Position - destination
	- Object - destination
	- Number
		- 0: return to original group waypoints
		- 1: search around their current stalking position, in a 50m radius
		- 2: return to the original position before stalking
- RETURNS: Boolean - true when done
#### Example
```
private _stalking = [BIS_grpStalkers, BIS_grpPlayer] spawn BIS_fnc_stalk;

private _stalking = [grp1, group player, nil, nil, { player distance BIS_Heli < 100 }, "BIS_mrkRetreatMarker"] spawn BIS_fnc_stalk;

private _stalking = [BIS_grpStalkers, BIS_grpPlayer, 20, 10, { BIS_Return }, 1] spawn BIS_fnc_stalk;

private _stalking = [BIS_grpStalkers, BIS_grpPlayer, 5, 0, { dayTime > 20 }, [3600,600,0]] spawn BIS_fnc_stalk;
```

# BIS_fnc_taskDefend
Group will man nearby static defenses within a 100 metre radius of the defense position and guard the position. Some units will man weapons, others will patrol and the remainder will sit on the ground
```
[group, position] call BIS_fnc_taskDefend
```
- group: Group
- position: Array in format Position
- RETURNS: Boolean
```
[group player, getPosATL leader player] call BIS_fnc_taskDefend;

The easiest way to use this function is to create a group, then add the following code to the group leader's init field:
[group this, getPosATL this] call BIS_fnc_taskDefend;
```

# BIS_fnc_taskPatrol
Create a random patrol of several waypoints around a given position.
```
[group, position, distance, blacklist] call BIS_fnc_taskPatrol
```
- group: Group - the group to patrol
- position: Position - the position on which to base the patrol
- distance: Number - maximum distance between waypoints in meters
- blacklist: Array - (optional) blacklist of areas
- RETURNS: Boolean
```
[group _unit, getPos _unit, 1000] call BIS_fnc_taskPatrol;
```

# BIS_fnc_taskAttack
This function adds a Seek and Destroy waypoint on defined position to the group and set its behaviour to "AWARE". If the group has other waypoints, the waypoint will be added at the end of the list.
```
[group, position] call BIS_fnc_taskAttack
```
- group: Group
- position: Position
- RETURNS: Boolean
```
[opforGroup, getPosATL player] call BIS_fnc_taskAttack;
```

# BIS_fnc_textTiles
Shows an animated text with background tiles.
```
[content, position, tileSize, duration, fadeInOutTime, tileTransparency] spawn BIS_fnc_textTiles
```
- content: String or Structured Text
	- String - path to texure
	- Structured Text - formatted text
- position: Boolean or Array (optional, default [0, 0, 1, 1])
	- Boolean - true to use mission area set in the layout options, false for full screen
	- Array - screen space coordinates in format [x, y, w, h]
- tileSize: Number or Array (optional, default 10 ([10,10])
	- Number - tile size in screen space coordinates. Tile will be square
	- Array - tile size in screen space coordinates in format [w, h]
- duration: Number - (optional, default 5) duration in seconds
- fadeInOutTime: Number or Array - (optional, default 0) duration of the fade effect in seconds
	- Array - format [fadeIn, fadeOut]
	- Number - duration of the fadeIn/Out effect
- tileTransparency: Number - (optional, default 0.3) transparency or alpha value of the tiles. 0 means invisible and 1 fully visible
- RETURNS: Boolean - returns always true
```
[parseText "<t font='PuristaBold' size='1.6'>MyMission</t><br />by Username", true, nil, 7, 0.7, 0] spawn BIS_fnc_textTiles;

["path\to\image.paa"] spawn BIS_fnc_textTiles;
```

# BIS_fnc_typeText
Types a structured text on the screen, letter by letter, cursor blinking.
```
[stringLines, posX, posY, rootFormat] spawn BIS_fnc_typeText
```
- stringLines:
	- Array of Strings - array containing lines of text with same structured text formatting.
	- Array of Arrays format [text, format, blinkCount]:
		- text: String - (Optional, default "")
		- format: String - (Optional, default "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>")
		- blinkCount: Number - (Optional, default 5) number of cursor blinks after text typing
- posX: Number - (Optional, default 0)
- posY: Number - (Optional, default 0)
- rootFormat: String - (Optional, default "<t>%1</t>") the parent format
- RETURNS: Nothing
```
[
	[
		["CAMP ROGAIN,", "<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
		["RESUPPLY POINT", "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
		["10 MINUTES LATER ...", "<t align = 'center' shadow = '1' size = '1.0'>%1</t>", 15]
	]
] spawn BIS_fnc_typeText;

[
	[
		["Hello there...", nil, 30]
	],
	0, safeZoneY + safeZoneH / 2
] spawn BIS_fnc_typeText;
```

# BIS_fnc_typeText2
Types a structured text on the screen, letter by letter, cursor blinking. Note that line returns are manual, unlike BIS_fnc_typeText.
```
[stringLines, posX, posY, alignBottom, rootFormat, abortParams, abortCond, playSounds] call BIS_fnc_typeText2
```
- stringLines:
	- Array of Strings - array containing lines of text with same structured text formatting.
	- Array of Array of Strings [text, format, color]
		- text: String - (Optional, default "")
		- format: String - (Optional, default "align = 'center' size = '0.7'") a linebreak is defined as "<br/>" and this only!
		- color: String - (Optional, default "#ffffff")
- posX: Number - (Optional, default 0)
- posY: Number - (Optional, default 0)
- alignBottom: Boolean - (Optional, default true)
- rootFormat: String - (Optional, default "<t>%1</t>")
- abortParams: Array - (Optional, default [])
- abortCond: Code - (Optional, default { false })
- playSounds: Boolean - (Optional, default true)
- RETURNS: Nothing
```
[
	[
		["CAMP ROGAIN, ", "align = 'center' shadow = '1' size = '0.7' font='PuristaBold'"],
		["RESUPPLY POINT", "align = 'center' shadow = '1' size = '0.7'", "#aaaaaa"],
		["", "<br/>"], // line break
		["10 MINUTES LATER...", "align = 'center' shadow = '1' size = '1.0'"]
	]
] spawn BIS_fnc_typeText2;

[
	["Hello there"],
	safeZoneX, safeZoneH / 2,
	true,
	"<t font='PuristaBold'>%1</t>",
	[],
	{ false },
	true
] spawn BIS_fnc_typeText2;
```

# BIS_fnc_fadeEffect
Easily carry out complex fading. Default values will be used if parameters are not defined or set to nil.
```
[fadeInOrOut, blackOrWhite, duration, blur, music, ending, success] spawn BIS_fnc_fadeEffect
```
- fadeInOrOut: Number - (Optional, default 1) 0 to fade out, 1 to fade in
- fadeColor: String - (Optional, default "BLACK") case-sensitive can be "BLACK" or "WHITE"
- duration: Number - (Optional, default 3) fade duration in seconds
- blur: Number - (Optional, default 0) 0 to not blur, 1 to blur (blur-in for fade-in, blur-out for fade-out)
- music: String - (Optional, default "") only for fade-out music class name defined in CfgMusic
- ending: String - (Optional, default "") "" to not end the mission, else a value compatible with endMission or failMission. Will end mission only for the local player
- success: Number - (Optional, default 1) if ending != "" 1 to end mission with success, 0 to fail mission
- RETURNS: Nothin
```
[1, "WHITE", 5, 1] spawn BIS_fnc_fadeEffect;
```