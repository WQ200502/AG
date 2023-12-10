/*

	Filename:   SunriseServer_system_hazardSpawnLoot.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
private _houseArray = (getpos hazard_zone) nearObjects ["House",3000];
{
	private _housePos = selectRandom (_x buildingPos -1);
	if !(isNil "_housePos") then {
		private _container = "GroundWeaponHolder" createVehicle [0,0,300];
		_container setPosATL _housePos;
		_container setVariable ["cleanup_ignore",true];
		waitUntil {!isNull _container};
		
		private _items = getArray(missionConfigFile >> "LifeCfgHazard" >> "HouseItems" >> "items");
		private _chance = random(100);
		private "_item";
		{
			if (_chance <= (_x select 1)) exitWith {		
				_item = selectRandom (_x select 0);
				format["HazardZone - Spawn Loot - Added to Container: %1",_item] call SunriseServer_system_log;
				if (typeName _item == "ARRAY") then {
					{
						[_item select 0,_container] call SunriseClient_system_addItemToBox;
						for "_i" from 0 to (random [1,3,5]) do {[_item select 1,_container] call SunriseClient_system_addItemToBox};
					} forEach _item
				} else {
					[_item,_container] call SunriseClient_system_addItemToBox;
				};
			};
		} forEach _items;
	};
} forEach _houseArray;
format["HazardZone - Spawn Loot - Finished"] call SunriseServer_system_log;