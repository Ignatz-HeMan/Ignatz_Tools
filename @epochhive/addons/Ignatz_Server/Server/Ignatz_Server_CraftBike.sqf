params ["_type","_player"];
if (!isnull _player && alive _player) then {
	_pos = _player modelToWorld [0,3,1];
	_pos set [2,(_pos select 2) max 1];
	_dir = getdir _player;
	_randompos = [random 500, random 500, 1500];
	_vehObj = "MBK_01_EPOCH" createVehicle _randompos;
	_vehObj allowdamage false;
	_vehObj call EPOCH_server_setVToken;
	clearWeaponCargoGlobal    _vehObj;
	clearMagazineCargoGlobal  _vehObj;
	clearBackpackCargoGlobal  _vehObj;
	clearItemCargoGlobal	  _vehObj;
	_vehObj setdir (getdir _player);
	_vehObj setvariable ["VehSpawnedBy",getplayeruid _player, true];
	_VectorUp = if (((getposatl _player) select 2) < 0.25) then {surfaceNormal _pos} else {[0,0,1]};
	_vehObj setVectorUp _VectorUp;		
	if (surfaceiswater _pos) then {
		_vehObj setposasl _pos;
	}
	else {
		_vehObj setposatl _pos;
	};
	_vehObj setVectorUp _VectorUp;
	[_vehObj, {player reveal _this}] remoteExec ["call", _player];
};
