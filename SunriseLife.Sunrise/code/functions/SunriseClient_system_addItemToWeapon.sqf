/*

	Filename: 	SunriseClient_system_addItemToWeapon.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {false};

private _return = false;

//надо определить для какого оружия эта хуйня подходит
private _weapon = switch (true) do {
	case (_item in ([RIFLE] call CBA_fnc_compatibleItems)) : {"rifle"};
	case (_item in ([PISTOL] call CBA_fnc_compatibleItems)) : {"pistol"};
	case (_item in ([LAUNCHER] call CBA_fnc_compatibleItems)) : {"launcher"};
	default {""};
};

//теперь попробуем добавить на пушку исходя из предыдущего варианта, или же просто в инвентарь
switch (_weapon) do {
	case "rifle" : {
		if !(_item in RIFLE_ITEMS) then {
			player addPrimaryWeaponItem _item;
			_return = true;
		} else {
			_return = [_item] call SunriseClient_system_addItemToInventory;
		};
	}; 
	case "pistol" : {
		if !(_item in PISTOL_ITEMS) then {
			player addHandgunItem _item;
			_return = true;
		} else {
			_return = [_item] call SunriseClient_system_addItemToInventory;
		};
	}; 
	case "launcher" : {
		if !(_item in LAUNCHER_ITEMS) then {
			player addSecondaryWeaponItem _item;
			_return = true;
		} else {
			_return = [_item] call SunriseClient_system_addItemToInventory;
		};
	};
	default {_return = [_item] call SunriseClient_system_addItemToInventory}; 
};

_return