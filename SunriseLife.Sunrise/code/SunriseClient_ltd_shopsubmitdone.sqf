/*

	Filename: 	SunriseClient_ltd_shopsubmitdone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
private _itemClass = param [0,"",[""]];
if (EQUAL(_itemClass,"")) exitWith {};

private _isVirtItem = isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemClass);

private _itemName = if (_isVirtItem) then {
	ITEM_NAME(_itemClass);
} else {
	([_itemClass] call SunriseClient_system_itemDetails) select 1;
};

hint format["%1 успешно добавлен в базу",_itemName];
[format["Вы успешно добавили в магазин ""%1""",_itemName],"done"] call SunriseClient_system_hint;
life_action_inUse = false;
[7800,7802,7803] call SunriseClient_ltd_shopUpdate;