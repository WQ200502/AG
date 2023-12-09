/*

	Filename:	SunriseClient_market_sell.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (!market_loaded) exitWith {hint "Торговая площадка в данный момент недоступна. Пожалуйста, попробуйте еще раз!"};
if (life_market_wait) exitWith {hint "Торговая площадка обрабатывает ваш запроос"};

disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;
if (lbCurSel _myListbox < 0) exitWith {hint "Вы не выбрали предмет";};

_able = switch (FETCH_CONST(life_donator)) do {
	case 1: {6};
	case 2: {7};
	case 3: {8};
	case 4: {9};
	case 5: {10};
	default {5};
};

_uid = getPlayerUID player;
if (({_x select 5 == _uid} count all_ah_items) >= _able) exitWith {hint format["Вы не можете выложить больше, чем %1 лотов!",_able];closeDialog 0;};

_price = ctrlText 15603;
if (! ([_price] call SunriseClient_system_isnumber)) exitWith {hint "Укажите цену в цифровом формате, а не символьном";};
_price = parseNumber _price;
_quantity = ctrlText 15602;
if (! ([_quantity] call SunriseClient_system_isnumber)) exitWith {["Укажите количество в цифровом формате, а не символьном","error"] call SunriseClient_gui_bottomNotification;};
_quantity = parseNumber _quantity;

_selectedSell = call compile (_myListbox lbData (lbCurSel _myListbox));
_selectedSell params [
	["_classname","",[""]],
	["_status",3,[3]]
];
if (_classname == "yolo") exitWith {};
if (_status != 3) exitWith {hint "Вы не можете продать этот предмет!"};
if (_price < 1) exitWith {hint "Цена не может быть отрицательной!"};
if (_price > 9000000) exitWith {hint "Цена не может быть больше 9 миллионов!"};

private _isVirtItem = isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _classname);
private _isInvItem = isClass (missionConfigFile >> "LifeCfgItems" >> _classname);
if !(_isVirtItem OR _isInvItem) exitWith {hint "Предмета нет в конфиге";};

_bad = false;
if (_quantity > 1) then {
	_onGuy = [_classname] call SunriseClient_system_itemCount;
	if (_onGuy < _quantity) then {
		hint "У вас нет столько вещей!";
		_bad = true;
	}
};
if (_bad) exitWith {closeDialog 0;};

_realName = "";
_realName = ([_classname] call SunriseClient_system_itemDetails) select 1;

_tax = round (_price * 0.03);

if (BANK < _tax) exitWith {hint format["У вас не хватает денег на банковском счету для оплаты налога в $%1",_tax];};
life_market_wait = true;
[_quantity,_price,_classname,_realName,name player,_tax,player] remoteExec ["SunriseServer_market_sell",RSERV];
