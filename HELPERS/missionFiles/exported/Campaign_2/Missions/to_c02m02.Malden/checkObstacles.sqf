private _angleDelta = 		_this select 0;
private _stopTank = 		_this select 1;

while {true} do
{
	private _nearObstacles = _stopTank nearEntities [["SoldierWB","Tank"],30];
	_nearObstacles = (_nearObstacles - [_stopTank]) - crew _stopTank;

	if(count _nearObstacles > 0) then
	{
		{
			private _angle  = _stopTank getRelDir (position _x);
			if(_angle < _angleDelta || _angle > (360 - _angleDelta)) exitWith
			{
				_stoptank setVariable ["stopThis",true];
			};
			_stoptank setVariable ["stopThis",false];

		} forEach _nearObstacles;
	}
	else
	{
		_stoptank setVariable ["stopThis",false];
	};

	sleep 1;
};