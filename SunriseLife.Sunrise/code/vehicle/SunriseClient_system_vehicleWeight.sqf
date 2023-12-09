/*
	
	Filename: 	SunriseClient_system_vehicleWeight.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {};

[M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _vehicle,"vItemSpace") + (100 * (_vehicle GVAR ["adacBoxes",0])),(_vehicle GVAR ["Trunk",[[],0]]) select 1];