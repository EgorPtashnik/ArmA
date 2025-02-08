private _conversations = ["am_aaf_sniper_team_in_a","am_aaf_sniper_team_in_b","am_aaf_sniper_team_in_c"];

while{alive BIS_soldiera && {alive BIS_soldierb && {(BIS_soldierb knowsAbout player) == 0}}} do
{
	private _conversation = selectRandom _conversations;
	[_conversation,"to_c03_m01", nil, "DIRECT"] call bis_fnc_kbTell;
	sleep 10;
};