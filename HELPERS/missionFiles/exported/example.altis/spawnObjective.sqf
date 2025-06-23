_civType = [ "C_man_p_beggar_F" , "C_Man_casual_1_F" ,  "C_Man_casual_2_F" , "C_Man_casual_3_F" , "C_Man_casual_4_v2_F" ,"C_Man_casual_4_F","C_Man_casual_5_F","C_Man_casual_6_F"  ];

_grpN = createGroup [EAST,true];
_grpC = createGroup [CIVILIAN,false];

_posAry = (_this select 0);
for "_i" from 1 to ((count _posAry)/2) do {

_pos = getposATL (_posAry deleteAt random ((count _posAry) - 1 ));

_unit = _grpN createUnit ["O_G_Soldier_F", _pos, [], 0, "NONE"];
If((nearestBuilding _unit) distance2D _unit < 7) then {_unit setUnitPos "UP";} else {_unit setUnitPos selectRandom  ["MIDDLE","UP"];};
_unit setUnitPos "UP";
_unit setCombatBehaviour "AWARE";
_unit disableAI "PATH";
_unit setSkill 0.5;
_unit execVM "setFiaFighter.sqf";


};

_grpN spawn {sleep 0.5 ; _this call addSquadRPG;};

for "_i" from 1 to (_this select 1) do {


_pos = getposATL (_posAry deleteAt random ((count _posAry) - 1  ));
_unit = _grpC createUnit [(selectRandom _civType), _pos, [], 0, "NONE"];

_unit disableAI "PATH";
_unit setUnitPos "MIDDLE";
_unit setCombatBehaviour "SAFE";
_unit disableAI "RADIOPROTOCOL";
_unit allowFleeing 0;

};

[_grpN , _grpC] spawn {

while {{alive _x} count units (_this select 0) > 0} do {sleep 1;} ;
{_x enableAI "ALL"} forEach units (_this select 1);
(_this select 1) addWaypoint [position hq,0];

};