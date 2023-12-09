/*
	
	Filename: 	SunriseClient_parking_ImpoundAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_impound_inuse) exitWith {["Уже идет процесс конфискации", "error"] call SunriseClient_gui_BottomNotification};
disableSerialization;
if (isNull (findDisplay 5500)) exitWith {};
private _vehicle = param [0,ObjNull,[ObjNull]];
if !(_vehicle isKindOf "LandVehicle") exitWith {};
if (player distance _vehicle > 10) exitWith {};
if (!alive _vehicle) exitWith {[localize "STR_NOTF_VehNotAlive", "error"] call SunriseClient_gui_BottomNotification};

private _dbInfo = _vehicle GVAR ["dbInfo",[]];
if (EQUAL(_dbInfo,[])) exitWith {["Автомобиль арендован", "error"] call SunriseClient_gui_BottomNotification};

private _parkingCost = ctrlText 5502;
if !([_parkingCost] call SunriseClient_system_isnumber) exitWith {[localize "STR_ATM_notnumeric","error"] call SunriseClient_gui_bottomNotification};

_parkingCost = parseNumber _parkingCost;
private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _vehicle,"price")*0.5;
if (_parkingCost > _basePrice) exitWith {[format["Максимальная сумма не должна превышать $%1",[_basePrice] call SunriseClient_system_numberText], "error"] call SunriseClient_gui_BottomNotification};
if (_parkingCost < LIFE_SETTINGS(getNumber,"life_impound_car")) exitwith {[format["Минимальная сумма составляет $%1",[LIFE_SETTINGS(getNumber,"life_impound_car")] call SunriseClient_system_numberText], "error"] call SunriseClient_gui_BottomNotification};

private _parkingMessage = ctrlText 5503;
if (EQUAL(_parkingMessage,"")) exitWith {["Не указана причина конфискации на штрафстоянку", "error"] call SunriseClient_gui_BottomNotification};
if (count _parkingMessage > 150) exitWith {["Количество букв в сообщении не должно превышать 150", "error"] call SunriseClient_gui_BottomNotification};
closeDialog 0;

private _vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");	
private _time = 30;
if (IS_VIP) then {_time = _time call SunriseClient_system_timeDiscount};

[localize "STR_NOTF_Impounding",_time,{player distance _vehicle > 10}] call SunriseClient_system_progressBarSimple;
if (call SunriseClient_system_isInterrupted) exitWith {[localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if (player distance _vehicle > 10) exitWith {[localize "STR_NOTF_ImpoundingCancelled", "error"] call SunriseClient_gui_BottomNotification};

if (EQUAL((crew _vehicle),[]) OR ((typeOf _vehicle) in ["B_UAV_02_F","B_UGV_01_F","I_UGV_01_F"])) then {
	life_impound_inuse = true;
	
	[_vehicle,_parkingCost,_parkingMessage,player] remoteExecCall ["SunriseServer_system_vehicleParkingStore",RSERV];
	[localize "STR_NOTF_SendingData", "error"] call SunriseClient_gui_BottomNotification;
} else {
	[localize "STR_NOTF_ImpoundingCancelled", "error"] call SunriseClient_gui_BottomNotification;
};