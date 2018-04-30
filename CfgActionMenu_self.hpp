class Ignatz_DoorOpener
{
	condition = "if (dyna_AtHome && dyna_IsDriver) then {['opencheck'] call Ignatz_Client_DoorOpener} else {false};";
	action = "['open'] call Ignatz_Client_DoorOpener;";
	icon = "addons\pics\Actions\Gate_Open.paa";
	tooltip = "Open Gate";
};
class Ignatz_DoorCloser
{
	condition = "if (dyna_AtHome && dyna_IsDriver) then {['closecheck'] call Ignatz_Client_DoorOpener} else {false};";
	action = "['close'] call Ignatz_Client_DoorOpener;";
	icon = "addons\pics\Actions\Gate_Close.paa";
	tooltip = "Close Gate";
};
