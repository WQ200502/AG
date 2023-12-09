/*

	Filename: 	SunriseClient_system_govBank.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _mode = param [0,"",[""]];
private _val = parseNumber(ctrlText 3902);
closeDialog 0;
if (_val <= 0) exitwith {};
if (_val > 999999) exitWith {hint "Нельзя за раз снять или положить больше $999,999"};
if (!([str(_val)] call SunriseClient_system_isnumber)) exitWith {["error","",format[localize "STR_ATM_notnumeric"]] call SunriseClient_message};

if (_mode == "") exitWith {hint "Операция не указана"};
if (life_action_inUse) exitWith {};

call SunriseClient_actions_inUse;

switch (_mode) do {
	case "add": {
		if (BANK < _val) exitWith {hint "У вас нет такой суммы на счету, чтобы внести их в казну"; life_action_inUse = false;};
		["atm","take",_val] call SunriseClient_system_myCash;
		[player,"add",_val] remoteExecCall ["SunriseServer_system_serverBank",RSERV];
	};
	
	case "take": {
		if (server_bank < _val) exitWith {hint "В казне нет такого количества валюты..."; life_action_inUse = false;};
		[player,"take",_val] remoteExecCall ["SunriseServer_system_serverBank",RSERV];
	};
};