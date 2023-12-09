/*
	
	Filename: 	SunriseClient_admin_UnitLootInfo.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _loot = param [0,[],[[]]];
if  (_loot isEqualTo []) exitWith {hint "Лут юнита пустой"};

private _playerLloot = CONTROL(2900,2905);

lbClear _playerLloot;

{
	_itemInfo = [_x select 0] call SunriseClient_system_itemDetails;
	_playerLloot lbAdd format["%1", _itemInfo select 1];
	_playerLloot lbSetData[(lbSize _playerLloot)-1,_itemInfo select 0];
	_playerLloot lbSetPicture[(lbSize _playerLloot)-1,_itemInfo select 2];

	_playerLloot lbSetTextRight [(lbSize _playerLloot)-1, format["[%1]", _x select 1]];
} foreach _loot;