// File created by Ignatz - He-Man

if (hasInterface) then {
	[] execVM "addons\Ignatz_EarPlugs.sqf";
	[] execVM "addons\Ignatz_Statusbar.sqf";
	Ignatz_Client_DoorOpener = compilefinal preprocessfilelinenumbers "addons\Ignatz_Client_DoorOpener.sqf";
	waituntil {typeof player in ['Epoch_Male_F','Epoch_Female_F']};
	waituntil {!isNil 'Epoch_my_GroupUID'};
	while {true} do {
		player addAction ["Pack Bicycle", {Ignatz_ActionInWork = true; cursortarget spawn {player playMove 'AinvPknlMstpSnonWrflDnon_medic0';player playMove 'AinvPknlMstpSnonWrflDnon_medicEnd';uisleep 5;deletevehicle _this;Ignatz_ActionInWork = false}}, nil, 1.5, false, true, "", "!(missionnamespace getvariable ['Ignatz_ActionInWork',false]) && {player distance cursortarget < 4} && {cursortarget getvariable ['VehSpawnedBy',''] isEqualTo (getplayeruid player)}", 3];
		waituntil {uisleep 1; !alive player};
		waituntil {alive player};
	};
};