params ["_comm"];

switch(_comm) do {
	case "someParameter": {
		// playSound "myin1";
		// [ 	"Alpha",
		// 	"Iron Gate, Alpha. Visual on objective. Marking enemy position now, over." ] spawn BIS_fnc_showSubtitle;
		// playSound "mynoise1";
		// _time = time;
		// while {time < _time + 5} do {
		// 	playSound [selectRandom ["gm_rtty_stroke_01","gm_rtty_stroke_02","gm_rtty_stroke_03"], true];
		// 	sleep selectRandom [0.06, 0.06, 0.06, 0.1, 0.3, 0.5];
		// };
		// playSound "myin4";

		playSound "myin1";
		[ 	"SPEAKER 1",
			"SUBTITLES 1" ] spawn BIS_fnc_showSubtitle;

		sleep 4;
		playSound "myin2";
		[ 	"SPEAKER 2",
			"SUBTITLES 2" ] spawn BIS_fnc_showSubtitle;
	};
};
