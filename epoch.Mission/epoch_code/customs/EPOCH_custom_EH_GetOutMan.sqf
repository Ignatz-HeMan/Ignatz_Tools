/*
	Author: Aaron Clark - EpochMod.com

    Contributors: [Ignatz] He-Man

	Description:
	Custom A3 Epoch GetOutMan Eventhandler

    Licence:
    Arma Public License Share Alike (APL-SA) - https://www.bistudio.com/community/licenses/arma-public-license-share-alike

    Github:
    https://github.com/EpochModTeam/Epoch/tree/release/Sources/epoch_code/custom/EPOCH_custom_EH_GetOutMan.sqf
*/
params ["_unit","_position","_vehicle"];

// Start Ignatz_Earplugs
if (Ignatz_AutoEarplugs) then {
	if (Ignatz_AutoEarplugsHints) then {
		hint 'Earplugs have been auto-removed';
	};
	if (Ignatz_EarplugsSystemchat) then {
		systemchat 'Earplugs have been auto-removed...';
	};
	Ignatz_Earplugsin = true;
	[] call Ignatz_Client_Earplugger;
};
// End Ignatz_Earplugs
