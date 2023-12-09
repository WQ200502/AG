/*

	Filename: 	SunriseClient_system_jail.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_bad",false,[false]],
	["_jail_time",2,[0]]
];

life_jail_time = _jail_time;
if (isNull _unit OR !(EQUAL(_unit,player)) OR life_is_arrested) exitWith {};

[[player,_bad],"JailSys"] call SunriseClient_system_hcExec;