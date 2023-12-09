/*

	Filename: 	SunriseClient_system_lookPassport.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private["_info","_pid","_indexInIds"];

_info = param [0,"",[""]];
_pid = param [1,"",[""]];

_indexInIds = [_pid,life_ids] call SunriseClient_system_index;

if (EQUAL(_indexInIds,-1)) then {
	life_ids pushBack [_pid,time];
} else {
	life_ids set[_indexInIds,[_pid,time]];
};

hintSilent parseText (_this select 0);