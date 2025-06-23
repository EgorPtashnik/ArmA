// IMPORT
// pf_subs = compile preprocessFileLineNumbers "fnc\YP_bis_subs.sqf";
// CALL
// ["title", "subs"] spawn pf_subs;

params [
	"_title",
	"_subtitles",
	["_sound", "in1"]
];

[_title, _subtitles] spawn BIS_fnc_showSubtitle;
playSound _sound;
sleep 7;
