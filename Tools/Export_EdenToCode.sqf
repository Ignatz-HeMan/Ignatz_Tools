_allobj = (allmissionobjects "") select {!(isplayer _x) && !(_x iskindof "logic") && !(_x iskindof "CamCurator") && !(_x iskindof "CBA_NamespaceDummy") && !(_x iskindof "MAN")};
_offset = 0;
_ExportObjects = [];
{
	_pos = getposWorld _x;
	_pos set [2,(_pos select 2)+_offset];
	_type = typeof _x;
	if (_type isequalto "") then {
		_type = _x;
	};
	_obj = [_type,_pos,getdir _x,[vectorDir _x, vectorup _x]];
	_ExportObjects pushback _obj;
} foreach _allobj;

_createcode = "
if (!isserver) exitwith {};
{
	private ['_object'];
	_x params ['_type','_pos','_dir','_vectordirandup'];
	_simulate = false;
	_allowdamage = true;
	_object = objnull;
	if (_type iskindof 'house') then {
		if (_type in ['Land_Pier_F']) exitwith {
			_simulate = false;
		};
		_simulate = true;
	}
	else {
		{
			if !(((tolower _type) find (tolower _x)) isequalto -1) exitwith {
				_simulate = true;
				_allowdamage = false;
			};
		} foreach ['lamp','light','fuel','fire','gate','helipad'];
	};
	
	if (_simulate) then {
		_object = createVehicle [_type,[0,0,0],[],0,'CAN_COLLIDE'];
		if (!_allowdamage) then {
			_object allowdamage false;
		};
	}
	else {
		_object = createsimpleobject [_type,[0,0,0]];
	};
	_object setPosWorld _pos;
	_object setdir _dir;
	_object setVectorDirAndUp _vectordirandup;
} forEach _objects;
";

_ExportCode = "_objects = " + (str _ExportObjects) + ";" + _createcode; 
copytoclipboard _ExportCode;
