/*

	Filename: 	SunriseClient_system_lightHouseAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _house = param [0,ObjNull,[ObjNull]];
if (isNull _house) exitWith {};
if (!(_house isKindOf "House_F")) exitWith {};

if (isNull (_house GVAR ["lightSource",ObjNull])) then {
	[_house,true] remoteExecCall ["SunriseClient_system_lightHouse",RCLIENT];
	["Свет включен"] spawn SunriseClient_gui_Notification;
} else {	
	[_house,false] remoteExecCall ["SunriseClient_system_lightHouse",RCLIENT];
	["Свет выключен"] spawn SunriseClient_gui_Notification;
};