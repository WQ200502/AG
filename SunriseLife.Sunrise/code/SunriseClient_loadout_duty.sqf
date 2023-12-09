/*

	Filename: 	SunriseClient_loadout_duty.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};
call SunriseClient_actions_inUse;

life_gear = param [0,[],[[]]];
private _iItems = [player] call SunriseClient_inventory_save;
private _yItems = [];

private ["_value","_item"];
{
	_item = configName _x;
	_value = ITEM_VALUE(_item);
	if (_value > 0) then {
		_yItems pushBack [_item,_value];
		SVAR_MNS [ITEM_VARNAME(_item),0]
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));
life_carryWeight = 0;
[getPlayerUID player,[_iItems,_yItems]] remoteExecCall ["SunriseServer_system_dutyGearSave",2];


[] call SunriseClient_system_loadGear;
life_action_inUse = false;