sleep 5;
private _handle = ["extract-1"] call fnc_comms;
waitUntil {sleep 1; scriptDone _handle};
_handle = ["extract-2"] call fnc_comms;

"marker_extract" setMarkerAlpha 1;
sleep 2;
blueHeli hideObject false;
blueHeli enableSimulation true;
