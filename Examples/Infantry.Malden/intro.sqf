enableRadio false;
0 fadeSound 0;

cutText ["", "BLACK FADED", 999];
0.1 fadeSound 0;
sleep 3;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 3;
cutText ["", "BLACK IN", 7];
10 fadeSound 1;
["о. Малден", "Ла Ривьера", "Освободительные силы острова"] spawn BIS_fnc_infoText;
enableRadio true;
