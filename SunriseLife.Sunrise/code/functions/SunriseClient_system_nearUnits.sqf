/*
	
	Filename: 	SunriseClient_system_nearUnits.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_faction",sideUnknown,[sideUnknown]],
	["_position",(getPos player),[[]]],
	["_radius",30,[0]]	
];

if (EQUAL(_faction,sideUnknown)) exitWith {false};

private _ret = false;

_ret = {_x != player && side _x isEqualTo _faction && alive _x && _position distance _x < _radius} count playableUnits > 0;
_ret;