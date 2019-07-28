_allobj = (allmissionobjects "") select {!(isplayer _x) && !(_x iskindof "logic") && !(_x iskindof "CamCurator") && !(_x iskindof "CBA_NamespaceDummy") && !(_x iskindof "MAN") && !(_x iskindof "Bird") && !(_x iskindof "ThingEffect") && !((typeof _x) isEqualTo "#mark")};
_offset = 0;
ExportObjects = [];
{
	_pos = getposWorld _x;
	_pos set [2,(_pos select 2)+_offset];
	_type = typeof _x;
	if (_type isequalto "" || (_type find "_IG_Workaround" > -1)) then {
		_type = (getmodelinfo _x) select 1;
	};
	_obj = [_type,_pos,getdir _x,[vectorDir _x, vectorup _x]];
	ExportObjects pushback _obj;
} foreach _allobj;
copytoclipboard str ExportObjects;