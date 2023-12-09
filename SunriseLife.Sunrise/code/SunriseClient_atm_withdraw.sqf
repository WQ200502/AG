/*

	Filename: 	SunriseClient_atm_withdraw.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {["Вы заняты","error"] call SunriseClient_gui_bottomNotification};
if (time - life_atm_timer < 3) exitWith {["Снимать и класть деньги на счет можно не чаще одного раза в 3 секунды","error"] call SunriseClient_gui_bottomNotification};

private _value = ctrlText 2702;
if !([_value] call SunriseClient_system_isnumber) exitWith {[localize "STR_ATM_notnumeric","error"] call SunriseClient_gui_bottomNotification};

_value = parseNumber _value;
if (_value > 999999) exitWith {[localize "STR_ATM_WithdrawMax","error"] call SunriseClient_gui_bottomNotification};
if (_value <= 0) exitwith {["Укажите положительное значение","error"] call SunriseClient_gui_bottomNotification};
if (_value > BANK) exitWith {[localize "STR_ATM_NotEnoughFunds","error"] call SunriseClient_gui_bottomNotification};
if (_value < 100 && BANK > 999999) exitWith {[localize "STR_ATM_WithdrawMin","error"] call SunriseClient_gui_bottomNotification}; //Temp fix for something.

["atm","swap",_value,"BankWithdraw"] call SunriseClient_system_myCash;
[format [localize "STR_ATM_WithdrawSuccess",[_value] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;

[] call SunriseClient_atm_updateMenu;
life_atm_timer = time;