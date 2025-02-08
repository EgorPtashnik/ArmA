
_plyAry = call BIS_fnc_listPlayers;


_idents = ["ID_1","ID_2","ID_3","ID_4"];

if(!isMultiplayer) then {{
removeSwitchableUnit _x} forEach [tnkD,rkm,snip,ofi,med];

ppanc execVM "spPpancSet.sqf";

};

If(!isMultiplayer or !(adv in _plyAry)) then {[adv,"plyBennett"] remoteExec ["setIdentity",0]};
If(!(rkm in _plyAry)) then {[rkm,"plyArmstrong"] remoteExec ["setIdentity",0]};

{If(not (_x  in _plyAry )and _x != rkm) then {[_x,(_idents deleteAt 0 )] remoteExec ["setIdentity",0]}} forEach units grpP;
If(!(tnkD in _plyAry) ) then {tnkD setIdentity "ID_TD"};
If(!(tnkC in _plyAry) ) then {tnkC setIdentity "ID_TC"};

//time skip
_timeToSkip = random 1;
[_timeToSkip] remoteExec ["skipTime",0];

/////////////////////////////////////////////////////////////////////////////////
addSquadRPG = {
_groupUnits = units _this;
	_unit =  _groupUnits deleteAt random ((count _groupUnits) - 1 );
	_wepType = selectRandom [["launch_RPG7_F","RPG7_F"],["launch_MRAWS_olive_rail_F","MRAWS_HEAT55_F"]];
	_unit addWeapon (_wepType select 0);
	_unit addSecondaryWeaponItem (_wepType select 1);
	_unit addBackpack selectRandom ["B_Kitbag_sgg","B_Kitbag_cbr"];
	for "_i" from 1 to 4 do {_unit addItemToBackpack (_wepType select 1);};
};
//////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
_posAry = [];
{If(typeOf _x == "LocationRespawnPoint_F") then {_posAry append [_x]};} forEach units sideLogic;

_cel1_posAry = [];
_cel2_posAry = [];
_cel3_posAry = [];
_cel4_posAry = [];


{
	_varName = vehicleVarName _x;
	_nameAry = _varName splitString "_";
	If("cel1" in _nameAry)then {_cel1_posAry append [_x]; };
	If("cel2" in _nameAry)then {_cel2_posAry append [_x]; };
	If("cel3" in _nameAry)then {_cel3_posAry append [_x]; };
	If("cel4" in _nameAry)then {_cel4_posAry append [_x]; };
	
} forEach _posAry;
/////////////////////////////////////////////////////////////////////////////////////////////////

{_x execVM "spawnObjective.sqf"} forEach [ [_cel1_posAry,1] , [_cel2_posAry,2], [_cel3_posAry,1], [_cel4_posAry,3]];