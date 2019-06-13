_config = getmissionconfig 'Ignatz_config';
_OpenableObjets = (getArray (_config >> "OpenableObjets"));
_WorkingVehicleTypes = (getArray (_config >> "WorkingVehicleTypes"));
_NeededItems = [];
{
	_x params ["_count","_item","_DoRemove"];
	if ((tolower _DoRemove) isequalto "true") then {_DoRemove = true} else {_DoRemove = false};
	_NeededItems pushback [_count,_item,_DoRemove];
} foreach (getArray (_config >> "NeededItems"));

params [["_do",'close']];
if ((player == vehicle player) || !(player == (driver (vehicle player)))) exitwith {false};
if !({(vehicle player) iskindof _x} count _WorkingVehicleTypes > 0) exitwith {false};

_buildingJammerRange = call EPOCH_MaxJammerRange;
_value = 0;
_lockvalue = 1;
_nearjammers = nearestObjects[player, call EPOCH_JammerClasses,_buildingJammerRange];
if (_nearjammers isEqualTo []) exitwith {false};
_nearestJammer = _nearjammers select 0;
if !((_nearestJammer getVariable["BUILD_OWNER", "-1"]) in[getPlayerUID player, Epoch_my_GroupUID]) exitwith {false};
_NearestDoors = [];
_fnc_CheckDoorsToOpen = {
	_NearestDoors = (nearestobjects [_nearestJammer,_OpenableObjets,_buildingJammerRange]) select {
		([_x, "VIEW",vehicle player] checkVisibility [eyePos player, [(getposasl _x select 0),(getposasl _x select 1),(getposasl _x select 2) + 1.5]]) > 0.5 && (
		_x animationPhase "open_left" < 0.5 && _x animationPhase "open_right" < 0.5 && _x animationPhase "Door_1_rot" < 0.5 && _x animationPhase "Open_Door" < 0.5)
	};
	_NearestDoors
};
_fnc_CheckDoorsToClose = {
	_NearestDoors = (nearestobjects [_nearestJammer,_OpenableObjets,_buildingJammerRange]) select {
		([_x, "VIEW",vehicle player] checkVisibility [eyePos player, [(getposasl _x select 0),(getposasl _x select 1),(getposasl _x select 2) + 1.5]]) > 0.5 && 
		(_x animationPhase "open_left" > 0.5 ||	_x animationPhase "open_right" > 0.5 ||	_x animationPhase "Door_1_rot" > 0.5 ||	_x animationPhase "Open_Door" > 0.5)
	};
	_NearestDoors
};
switch _do do {
	case "opencheck";
	case "open": {
		_NearestDoors = call _fnc_CheckDoorsToOpen;	_value = 1;	_lockvalue = 0;
	};
	case "closecheck";
	case "close": {
		_NearestDoors = call _fnc_CheckDoorsToClose; _value = 0;	_lockvalue = 1;
	};
};
if (_do in ["opencheck","closecheck"]) exitwith {!(_NearestDoors isequalto [])};
if (_NearestDoors isequalto []) exitwith {[format ["No Door found to %1",_do],5] call Epoch_Message;};

_missing = [];
{
	_x params ["_count","_item"];
	_has = 0;
	if (_item isequalto "Energy") then {
		_has = Epoch_PlayerEnergy;
	}
	else {
		_has = {_x == _item} count ((magazines player)+(items player));
	};
	if (_has < _count) then {
		_missing pushback [_count-_has,_item];
	};
} foreach _NeededItems;
if !(_missing isequalto []) exitwith {
	_Msg = 'Missing:';
	{
		_Msg = _Msg + format [' %1 %2,', _x select 0, (_x select 1) call EPOCH_itemDisplayName];
	} foreach _missing;
	[_Msg,5] call Epoch_Message;
};
{
	_x params ["_count","_item","_remove"];
	if (_remove) then {
		if (_item isequalto "Energy") then {
			["Energy",-_count] call Epoch_GiveAttributes;
		}
		else {
			[player,_item,_count] call BIS_fnc_invRemove;
		};
	};
} foreach _NeededItems;
_sorted = [_NearestDoors,[],{player distance _x},'ASCEND'] call BIS_fnc_sortBy;
_DoorToHandle = _sorted select 0; 
_DoorToHandle animate ['open_left', _value];
_DoorToHandle animate ['open_right', _value];
_DoorToHandle animate ['Door_1_rot', _value];
_DoorToHandle animate ['Open_Door', _value];
_DoorToHandle animate ['lock_cGarage', _lockvalue];
_DoorToHandle animate ['lock_Door', _lockvalue];
