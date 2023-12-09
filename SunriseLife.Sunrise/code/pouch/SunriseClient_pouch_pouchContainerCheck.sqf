/*

	Filename: 	SunriseClient_system_pouchContainerCheck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


	проверка предметов в коробке на удаленные из мода и пересчет веса на всякий.
	кривые убираются и делаем пересчет веса

*/
#include "..\..\script_macros.hpp"
if (EQUAL(life_pouch select 0,[]) OR isNull _box) exitWith {};

private _box_data = life_pouch select 0;
private _box_weight = 0;

private["_itemData"];
{
	_itemData = [_x select 0] call SunriseClient_system_itemDetails;
	if (EQUAL(_itemData,[])) then {
		format ["House Check - Item %1 was removed from mod or bad className. Removed from array",_x select 0] call SunriseClient_system_log; 
		_box_data set[_forEachIndex,[-1]];		
	} else {
		_box_weight = _box_weight + ((_itemData select 6) * (_x select 1));
	};
} forEach _box_data;
_box_data = _box_data - [[-1]];

life_pouch = [_box_data,_box_weight];
