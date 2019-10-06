class CfgPatches {
	class Ignatz_FastSwim {
		units[] = {};
		weapons[] = {};
		version = 0.1;
		requiredVersion = 1.76;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class Ignatz_FastSwim
	{
		class main {
			file = "Ignatz_FastSwim";
			class postInit {
				postInit = 1;
			};
		};
	};
};