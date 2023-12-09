/*

	Filename: 	SunriseClient_system_badString.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _string = param [0,"",[""]];
private _filter = ":`'";
private _return = false;

_string = toArray _string;
_filter = toArray _filter;

{
	if (_x in _filter) exitWith {_return = true};
} foreach _string;

_return;