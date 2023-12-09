/*

	Filename: 	SunriseClient_vehicles_alarmSound.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _source = param [0,ObjNull,[ObjNull]];
if (isNull _source) exitWith {};
_source say3D "car_alarm";