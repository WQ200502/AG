/*
	
	Filename: 	SunriseClient_system_xString.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


	_found = ["needle", "Needle in Haystack"] call SunriseClient_system_xString;

*/
#include "..\..\script_macros.hpp"
private _toSearch = toArray (param [0,"",[""]]);
private _inSearch = toArray (param [1,"",[""]]);

private _lengthTo = count _toSearch;
private _lengthIn = count _inSearch;

private _found = false;

if (_lengthIn >= _lengthTo) then {
	_inSearch resize _lengthTo;
	if (EQUAL(_inSearch,_toSearch)) then {_found = true};
};

_found;