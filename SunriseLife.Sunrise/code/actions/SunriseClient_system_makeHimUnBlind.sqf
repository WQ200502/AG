/*

	Filename: 	SunriseClient_system_makeHimUnBlind.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {};
if !(_unit GVAR ["isBlind",false]) exitWith {};

[_unit,"isBlind"] call SunriseClient_system_clearGlobalVar;
player say3D "blind";