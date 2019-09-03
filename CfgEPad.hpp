class e_pad_config
{
	...
	class Apps
	{
		...
		
		
		
		
		
		
		class deploy
		{
			ButtonText = "";
			Description = "Craft a Bicycle";
			icon = "x\addons\a3_epoch_community\textures\MBK\mbk_picture_ca.paa";
			color[] = {1,1,1,1};
			colortoggled[] = {0,1,0,1};
			action = "if ({(_x getvariable ['VehSpawnedBy','']) isEqualTo (getplayeruid Player) && alive _x} count (entities 'MBK_01_EPOCH') > 0) exitwith {['Pack your Bicycle first, before crafting another one!',5] call Epoch_Message;};if !(player == vehicle player) exitwith {['Leave your Vehicle first!',5] call Epoch_Message;};if ((getpos player select 2) > 0.5) exitwith {['You have to be on the ground for this!',5] call Epoch_Message;};closedialog 0;[] spawn {player playMove 'AinvPknlMstpSnonWrflDnon_medic0';player playMove 'AinvPknlMstpSnonWrflDnon_medicEnd';uisleep 5;['MBK_01_EPOCH',player] remoteexec ['Ignatz_Server_CraftBike',2];};";
			Tooltip = "Craft a Bicycle";
			ToggleVar = "";
			ToggleAble = "false";
		};
		
		
		
		
		
		
		
		
		
	};
};