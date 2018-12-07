_allobj = (allmissionobjects "") select {!(isplayer _x) && !(_x iskindof "logic") && !(_x iskindof "CamCurator") && !(_x iskindof "CBA_NamespaceDummy") && !(_x iskindof "MAN")};
_offset = 0;
{
	_pos = getposWorld _x;
	_pos set [2,(_pos select 2)+_offset];
	_type = typeof _x;
	if (_type isequalto "") then {
		_type = _x;
	};
	_obj = [_type,_pos,getdir _x,[vectorDir _x, vectorup _x]];
	ExportObjects pushback _obj;
} foreach _allobj;
copytoclipboard str ExportObjects;