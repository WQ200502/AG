/*

	Filename: 	SunriseClient_system_badProfileName.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _string = param [0,"",[""]];
if (["  ",_string] call BIS_fnc_inString) exitWith {true};
if ((toLower _string) in ["admin","admins","administrator","nigga","nigger","fuck","fucking","asshole","user","genesis","sunrise","extremo","genesisthebest","pedik","pidor","govno","petuh","adminpidor","govnomes","mentipidori"]) exitWith {true};
private _return = false;
private _filter = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ";

_string = toArray _string;
_filter = toArray _filter;

{
	if !(_x in _filter) exitWith {_return = true};
} foreach _string;

if !(_return) then {
	private _first = _string select 0;
	private _last = _string select ((count _string) - 1);
	private _space = (toArray " ") select 0;
	if (EQUAL(_last,_space)) then {_return = true};
	if (EQUAL(_first,_space)) then {_return = true};

	{
		if (EQUAL(_x,_space) && (EQUAL((_string select (_forEachIndex + 1)),_space))) exitWith {_return = true};
	} foreach _string;
};

_return;