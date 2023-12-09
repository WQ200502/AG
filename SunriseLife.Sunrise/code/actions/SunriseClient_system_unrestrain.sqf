/*
	
	Filename: 	SunriseClient_system_unrestrain.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit OR !(GVAR_RESTRAINED(_unit))) exitWith {};

[_unit,"restrained"] call SunriseClient_system_clearGlobalVar;
[_unit,"isBlind"] call SunriseClient_system_clearGlobalVar;

detach _unit;
titleText[format ["Вы освободили руки %1",GVAR_RNAME(_unit)],"PLAIN"];