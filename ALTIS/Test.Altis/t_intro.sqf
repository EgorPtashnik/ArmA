[] spawn {
    ["<t font='PuristaBold' color='#f7f9fa' size='1'>The Americans have finally come.</t>", -1, -1, 2, 1, 0, 789] call BIS_fnc_dynamicText;
    ["<t font='PuristaBold' color='#f7f9fa' size='1'>They'll learn not to underestimate the hearts of the Altian people.</t>", -1, -1, 3, 1, 0, 789] call BIS_fnc_dynamicText;
};

pl1 switchMove "AmovPercMstpSlowWrflDnon";

//playMusic "AmbientTrack01a_F_Tacops";
playMusic "LeadTrack01_F_Tacops";

_playersquad = [pl2,pl3,pl4];
{
	_x disableAI "MOVE";
	_x switchMove "HubSpectator_stand";
}forEach _playersquad;
_playersquadall = units pl1;
{
	//_x setCombatBehaviour "STEALTH";
	_x setCombatMode "GREEN";
	_x disableAI "RADIOPROTOCOL";
}forEach _playersquadall;

sleep 8;

cutText ["", "BLACK IN", 12];
0 fadesound 12;


playSound3D [getMissionPath "sounds\distant_fire_01.ogg", getPosASL player, false, getMarkerPos "m_initialbattle", 5, 1, 0];
playSound3D [getMissionPath "sounds\BattlefieldFirefight2_3D.ogg", getPosASL player, false, getMarkerPos "m_initialbattle", 5, 1, 0];
playSound3D [getMissionPath "sounds\HeavyFirefight.ogg", getPosASL player, false, getMarkerPos "m_initialbattle", 5, 1, 0];
playSound3D [getMissionPath "sounds\distant_artillery_fire_01.ogg", getPosASL player, false, getMarkerPos "m_initialbattle", 5, 1, 0];
playSound3D [getMissionPath "sounds\fighter_jet_flyby_02.ogg", getPosASL player, false, getMarkerPos "m_initialbattle", 5, 1, 0];
playSound3D [getMissionPath "sounds\a10_gunrun_02.ogg", getPosASL player, false, getMarkerPos "m_initialbattle", 5, 1, 0];

sleep 0.1;
pl1 sidechat "Alright guys, we're approaching the AO. Which direction should we enter from?";

sleep 6;
plsquad2 sidechat "I think we should go in from the south. We can meet up with Harpy.";
[pl2, 4] call JBOY_Lip;
sleep 5;
plsquad3 sidechat "I disagree. Northern approach should be more covert.";
[pl3, 4] call JBOY_Lip;

//Hold action to south
squadmovesouth = [
	pl2, //Target
	"Head South", //Title
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\meet_ca.paa", //IdleIcon
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\meet_ca.paa", //ProgressIcon
	"true", //conditionShow
	"true", //conditionProgress
	{}, //codeStart
	{}, //codeProgress
	{terminate intro_diag; var_dirse = 1; execVM "t_pickinsertdirection.sqf";}, //codeCompleted
	{}, //codeInterrupted
	[], //Arguments
	0.5, //Duration
	nil, //Priority
	true, //removeCompleted
	false, //showUnconscious
	true //showWindow
] call BIS_fnc_holdActionAdd;

//Hold action to north
squadmovenorth = [
	pl3, //Target
	"Head North", //Title
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\meet_ca.paa", //IdleIcon
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\meet_ca.paa", //ProgressIcon
	"true", //conditionShow
	"true", //conditionProgress
	{}, //codeStart
	{}, //codeProgress
	{terminate intro_diag; var_dirnw = 1; execVM "t_pickinsertdirection.sqf";}, //codeCompleted
	{}, //codeInterrupted
	[], //Arguments
	0.5, //Duration
	nil, //Priority
	true, //removeCompleted
	false, //showUnconscious
	true //showWindow
] call BIS_fnc_holdActionAdd;