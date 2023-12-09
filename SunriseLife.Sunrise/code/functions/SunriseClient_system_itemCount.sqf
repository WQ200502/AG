/*

	Filename: 	SunriseClient_system_itemCount.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


	//пока что считаем чисто обоймы и предметы типа еда-вода, которые тоже обоймы, а потом расширем

*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {0};

private _playerItems = [] call SunriseClient_system_getPlayerItems;
if (EQUAL(_playerItems,[])) exitWith {0};

private _index = [_item,_playerItems] call SunriseClient_system_index;
if (EQUAL(_index,-1)) exitWith {0};

(_playerItems select _index) select 1;