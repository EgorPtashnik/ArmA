//Disable radio, environment, chat, sentences
enableRadio false;
enableEnvironment false;
enableSentences false;
showChat false;

//Disable sounds, speech, music
0 fadeSound 0;
0 fadeSpeech 0;
0 fadeMusic 0;


//Black screen on start...
cutText ["", "BLACK IN", 999];

//Disable player input
player enableSimulation false;

//And fade in after 2 seconds
sleep 2;
0 cutText ["", "BLACK IN", 7];

//Enable radio, environment, chat, sentences
enableRadio true;
enableEnvironment true;
enableSentences true;
showChat true;

//Enable sounds, speech, music
7 fadeSound 1;
7 fadeSpeech 1;
7 fadeMusic 1;

//Start music
playMusic "music_calm_full_RF";

sleep 5;

"EP_Intro" call BIS_fnc_missionConversations;

player enableSimulation true;

sleep 2;

0 cutText ["<t font='RobotoCondensed' size='3'>Операция</t><t font='RobotoCondensedBold' color='#FF0000' size='3'> «ТАРАНТУЛ»</t>", "PLAIN", 5, true, true];
sleep 6;
0 cutFadeOut 1;

EP_IntroDone = true;