/*
	
	Filename: 	SunriseClient_system_vehInvSearchUpdate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
life_action_inUse = false;
private _vehicle = life_vInact_curTarget;
if (isNull findDisplay 8100) exitWith {["error","","Вы закрыли диалоговое окно!"] call SunriseClient_message};
disableSerialization;

private _gear_list = CONTROL(8100,8102);
lbClear _gear_list;

ctrlSetText [8101,format["Обыск машины #%1", _vehicle getVariable ["dbInfo",["","Аренда"]] select 1] ];

private _vehicle_virt_gear = _vehicle getVariable ["Trunk",[[],0]] select 0;
_gear_list lbAdd "--------- Виртуальные вещи ---------";
{	
	_x params ["_name","_value"];
	_gear_list lbAdd format["%1x %2",_value,ITEM_NAME(_name)];
	_gear_list lbSetData [(lbSize _gear_list)-1,str ["virt",_name,_value]];
	_gear_list lbSetValue [(lbSize _gear_list)-1,-1];
	_gear_list lbSetPicture [(lbSize _gear_list)-1,ITEM_ICON(_name)]; 
} foreach _vehicle_virt_gear;

private _veh_containers = everyContainer _vehicle;
_gear_list lbAdd "--------- Физические вещи ---------";
_process_items = {
	params ["_item","_amount","_index","_type"];
	_itemInfo = [_item] call SunriseClient_system_itemDetails;
	if !(EQUAL(_itemInfo,[])) then {
		if (_amount > 1) then {
			_gear_list lbAdd format["[%2] %1",_itemInfo select 1,_amount];
		} else {
			_gear_list lbAdd format["%1",_itemInfo select 1];
		};
		_gear_list lbSetData[(lbSize _gear_list)-1,str [_type,_itemInfo select 0,_amount]];
		_gear_list lbSetValue [(lbSize _gear_list)-1,_index];
		_gear_list lbSetPicture[(lbSize _gear_list)-1,_itemInfo select 2];
	};
};
_load_gear_list = {
	params ["_container","_index"];
	private _veh_items = getItemCargo _container;
	private _veh_mags = getMagazineCargo _container;
	private _veh_weapons = getWeaponCargo _container;
	private _veh_backpacks = getBackpackCargo _container;

	{[_x,_veh_items#1#_forEachIndex,_index,"item"] call _process_items} foreach _veh_items#0;
	{[_x,_veh_mags#1#_forEachIndex,_index,"mag"] call _process_items} foreach _veh_mags#0;
	{[_x,_veh_weapons#1#_forEachIndex,_index,"weap"] call _process_items} foreach _veh_weapons#0;
	{[_x,_veh_backpacks#1#_forEachIndex,_index,"back"] call _process_items} foreach _veh_backpacks#0;
};

[_vehicle,-1] call _load_gear_list;
_gear_list lbAdd "============ Содержимое рюкзаков\жилетов ============";
{
	_itemInfo = [_x#0] call SunriseClient_system_itemDetails;
	if !(EQUAL(_itemInfo,[])) then {
		_gear_list lbAdd format["----------- Содержимое %1 -----------",_itemInfo select 1];
		_gear_list lbSetPicture[(lbSize _gear_list)-1,_itemInfo select 2];
		_gear_list lbSetPictureRight [(lbSize _gear_list)-1,_itemInfo select 2];
	};
	[_x#1,_forEachIndex] call _load_gear_list;
} forEach _veh_containers;
//lbadd - lbsize