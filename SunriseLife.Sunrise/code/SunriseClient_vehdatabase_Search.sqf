/*

	Filename: 	SunriseClient_vehdatabase_Search.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5600)) exitWith {};
private _plate = ctrlText 5602;
if (EQUAL(_plate,"")) exitWith {hint "Введите регистрационный номер"};
(CONTROL(5600,5603)) ctrlEnable false;
[localize "STR_NOTF_SendingData", "info"] call SunriseClient_gui_BottomNotification;

private _source_symbols = toArray (toUpper _plate);
private _allowed_symbols = toArray "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

if !((count _source_symbols) isEqualTo 7) exitWith {["Вы ввели номер неправильно","error"] call SunriseClient_gui_bottomNotification;(CONTROL(5600,5603)) ctrlEnable true};

private _error = _source_symbols findIf {!(_x in _allowed_symbols)};
if (_error != -1) exitWith {["Вы ввели номер неправильно","error"] call SunriseClient_gui_bottomNotification;(CONTROL(5600,5603)) ctrlEnable true};

[_plate,player] remoteExecCall ["SunriseServer_system_vehSearch",RSERV];