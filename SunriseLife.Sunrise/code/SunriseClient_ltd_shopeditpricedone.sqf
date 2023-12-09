/*

	Filename: 	SunriseClient_ltd_shopeditpricedone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
params [
	["_itemClass","",[""]],
	["_itemPrice",-1,[0]]
];

if (EQUAL(_itemClass,"")) exitWith {};
if (EQUAL(_itemPrice,-1)) exitWith {};

private _isVirtItem = isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemClass);
private _itemName = if (_isVirtItem) then {
	ITEM_NAME(_itemClass);
} else {
	([_itemClass] call SunriseClient_system_itemDetails) select 1;
};

[format["Вы поменяли цену у ""%1"" на $%2",_itemName,[_itemPrice] call SunriseClient_system_numberText],"done"] call SunriseClient_system_hint;
life_action_inUse = false;
[7800,7802,7803] call SunriseClient_ltd_shopUpdate;