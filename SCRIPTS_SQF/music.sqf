playMusic "EventTrack01a_F_Tacops";
addMusicEventHandler ["MusicStop", {
	private _music = [
		"EventTrack01a_F_Tacops",
		"EventTrack01b_F_Tacops",
		"EventTrack02a_F_Tacops",
		"EventTrack02b_F_Tacops",
		"EventTrack03a_F_Tacops",
		"EventTrack03b_F_Tacops"
	] call BIS_fnc_selectRandom;
	playMusic _music;
}];
