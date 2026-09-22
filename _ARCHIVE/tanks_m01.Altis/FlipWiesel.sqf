// Include mission defines
#include "T01_defines.inc"

titleCut ["","BLACK OUT",1];

sleep 0.25;
selectRandom ["FlipWiesel01","FlipWiesel02","FlipWiesel03"] spawn BIS_fnc_missionConversations;

sleep 2;

_position = (getPosATL BIS_Wiesel) findEmptyPosition [0,50,"I_LT_01_cannon_F"];
BIS_Wiesel setPos _position;

sleep 0.5;
if !(alive driver BIS_Wiesel) then {player moveInDriver BIS_Wiesel} else {player moveInCommander BIS_Wiesel};

sleep 2;

titleCut ["","BLACK IN",1];

_flipWiesel = [BIS_Wiesel, FLIP_TITLE, FLIP_ICON, FLIP_ICON, FLIP_CONDITION, FLIP_CONDITION, {}, {}, {execVM "FlipWiesel.sqf"}, {}, [], 2.0, 1000, true, false] call bis_fnc_holdActionAdd;
