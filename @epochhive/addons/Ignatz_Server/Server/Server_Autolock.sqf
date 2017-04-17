if (!isclass (configfile >> 'Ignatz_ServerConfig')) exitwith {
	diag_log "Error: Can not load Config for Ignatz_AutoLock";
};
_config = (configfile >> 'Ignatz_ServerConfig');
_ServerCommand_Password = gettext (_config >> "ServerCommand_Password");
_config2 = getmissionconfig 'Ignatz_config';
_AutolockBeforeRestart = getnumber (_config2 >> "AutolockBeforeRestart");
_AutoKickBeforeRestart = getnumber (_config2 >> "AutoKickBeforeRestart");
_Restarttime = getnumber (_config2 >> "Restart_Intervall");
_FirstRestart = getnumber (_config2 >> "FirstRestartOnDay");;
_AutoAdjust = switch (tolower (gettext (_config2 >> "Restart_AutoAdjust"))) do {case "true": {true};default {false}};
_SelfRestart = switch (tolower (gettext (_config2 >> "SelfRestart"))) do {case "true": {true};default {false}};
_SelfShutdown = switch (tolower (gettext (_config2 >> "SelfShutdown"))) do {case "true": {true};default {false}};

_GetRestartOverrideTime = {
	private ['_RestartOverrideTime']; 
	params ["_Restarttime","_FirstRestart"];
	_realdatestr = "epochserver" callExtension "510";
	_realdate = call compile _realdatestr;
	_realdate params ["","","","_hours","_minutes","_seconds"];
	_RestartHours = _Restarttime/3600;
	_RestartOverrideTime = -1000;
	_c = 1;
	while {true} do {
		if (((_c*_RestartHours)+_FirstRestart) > _hours) exitwith {
			_RestartOverrideTime = ((_c*_RestartHours + _FirstRestart - _hours - 1)*60*60) max 0;
		};
		_c = _c+1;
	};
	_RestartOverrideTime = _RestartOverrideTime + (60-_minutes-1)*60; 
	_RestartOverrideTime = _RestartOverrideTime + 60-_seconds-1; 
	_RestartOverrideTime = _RestartOverrideTime + servertime;
	_RestartOverrideTime
};

_Restarttime = _Restarttime*3600;
_ServerCommand_Password serverCommand "#lock";
_startTime = diag_tickTime;
while {(_startTime + 5) > diag_tickTime} do {
	for "_i" from 0 to 102 do {
		_ServerCommand_Password serverCommand format ["#kick %1",_i];
	};
	uisleep 0.5;		
};
waitUntil {!isNil "EPOCH_SERVER_READY"};
_ServerCommand_Password serverCommand "#unlock";
uisleep 300;
if (_AutoAdjust) then {
	_TimeToRestart = [_Restarttime,_FirstRestart] call _GetRestartOverrideTime;
	if (isnil '_TimeToRestart') exitwith {
		diag_log "#Ignatz_Debug: Restart OverrideTime can not be calculated - Override skipped...";
	};
	_Restarttime = _TimeToRestart;
	Ignatz_RestartOverrideTime = _TimeToRestart;
	publicvariable 'Ignatz_RestartOverrideTime';
	diag_log format ['#Ignatz_Debug: RestartTimer adjusted to restart at servertime: %1 (actual servertime: %2)',_TimeToRestart,servertime];
};
waituntil {uisleep 2; (_Restarttime - _AutolockBeforeRestart) < serverTime};
_ServerCommand_Password serverCommand "#lock";

waituntil {uisleep 2; (_Restarttime - _AutoKickBeforeRestart) < serverTime};
_ServerCommand_Password spawn {
	{
		_playerUID = getPlayerUID _x;
		_this serverCommand format ["#kick %1",_playerUID];
		uisleep 0.2;
	} foreach playableunits;
	for "_i" from 0 to 500 do {
		_this serverCommand format ["#kick %1",_i];
		uisleep 0.01;
	};
	{
		_playerUID = getPlayerUID _x;
		_this serverCommand format ["#kick %1",_playerUID];
		uisleep 0.2;
	} foreach playableunits;
};

waituntil {uisleep 2; _Restarttime <= serverTime};
if (_SelfRestart) exitwith {
	_ServerCommand_Password serverCommand "#restartserver";
};
if (_SelfShutdown) then {
	_ServerCommand_Password serverCommand "#shutdown";
};
