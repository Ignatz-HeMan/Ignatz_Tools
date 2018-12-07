/*
288520 = Karts
304380 = Helis
395180 = Apex
571710 = Orange
*/

_mydlcs = getDLCs 1;
if !(288520 in _mydlcs) then {
	Ignatz_MyActionIDs = (missionnamespace getvariable ['Ignatz_MyActionIDs',-1]) + 1;
	_action = player addAction ['Get in Kart as Driver (without DLC)', {player moveInDriver cursorObject}, nil, 1,true,true,'',
		'(vehicle player == player) && (player distance cursorObject <= 10) && (cursorObject isKindOf ''Kart_01_Base_F'') && ((cursorObject emptyPositions ''Driver'') == 1) && locked cursorObject in [0,1]'];
};
if !(304380 in _mydlcs) then {
	Ignatz_MyActionIDs = (missionnamespace getvariable ['Ignatz_MyActionIDs',-1]) + 1;
	_action = player addAction ['Get in Helicopter as Pilot (without DLC)', { player moveInDriver cursorObject; }, nil, 1,true,true,'',
		'(vehicle player == player) && (player distance cursorObject <= 10) && (getText(configFile >> ''cfgvehicles'' >> (typeOf cursorObject) >> ''DLC'') == ''Heli'') && ((cursorObject emptyPositions ''Driver'') == 1) && locked cursorObject in [0,1]'];
	Ignatz_MyActionIDs = (missionnamespace getvariable ['Ignatz_MyActionIDs',-1]) + 1;
	_action = player addAction ['Get in Helicopter as Loadmaster (without DLC)', { player moveInGunner cursorObject; }, nil, 1,true,true,'',
		'(vehicle player == player) && (player distance cursorObject <= 10) && (getText(configFile >> ''cfgvehicles'' >> (typeOf cursorObject) >> ''DLC'') == ''Heli'') && ((cursorObject emptyPositions ''Gunner'') == 1) && locked cursorObject in [0,1]'];            
};
if !(395180 in _mydlcs) then {
	Ignatz_MyActionIDs = (missionnamespace getvariable ['Ignatz_MyActionIDs',-1]) + 1;
	_action = player addAction ['Get in Vehicle as Driver (without DLC)', { player moveInDriver cursorObject; }, nil, 1,true,true,'',
		'(vehicle player == player) && (player distance cursorObject <= 10) && (getText(configFile >> ''cfgvehicles'' >> (typeOf cursorObject) >> ''DLC'') == ''Expansion'') && ((cursorObject emptyPositions ''Driver'') == 1) && locked cursorObject in [0,1]'];
	Ignatz_MyActionIDs = (missionnamespace getvariable ['Ignatz_MyActionIDs',-1]) + 1;
	_action = player addAction ['Get in Vehicle as Gunner (without DLC)', { player moveInGunner cursorObject; }, nil, 1,true,true,'',
		'(vehicle player == player) && (player distance cursorObject <= 10) && (getText(configFile >> ''cfgvehicles'' >> (typeOf cursorObject) >> ''DLC'') == ''Expansion'') && ((cursorObject emptyPositions ''Gunner'') == 1) && locked cursorObject in [0,1]'];            
	Ignatz_MyActionIDs = (missionnamespace getvariable ['Ignatz_MyActionIDs',-1]) + 1;
	_action = player addAction ['Get in Vehicle as Copilot (without DLC)', { player moveInTurret [cursorObject,[0]]}, nil, 1,true,true,'',
		'(vehicle player == player) && (player distance cursorObject <= 10) && (getText(configFile >> ''cfgvehicles'' >> (typeOf cursorObject) >> ''DLC'') == ''Expansion'') && cursorObject iskindof ''AIR'' &&{((_x select 1) isequalto ''Turret'' && (_x select 3) isequalto [0])} count fullcrew cursorObject == 0 && locked cursorObject in [0,1]'];            
};
if !(571710 in _mydlcs) then {
	Ignatz_MyActionIDs = (missionnamespace getvariable ['Ignatz_MyActionIDs',-1]) + 1;
	_action = player addAction ['Get in Vehicle as Driver (without DLC)', { player moveInDriver cursorObject; }, nil, 1,true,true,'',
		'(vehicle player == player) && (player distance cursorObject <= 10) && (getText(configFile >> ''cfgvehicles'' >> (typeOf cursorObject) >> ''DLC'') == ''Orange'') && ((cursorObject emptyPositions ''Driver'') == 1) && locked cursorObject in [0,1] && !(cursorObject iskindof "C_IDAP_Heli_Transport_02_F")'];
};
if !(798390 in _mydlcs) then {
	Ignatz_MyActionIDs = (missionnamespace getvariable ['Ignatz_MyActionIDs',-1]) + 1;
	_action = player addAction ['Get in Vehicle as Driver (without DLC)', { player moveInDriver cursorObject; }, nil, 1,true,true,'',
		'(vehicle player == player) && (player distance cursorObject <= 10) && typeof cursorObject in ["I_LT_01_scout_F","I_LT_01_cannon_F"] && ((cursorObject emptyPositions ''Driver'') == 1) && locked cursorObject in [0,1]'];
	Ignatz_MyActionIDs = (missionnamespace getvariable ['Ignatz_MyActionIDs',-1]) + 1;
	_action = player addAction ['Get in Vehicle as Commander (without DLC)', { player moveInCommander cursorObject; }, nil, 1,true,true,'',
		'(vehicle player == player) && (player distance cursorObject <= 10) && typeof cursorObject in ["I_LT_01_scout_F","I_LT_01_cannon_F"] && ((cursorObject emptyPositions ''Commander'') == 1) && locked cursorObject in [0,1]'];
};
