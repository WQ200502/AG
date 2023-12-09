/*
	
	Filename: 	SunriseClient_system_onPutItem.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_container",ObjNull,[ObjNull]],
	["_item","",[""]]
];

if (isNull _unit OR isNull _container OR EQUAL(_item,"") OR life_copDuty OR life_medDuty) exitWith {};

playSound "click";
[] call SunriseClient_system_saveGear;