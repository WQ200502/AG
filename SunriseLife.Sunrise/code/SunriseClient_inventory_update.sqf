/*

	Filename: 	SunriseClient_inventory_update.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _display = param [0,findDisplay 602,[displayNull]];

if (isNull _display) exitWith {};

private _backpack_title = _display displayCtrl 7211; 
private _backpack_items_list = _display displayCtrl 7212; 
private _items_players_combo = _display displayCtrl 7214;

lbClear _backpack_items_list;
lbClear _items_players_combo;

[_backpack_items_list] call SunriseClient_gui_ListVirtualItems;

private _near_units = [];
{ 
	if (player distance _x < 10) then {
		_near_units pushBack _x;
	};
} foreach playableUnits;

private "_indexInIds";
{
	_indexInIds = [(getPlayerUID _x),life_ids] call SunriseClient_system_index;
	if (!isNull _x && alive _x && player distance _x < 10 && {_x != player} && {GVAR_RNAME(_x) != ""} && {!(EQUAL(_indexInIds,-1)) OR (_x in (units grpPlayer))}) then {
		_items_players_combo lbAdd (GVAR_RNAME(_x));
		_items_players_combo lbSetData [(lbSize _items_players_combo)-1,str(_x)];
	};
} foreach _near_units;

_backpack_title ctrlSetText format[localize "STR_PM_CurWeight", life_carryWeight, life_maxWeight];