_pos = getpos player;
_nearobjs = nearestobjects [_pos,[],25];
{
	_obj = _x;
	{
		if (tolower (str _obj) find _x > -1) exitwith {
			_obj hideObjectGlobal true;
		};
	} foreach ["pinus","ficus","wreck","stone"];
} foreach _nearobjs;