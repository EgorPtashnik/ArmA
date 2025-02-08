0 fadeSound 0;
enableRadio false;
cutText ["", "BLACK IN", 999];
sleep 2;
cutText ["", "BLACK IN", 5];
5 fadeSound 1;
enableRadio true;
playMusic "CUP_A1_Field_Track";
sleep 5;

private _handle = ["intro"] spawn pf_comms;

waitUntil { sleep 1; scriptDone _handle; };
sleep 5;
["taskStealCar"] call pf_task;