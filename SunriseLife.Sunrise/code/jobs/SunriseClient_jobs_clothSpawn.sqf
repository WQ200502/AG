/*

	Filename: 	SunriseClient_jobs_clothSpawn.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
_this = _this select 3;
if !(missionNamespace getVariable [format["life_%1_readyToWork",_this],false]) exitWith {["Я не беру людей с улицы. Сходи сначала на биржу труда","error"] call SunriseClient_gui_bottomNotification};
if (_this call SunriseClient_jobs_clothCheck) exitWith {["Вы уже одеты в рабочую одежду!","error"] call SunriseClient_gui_bottomNotification};

private _price = getNumber(missionConfigFile >> "LifeCfgSettings" >> (format["life_%1_cloth_price",_this]));
private _action = [format ["Для работы вам необходима рабочая одежда, стоимость покупки составляет $%1",[_price] call SunriseClient_system_numberText],"Покупка рабочей одежды",localize "STR_Global_Yes",localize "STR_Global_No"] call BIS_fnc_guiMessage;

if (_action) then {
	["atm","take",_price] call SunriseClient_system_myCash;
	switch (_this) do { 
		case "eco_ws" : {["U_C_Scientist"] call SunriseClient_system_addItem;["H_mas_rus_woolhat_ht_w"] call SunriseClient_system_addItem}; 
		case "eco_gs" : {["U_C_Scientist"] call SunriseClient_system_addItem;["H_mas_rus_woolhat_ht_w"] call SunriseClient_system_addItem;["sunrise_Tool_Shovel"] call SunriseClient_system_addItem}; 
		case "dhl" : {["sunrise_dhl_Employee"] call SunriseClient_system_addItem; ["sunrise_dhl_Cap"] call SunriseClient_system_addItem}; 
		case "eln" : {["U_C_Poor_1"] call SunriseClient_system_addItem;["H_Booniehat_tan"] call SunriseClient_system_addItem}; 
		case "bus" : {["U_Marshal"] call SunriseClient_system_addItem;["H_StrawHat_dark"] call SunriseClient_system_addItem}; 
		default {false}; 
	};
} else {
	["Вы отказались от покупки одежды","info"] call SunriseClient_gui_bottomNotification;
};