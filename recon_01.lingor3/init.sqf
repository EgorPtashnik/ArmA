//***************
//Config
//***************
{
	_x setSkill 0.5;
	_x setSkill ["aimingAccuracy", 0.2];
	_x setSkill ["aimingShake", 0.2];
	_x setSkill ["aimingSpeed", 0.2];
	_x setSkill ["spotDistance", 0.5];
	_x setSkill ["spotTime", 0.25];
	_x setSkill ["courage", 1];
	_x setSkill ["reloadSpeed", 0.5];
	_x setSkill ["commanding", 0.5];
	_x allowFleeing 0;
} forEach units BLUFOR;

{
	_x setSkill 0.5;
	_x setSkill ["aimingAccuracy", 0.2];
	_x setSkill ["aimingShake", 0.2];
	_x setSkill ["aimingSpeed", 0.2];
	_x setSkill ["spotDistance", 0.5];
	_x setSkill ["spotTime", 0.25];
	_x setSkill ["courage", 1];
	_x setSkill ["reloadSpeed", 0.5];
	_x setSkill ["commanding", 0.5];
	_x allowFleeing 0;
} forEach units INDEPENDENT;

{_x deleteGroupWhenEmpty true} forEach allGroups;

#include "initBriefing.sqf"
#include "initMission.sqf"
#include "missionIntro.sqf"
