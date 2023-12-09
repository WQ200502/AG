/*
	
	Filename: 	SunriseClient_factory_vehicleSell.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {};
if (EQUAL((lbCurSel 2402),-1)) exitWith {};

call SunriseClient_actions_inUse;

private _type = CONTROL_DATA(2402);
private _fact_type = life_fact_type;

if ((time - life_vshop_timer) < 3) exitWith {hint "Вы слишком быстро нажимаете на кнопку ПРОДАТЬ! Рекомендуем указывать нужное кол-во при продаже одинаковых предметов, вместо нажатия кнопки сто раз!"; life_action_inUse = false};
life_vshop_timer = time;

private _amount = ctrlText 2403;
if !([_amount] call SunriseClient_system_isnumber) exitWith {hint localize "STR_Shop_Virt_NoNum"; life_action_inUse = false};
_amount = parseNumber (_amount);

private _sellall = param [0,false,[true]];
if (_sellall) then {_amount = CONTROL_VALUE(2402)};

private _index = [(_fact_type + "_" + _type),fact_items] call SunriseClient_system_index;
if (EQUAL(_index,-1)) exitWith {life_action_inUse = false};
private _price = ((fact_items select _index) select 1) * _amount;

private _itemGroup = switch (true) do { 
	case (_type in ["bronze","copper","silver","iron"]) : {"metal"};
	case (_type in ["turtle","meat","fish_meat","apple","peach","rue","cannabis"]) : {"food"};
	default {_type}; 
};

if (FETCH_CONST(life_donator) > 0) then {_price = _price call SunriseClient_system_increase};

if ([false,_type,_amount,life_fact_vehicle] call SunriseClient_system_handleVehInv) then {
	private _tax = round (_price * (server_tax/100));
	ADD(life_tmp_tax,_tax);
	SUB(_price,_tax);

	_index = [_fact_type,life_tmp_fact_sold] call SunriseClient_system_index;
	if (EQUAL(_index,-1)) then {
		life_tmp_fact_sold pushBack [_fact_type,[[_itemGroup,_amount]]];
	} else {
		_item_arr = (life_tmp_fact_sold select _index) select 1;
		_index = [_itemGroup,_item_arr] call SunriseClient_system_index;
		if (EQUAL(_index,-1)) then {
			_item_arr pushBack [_itemGroup,_amount];
		} else {
			_tmpamount = ((_item_arr select _index) select 1) + _amount;
			_item_arr set [_index,[_itemGroup,_tmpamount]];
		};
	};

	hint format[localize "STR_Shop_Virt_SellItem_Tax",_amount,ITEM_NAME(_type),[_price] call SunriseClient_system_numberText,server_tax,"%",_tax];
	["cash","add",_price,"factItemSell",format["Sold %1 pieces %2",_amount,ITEM_NAME(_type)]] call SunriseClient_system_myCash;
	["ResourceSold",_amount] spawn SunriseClient_experience_addExp;
	[["earning", getPlayerUID player, (player getVariable ["realname",""]), _type, time - life_job_startTime, _price],"customLog"] call SunriseClient_system_hcExec;
	[] call SunriseClient_factory_update;
};

private _fact = format ["%1_fact",steamid];
SVAR_MNS [_fact,life_tmp_fact_sold];
PVAR_SERV(_fact);

[] call SunriseClient_system_saveGear;
life_action_inUse = false;