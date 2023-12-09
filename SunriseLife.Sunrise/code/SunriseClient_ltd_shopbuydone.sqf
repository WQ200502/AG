/*

	Filename: 	SunriseClient_ltd_shopbuydone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
params [
	["_itemClass","",[""]],
	["_itemCount",-1,[0]],
	["_itemPrice",-1,[0]]
];

if (EQUAL(_itemClass,"")) exitWith {};
if (EQUAL(_itemCount,-1)) exitWith {};
if (EQUAL(_itemPrice,-1)) exitWith {};

if (CASH < (_itemPrice * _itemCount)) exitWith {};

private _isVirtItem = isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemClass);
private _itemName = if (_isVirtItem) then {
	ITEM_NAME(_itemClass);
} else {
	([_itemClass] call SunriseClient_system_itemDetails) select 1;
};

if (_isVirtItem) then {
	if ([true,_itemClass,_itemCount] call SunriseClient_system_handleInv) then {
		["cash","take",(_itemPrice * _itemCount),"buyFromLTD"] call SunriseClient_system_myCash;		
		[format["Вы купили %1 х %2 за $%3",_itemName,_itemCount,[_itemPrice * _itemCount] call SunriseClient_system_numberText],"done"] call SunriseClient_system_hint;
		life_action_inUse = false;
		[7400,7402] call SunriseClient_ltd_shopUpdate;
	} else {
		hint "Что-то пошло не так... Не удалось добавить предмет в инвентарь...";
		closeDialog 0;
	};
} else {
	for "_x" from 1 to _itemCount do {
		[_itemClass] call SunriseClient_system_addItem;
	};

	["cash","take",(_itemPrice * _itemCount),"buyFromLTD"] call SunriseClient_system_myCash;		
	[format["Вы купили %1 х %2 за $%3",_itemName,_itemCount,[_itemPrice * _itemCount] call SunriseClient_system_numberText],"done"] call SunriseClient_system_hint;
	life_action_inUse = false;
	[7400,7402] call SunriseClient_ltd_shopUpdate;
};