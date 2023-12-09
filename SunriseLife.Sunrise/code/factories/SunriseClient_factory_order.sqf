/*

	Filename:	SunriseClient_factory_order.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _amount = (ctrlText 7902);
if !([_amount] call SunriseClient_system_isnumber) exitWith {["Укажите количество в цифровом формате, а не символьном", "error"] call SunriseClient_gui_BottomNotification};
_amount = parseNumber _amount;
if (_amount <= 0) exitWith {};
if (_amount > 500) exitWith {["Нельзя заказать более 500 единиц", "error"] call SunriseClient_gui_BottomNotification};
	
private _gang_id = (group player) getVariable ["gang_id",-1];
if (_gang_id isEqualTo -1) exitWith {["Система заказов вам недоступна", "error"] call SunriseClient_gui_BottomNotification};
private _gang_license = (group player) getVariable ["gang_license","-1"];
if (_gang_license isEqualTo "-1") exitWith {["Система заказов вам недоступна", "error"] call SunriseClient_gui_BottomNotification};

private _index = [life_fact_type,fact_array] call SunriseClient_system_index;
if (EQUAL(_index,-1)) exitWith {};
private _price = ((fact_array select _index) select 1) * _amount;
if (_price > BANK) exitWith {hint localize "STR_NOTF_NotEnoughMoney"};

[life_fact_type, _amount, _price, _gang_id, player] remoteExecCall ["SunriseServer_factory_order",RSERV];