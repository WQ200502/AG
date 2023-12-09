/*

	Filename: 	SunriseClient_atm_deposit.sqf
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
//if (_value > 999999) exitWith {[localize "STR_ATM_GreaterThan","error"] call SunriseClient_gui_bottomNotification};
if (_value <= 0) exitWith {["Укажите положительное значение","error"] call SunriseClient_gui_bottomNotification};
if (_value > CASH) exitWith {[localize "STR_ATM_NotEnoughCash","error"] call SunriseClient_gui_bottomNotification};

["cash","swap",_value,"BankDeposit"] call SunriseClient_system_myCash;
[format[localize "STR_ATM_DepositMSG",[_value] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;

[] call SunriseClient_atm_updateMenu;
life_atm_timer = time;