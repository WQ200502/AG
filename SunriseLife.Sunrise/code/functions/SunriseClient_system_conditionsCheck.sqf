/*

	Filename: 	SunriseClient_system_conditionsCheck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _conditions = param [0,"",[""]];
if (EQUAL(_conditions,"")) exitWith {true};
_conditions = call compile _conditions;

if (_conditions isEqualType true) then {
    if (_conditions) then {true} else {false};
} else {true};