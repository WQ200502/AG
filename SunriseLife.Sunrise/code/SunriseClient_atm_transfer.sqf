/*
	
	Filename: 	SunriseClient_atm_transfer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _val = parseNumber(ctrlText 2704);
private _unit = call compile format["%1",(CONTROL_DATA(2703))];

if (life_newbie) exitWith {["Новоприбывшим на остров нельзя осуществлять операции перевода денег","error"] call SunriseClient_gui_bottomNotification};

if (isNil "_unit") exitWith {[localize "STR_ATM_DoesntExist","error"] call SunriseClient_gui_bottomNotification};
if (isNull _unit) exitWith {[localize "STR_ATM_DoesntExist","error"] call SunriseClient_gui_bottomNotification};
if (EQUAL((lbCurSel 2703),-1)) exitWith {[localize "STR_ATM_NoneSelected","error"] call SunriseClient_gui_bottomNotification};
if (_val > 999999) exitWith {[localize "STR_ATM_TransferMax","error"] call SunriseClient_gui_bottomNotification;};
if (_val <= 100) exitwith {["Минимальная сумма для перевода составляет $100","error"] call SunriseClient_gui_bottomNotification};
if !([str(_val)] call SunriseClient_system_isnumber) exitWith {[localize "STR_ATM_notnumeric","error"] call SunriseClient_gui_bottomNotification};
if (_val > BANK) exitWith {[localize "STR_ATM_NotEnoughFunds","error"] call SunriseClient_gui_bottomNotification};
if (GVAR_RNAME(_unit) isEqualTo "") exitWith {["Не удается определить имя получателя.","error"] call SunriseClient_gui_bottomNotification};
if (time - life_atm_timer < 3) exitWith {["Переводить деньги можно не чаще одного раза в 3 секунды","error"] call SunriseClient_gui_bottomNotification};

private _tax = round(_val / 15);
private _sum = _val + _tax;

if (_sum > BANK) exitWith {[format[localize "STR_ATM_SentMoneyFail",_val,_tax],"error"] call SunriseClient_gui_BottomNotification};

["atm","take",_sum,"MS",format["Bank Transfer to %1 (%2)",GVAR_RNAME(_unit),getPlayerUID _unit]] call SunriseClient_system_myCash;
["atm","add",_val,"MS",format["Bank Transfer from %1 (%2)",GVAR_RNAME(player),steamid]] remoteExecCall ["SunriseClient_system_myCash",_unit];

[format["%1 перевел вам $%2 на банковский счет",GVAR_RNAME(player),[_val] call SunriseClient_system_numberText],"money"] remoteExecCall ["SunriseClient_system_hint",_unit];
[format[localize "STR_ATM_SentMoneySuccess",[_val] call SunriseClient_system_numberText,GVAR_RNAME(_unit),[_tax] call SunriseClient_system_numberText], "done"] call SunriseClient_gui_BottomNotification;

[] call SunriseClient_atm_updateMenu;
life_atm_timer = time;

