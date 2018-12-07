{
	[_x] call EPOCH_spawnLoot;
	EPOCH_lootObjects = [];
	EPOCH_LootedBlds = []
} foreach (nearestobjects [player,["building"],200])