_SoundSource = player;               //Sound Source [object] (i recomend the Platoon Lead, or Lead Vehicle etc.)   
_SoundPitch = 1;                //Sound Pitch (dont change that )           
_SoundVolume = 5;              //Sound Volume (1 is default)
_SoundDistance =  0;          //Sound distance (how far the sound is heard, 0 = Infinite, i recommend 0)
_MaxDistance = 300;          //Maximum Distance to Sound source
_MedDistance = 250;         //Median Distance to Sound source
_MinDistance = 100;        //Minimum Distance to Sound source
_MaxWait = 13;            //Maxiumum time (in seconds) between 2 sounds
_MedWait = 7;            //Median time (in seconds) between 2 sounds
_MinWait = 5;           //Minimum time (in seconds) between 2 sounds
 
//List of playable sounds, the decimal value is the weighted selection min 0.1 max 1.
_soundsArray = 
[                                                                                        
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions1.wss",0.4,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions2.wss",0.4,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions3.wss",0.4,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions4.wss",0.4,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions5.wss",0.4,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_heli1.wss",0.1,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_heli2.wss",0.2,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_heli3.wss",0.1,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight1.wss",0.8,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight2.wss",0.8,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight3.wss",0.6,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_firefight4.wss",0.7,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_jet1.wss",0.1,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_jet2.wss",0.2,
    "A3\Sounds_F\environment\ambient\battlefield\battlefield_jet3.wss",0.1
];
 
 
 
//This loop plays the sound, true can be replaced with any condition e.g. !alive AA_1
 
while {true} do
{
    //determines random sound position (random point around the Sound Source) 
 
    _dir = round random 360; 
    _dis = round random [_MinDistance,_MedDistance,_MaxDistance];
    _soundPosition = _SoundSource getRelPos [_dis, _dir];
    _SoundPath = selectRandomWeighted _soundsArray;          //determines a random sound according to the weighted selection
    playSound3D [_SoundPath, _SoundSource, false, _SoundPosition, _SoundVolume, _SoundPitch, _SoundDistance];
    _Waitfor = round random [_MinWait,_MedWait,_MaxWait];                                                          
    sleep _Waitfor;                                                                                          
};