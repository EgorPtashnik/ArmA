while {true} do
{
	_duo3 = [player, player, blufor, ["EF_B_Marine_R_Des", "EF_B_Marine_LAT2_Des", "EF_B_Marine_GL_Des", "EF_B_Marine_AR_Des", "EF_B_Marine_Medic_Des","EF_B_Marine_Mark_Des"], 6, 1] spawn ax_fnc_spawnenemies;
	sleep 60;
	terminate _duo3;
};