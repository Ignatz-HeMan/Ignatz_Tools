class Ignatz_config {
// Earplugs
	Earplugs_Keybind	 	= 0x3E;				/* Key to put in / out the Earplugs (F4) full list: https://community.bistudio.com/wiki/DIK_KeyCodes */
	Earplugs_AutoEarplugs 	= "true";			/* Auto insert / remove Earplugs by entering leaving Vehicles */
	Earplugs_UseInVehicles	= "true";			/* Set it to false to disable manual Earplugs in Vehicles */
	Earplugs_HintsMessages	= "true";			/* Show Hint Messages on Auto-Insert / Remove Earplugs */
	Earplugs_Systemchat		= "true";			/* Show Systemchat Messages on Auto-Insert / Remove Earplugs */

// Statusbar	
	Statusbar_OnStart	 	= 1;				/* Status Bar on Start - 0 = off / 1 = full / 2 = half / 3 = small */
	Statusbar_UseKeybind	= "true";			/* Use SwitchKey to switch between different Status Bars */
	Statusbar_Keybind 		= 0x36;				/* Key to switch between the Status Bars (right shift key) full list: https://community.bistudio.com/wiki/DIK_KeyCodes */

// DoorOpener
	OpenableObjets[]		= {					/* Array with Objects handled by the DoorOpener */
		"MetalWallGarage_EPOCH",
		"WoodWallGarage_EPOCH",
		"CinderWallGarage_EPOCH"
	};
	WorkingVehicleTypes[]	= {"LandVehicle"};	/* Array with VehicleTypes inside Players can use the Opener */
	NeededItems[]			= {
		{1,"CircuitParts","true"},				/* [count,"itemclass",RemoveOnUse] */
		{250,"Energy","true"}					/* [count,"itemclass",RemoveOnUse] */
	};
	

// Restart
	FirstRestartOnDay		= 0;				/* On which time the Server will restart the first time (0 = 00:00 / 2 = 02:00 ...). Only full hour restarts are supported */
	Restart_Intervall		= 3;				/* in hours */
	AutoKickBeforeRestart 	= 120;				/* in seconds */
	AutolockBeforeRestart	= 180;  			/* in seconds */
	Restart_WarningTimes[]	= {1,2,5,10};		/* Array of restart-warning (x minutes before Restart) */
	Restart_AutoAdjust		= "true";			/* Autmatically adjust Restarttime acc. to Realtime */
	SelfRestart				= "false";			/* true = Server will restart himself */
	SelfShutdown			= "false";			/* true = Server shut down himself (has no effect, if SelfRestart = "true") */
												/* You can use SelfShutdown, if you use FireDaemon and have configured to Restart the rogramm on Program Exit (under Lifecycle) */
};