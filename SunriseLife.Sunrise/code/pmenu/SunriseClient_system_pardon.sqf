/*

	Filename: 	SunriseClient_system_pardon.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _list = CONTROL(2400,2402);
private _data = call compile format["%1", CONTROL_DATA(2401)];

if (isNil "_data") exitWith {};
if (typeName _data != "ARRAY") exitWith {};
if (EQUAL(_data,[])) exitWith {};

private _uid = _data select 0;
hint "Помилование... Подождите...";

[[_uid],"wantedRemove"] call SunriseClient_system_hcExec;

uiSleep 2;
hint "Готово!";
[] spawn SunriseClient_system_wantedMenu;