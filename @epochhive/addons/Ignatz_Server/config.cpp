
class CfgPatches
{
	class Ignatz
	{
		requiredVersion = 0.1;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		magazines[] = {};
		ammo[] = {};
		author[]= {"He-Man"};
	};
};


class CfgFunctions
{
	class Ignatz
	{
		class main {
			file = "Ignatz_Server";
			class init {
				preInit = 1;
			};
		};
	};
};

class Ignatz_ServerConfig {
	ServerCommand_Password 	= "password";
};