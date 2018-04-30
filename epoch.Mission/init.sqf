// File created by Ignatz - He-Man

if (hasInterface) then {
	[] execVM "addons\Ignatz_EarPlugs.sqf";
	[] execVM "addons\Ignatz_Statusbar.sqf";
	Ignatz_Client_DoorOpener = compilefinal preprocessfilelinenumbers "addons\Ignatz_Client_DoorOpener.sqf";
};