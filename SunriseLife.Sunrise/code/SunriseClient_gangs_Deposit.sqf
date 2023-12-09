/*

	Filename: 	SunriseClient_gangs_Deposit.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};

private _ownerID = grpPlayer GVAR ["gang_owner",""];
if !(EQUAL(_ownerID,steamid)) exitWith {["Вносить деньги на счет банды может только лидер","error"] call SunriseClient_gui_bottomNotificatio};

private _value = ctrlText 2702;
if !([_value] call SunriseClient_system_isnumber) exitWith {[localize "STR_ATM_notnumeric","error"] call SunriseClient_gui_bottomNotification};

_value = parseNumber _value;
if (_value < 50000) exitWith {["Минимальная сумма для вноса на счет банды: $50,000","error"] call SunriseClient_gui_bottomNotification};
if (_value > 999999) exitWith {[localize "STR_ATM_GreaterThan","error"] call SunriseClient_gui_bottomNotification;};
if (_value > BANK) exitWith {[localize "STR_NOTF_NotEnoughFunds","error"] call SunriseClient_gui_bottomNotification};

_value_tax = round (_value * 1.05);
if (_value_tax > BANK) exitWith {["У вас недостаточно денег на счету для оплаты налога в 5%","error"] call SunriseClient_gui_bottomNotificatio};

private _gangBank = grpPlayer GVAR ["gang_bank",-1];
if (EQUAL(_gangBank,-1)) exitWith {["Не удалось определить общак группы","error"] call SunriseClient_gui_bottomNotificatio};

call SunriseClient_actions_inUse;
(CONTROL(2700,2705)) ctrlEnable false;
["Кладем деньги на счет...", "info"] call SunriseClient_gui_BottomNotification;

["add",_value,_gangBank,player,_value_tax] remoteExecCall ["SunriseServer_system_updateGangBank",RSERV];