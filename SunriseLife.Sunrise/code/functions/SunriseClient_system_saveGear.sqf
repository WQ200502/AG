/*

	Filename: 	SunriseClient_system_saveGear.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _iItems = [player] call SunriseClient_inventory_save;

private _yItems = [];
private ["_value","_item"];
{
	_item = configName _x;
	_value = ITEM_VALUE(_item);
	if (_value > 0) then {
		_yItems pushBack [_item,_value];
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));

life_gear = [_iItems,_yItems];

private _loot = format ["%1_loot",steamid];
SVAR_MNS [_loot,life_gear];
PVAR_SERV(_loot);