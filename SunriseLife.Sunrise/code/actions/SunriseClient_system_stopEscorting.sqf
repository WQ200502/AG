/*

	Filename: 	SunriseClient_system_stopEscorting.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];

if (isNull _unit) exitWith {}; //Not valid
if (NOTATTACHED(_unit)) exitWith {};

detach _unit;