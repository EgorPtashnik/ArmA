#include "initFunctions.sqf";
#include "initBriefing.sqf";
#include "initMission.sqf";

/* Type machine sounds with radio messages
	playSound "myin1";
	[ "Alpha",
	 	"Iron Gate, Alpha. Visual on objective. Marking enemy position now, over." ] call EP_fnc_showSubs;
	playSound "mynoise1";
	_time = time;
	while {time < _time + 5} do {
		playSound [selectRandom ["gm_rtty_stroke_01","gm_rtty_stroke_02","gm_rtty_stroke_03"], true];
	 	sleep selectRandom [0.06, 0.06, 0.06, 0.1, 0.3, 0.5];
	};
	playSound "myin4";
 */

// private _test = [
// 	["Land_PaperBox_open_empty_F",[3.26465,-0.813232,0.0100098],278.801,1,0,[],"","",true,false], 
// 	["Land_PaperBox_open_full_F",[3.65356,1.18652,0.0122681],22.8672,1,0,[],"","",true,false], 
// 	["Box_Syndicate_WpsLaunch_F",[4.86304,-0.364502,0.00320435],68.2358,1,0,[],"","",true,false], 
// 	["Box_Syndicate_WpsLaunch_F",[5.65015,0.658203,0.00561523],218.132,1,0,[],"","",true,false], 
// 	["Land_PaperBox_closed_F",[3.01904,-4.94214,0.00827026],68.3433,1,0,[],"","",true,false], 
// 	["Land_WoodenBox_F",[2.96118,-6.53564,9.15527e-05],322.812,1,0,[],"","",true,false], 
// 	["Box_Syndicate_Ammo_F",[4.30029,-5.83276,0.006073],73.1412,1,0.00962937,[],"","",true,false]
// ];
// _mark = "a_1"
// [getMarkerPos _mark, markerDir _mark, _test] call BIS_fnc_ObjectsMapper;
