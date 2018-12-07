_pos = getpos player;
_alltrees = nearestobjects [_pos,[],25];
{
_pinus = ['pinus',str _x] call BIS_fnc_inString;
_ficus = ['ficus',str _x] call BIS_fnc_inString;
_wreck = ['wreck',str _x] call BIS_fnc_inString;
_stone = ['stone',str _x] call BIS_fnc_inString;
if (_pinus || _ficus || _wreck || _stone) then {
_x hideObjectGlobal true;
};

} foreach _alltrees;