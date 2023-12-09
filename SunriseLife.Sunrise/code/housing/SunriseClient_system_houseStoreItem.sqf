/*
	
	Filename: 	SunriseClient_system_houseStoreItem.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (life_action_inUse) exitWith {};
if (EQUAL((lbCurSel 4103),-1)) exitWith {hint "Не выбрано"};

private _item = CONTROL_DATA(4103);
private _num = ctrlText 4106;

if !([_num] call SunriseClient_system_isnumber) exitWith {["Укажите количество в цифровом формате, а не символьном","error"] call SunriseClient_gui_bottomNotification;};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint "Минус? Серьезно?"};
if (_item in LIFE_SETTINGS(getArray,"life_noSaveItems")) exitWith {hint "Данный предмет невозможно положить в хранилище..."};
if (EQUAL(_item,"EXT_FakePrimaryWeapon")) exitWith {[_item] call SunriseClient_system_removeItem; closeDialog 0;};

private _house_box_slots = life_house_box GVAR ["house_box_slots",0];
if (EQUAL(_house_box_slots,0)) exitWith {hint "У вас не добавлены места для хранения вещей"};

private _house_box_inventory = life_house_box GVAR ["house_box_inventory",[[],0]];
private _itemClassInfo = [_item] call SunriseClient_system_itemDetails;
private _playerItems = [] call SunriseClient_system_getPlayerItems;

private _house_box_data = _house_box_inventory select 0;
private _house_box_weight = _house_box_inventory select 1;

private _maxWeight = (LIFE_SETTINGS(getNumber,"life_inventoryMax")) * _house_box_slots;
private _itemWeight = _itemClassInfo select 6;
private _itemCaregory = _itemClassInfo select 4;
private _itemType = _itemClassInfo select 5;

if ((_house_box_weight + (_itemWeight *  _num)) > _maxWeight) exitWith {hint "В хранилище нет необходимого свободного места"};

private _indexP = [_item,_playerItems] call SunriseClient_system_index;
private _indexH = [_item,_house_box_data] call SunriseClient_system_index;

if (_num > ((_playerItems select _indexP) select 1)) exitWith {hint "У вас нет такого количества предметов в инвентаре"};

if (EQUAL(_itemCaregory,"Equipment") && {EQUAL(_itemType,"Uniform")} && {count(PUNIFORM_ITEMS) > 0} && {EQUAL(_item,PUNIFORM)}) exitWith {hint "В вашей форме есть вещи. Уберите их прежде чем переместить ее в хранилище!"};
if (EQUAL(_itemCaregory,"Equipment") && {EQUAL(_itemType,"Vest")} && {count(PVEST_ITEMS) > 0} && {EQUAL(_item,PVEST)}) exitWith {hint "В вашем бронежилете есть вещи. Уберите их прежде чем переместить его в хранилище!"};
if (EQUAL(_itemCaregory,"Equipment") && {EQUAL(_itemType,"Backpack")} && {count(PBACKPACK_ITEMS) > 0} && {EQUAL(_item,PBACKPACK)}) exitWith {hint "В вашем рюкзаке есть вещи. Уберите их прежде чем переместить его в хранилище!"};

private _storeButton = CONTROL(4100,4108);
call SunriseClient_actions_inUse;
_storeButton ctrlEnable false;

private _itemsRemoved = false;
for "_x" from 1 to _num do {
	_itemsRemoved = [_item] call SunriseClient_system_removeItem;
};
if !(_itemsRemoved) exitWith {
	hint "Ошибка! Не все вещи были удалены из инвентаря при переносе!";
	_storeButton ctrlEnable true;
	life_action_inUse = false;
};

player say3D "storeitem";

if (EQUAL(_indexH,-1)) then {
	_house_box_data pushBack [_item,_num];
} else {
	private _val = (_house_box_data select _indexH) select 1;
	_house_box_data set[_indexH,[_item,_val + _num]];
};

_house_box_weight = _house_box_weight + (_itemWeight *  _num);

life_house_box SVAR ["house_box_inventory",[_house_box_data,_house_box_weight],true];
[nil,(GVAR_UINS["House_Container_Filter",0])] call SunriseClient_system_containerMenuFilter;

uiSleep 2;
_storeButton ctrlEnable true;
life_action_inUse = false;