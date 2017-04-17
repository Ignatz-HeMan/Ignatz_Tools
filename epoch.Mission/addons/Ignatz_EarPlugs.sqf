// File created by Ignatz - He-Man
// Last Update: 2017-04-06

if (!isclass (getmissionconfig 'Ignatz_config')) exitwith {
	systemchat "Error: Can not load Config for Earplugs";
};
_config = getmissionconfig 'Ignatz_config';
Ignatz_KB_Earplug 			= getnumber (_config >> "Earplugs_Keybind");
Ignatz_AutoEarplugs   		= switch (tolower (gettext (_config >> "Earplugs_AutoEarplugs"))) do {case "true": {true};default {false}};
Ignatz_EnableEarpluginVeh 	= switch (tolower (gettext (_config >> "Earplugs_UseInVehicles"))) do {case "true": {true};default {false}};
Ignatz_AutoEarplugsHints	= switch (tolower (gettext (_config >> "Earplugs_HintsMessages"))) do {case "true": {true};default {false}};
Ignatz_EarplugsSystemchat	= switch (tolower (gettext (_config >> "Earplugs_Systemchat"))) do {case "true": {true};default {false}};
Ignatz_Earplugsin = false;
Ignatz_Client_Earplugger = compilefinal "
	if (Ignatz_Earplugsin) then {
		Ignatz_Earplugsin = false;
		1 fadeSound 1;
	}
	else {
		Ignatz_Earplugsin = true;
		1 fadeSound 0.15;
	};
";
