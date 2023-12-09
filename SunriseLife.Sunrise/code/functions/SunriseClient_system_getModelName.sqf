/*

	Filename: 	SunriseClient_system_getModelName.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _object = param [0,ObjNull,[ObjNull]];
private _array = (str(_object)) splitString ": .";

private _return = "";
{
	if (EQUAL(_x,"p3d")) exitWith {
		_return = _array select (_forEachIndex - 1);
	};
} forEach _array;

_return