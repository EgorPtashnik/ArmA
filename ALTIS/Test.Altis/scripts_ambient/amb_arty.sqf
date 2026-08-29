//Object - the object emitting the sound. If sound position is specified this param is ignored
_AsoundSource = amb_arty_source; 

//Sound Pitch (Number) - 1: Normal, 0.5: Darth Vader, 2: Chipmunks, etc. Default: 1
_AsoundPitch = 1;

//Volume (Number) Default: 1
_Avolume = 5;

//Number : How far is sound audible (0 = no max distance) Default: 0.
_Adistance = 0;

//Target object (varible name) you want the sound to emmit from Default: player
_ATarget = amb_arty_source;

//Maximum random distance (Number) you wish the sound to eminate from
_AMaxDistance = 1000;

//Minimum random distance (Number) you wish the sound to eminate from
_AMinDistance = 0;

//Avrage or Medium random distance (Number) you wish the sound to eminate from
_AMedDistance = 500;

//Minimum time between sounds played (Number)
_AMinWait = 5;

//Avrage or Medium time between sounds played (Number)
_AMedWait = 10;

//Maximum time between sounds played (Number)
_AMaxWait = 15;

_soundsArray = [
getMissionPath "sounds\distant_artillery_fire_01.ogg",
getMissionPath "sounds\distant_artillery_fire_02.ogg"
];


while {true} do
{
	_dir = round random 360;
	 
	_dis = round random [_AMinDistance,_AMedDistance,_AMaxDistance];
	_AsoundPosition = _ATarget getRelPos [_dis, _dir];
	_SoundNumber = round random count _soundsArray;
	_ASound = selectRandom _soundsArray;
	playSound3D [_ASound, _AsoundSource, false, _AsoundPosition, _Avolume, _AsoundPitch, _Adistance];
	_Waitfor = round random [_AMinWait,_AMedWait,_AMaxWait];
	sleep _Waitfor
};
