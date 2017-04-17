/*
	Author: Aaron Clark - EpochMod.com

    Contributors: [Ignatz] He-Man

	Description:
	Custom A3 Epoch KeyUp Eventhandler

    Licence:
    Arma Public License Share Alike (APL-SA) - https://www.bistudio.com/community/licenses/arma-public-license-share-alike

    Github:
    https://github.com/EpochModTeam/Epoch/tree/release/Sources/epoch_code/custom/EPOCH_custom_EH_KeyDown.sqf
*/
params ["_display","_dikCode","_shift","_ctrl","_alt"];
_handled = false;
// Start Ignatz_StatusBar
if (Ignatz_UseStatusBarSwitchKey) then {
		if (_dikCode == Ignatz_StatusBarSwitchKey) then {
			Ignatz_StatusbarSelected = switch Ignatz_StatusbarSelected do {
				case 0: {1};
				case 1: {2};
				case 2:	{3};
				case 3: {0};
			};
		};
};
// End Ignatz_StatusBar

// Start Ignatz_Earplugs
if (!isnil 'Ignatz_KB_Earplug') then {
	if (_dikCode == Ignatz_KB_Earplug) then {
		if (Ignatz_EnableEarpluginVeh || player == vehicle player) then {
			if (Ignatz_EarplugsSystemchat) then {
				if (Ignatz_Earplugsin) then {
					systemchat 'Earplugs have been removed...';
				}
				else {
					systemchat 'Earplugs have been inserted...';
				};
			};
			[] call Ignatz_Client_Earplugger;
		};
	};
};
// End Ignatz_Earplugs

_handled
