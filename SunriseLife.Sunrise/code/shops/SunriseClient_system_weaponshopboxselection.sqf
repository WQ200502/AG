/*

	Filename: 	SunriseClient_system_weaponShopBoxSelection.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
if (isNull _control OR EQUAL(_index,-1)) exitWith {}; //Bad data
private _item = CONTROL_DATAI(_control,_index);
private _itemInfo = [_item] call SunriseClient_system_itemDetails;
[_item,_itemInfo select 4] spawn SunriseClient_system_shopBoxWeaponRotate;