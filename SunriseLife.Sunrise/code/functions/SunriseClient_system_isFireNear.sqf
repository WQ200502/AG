/*

	Filename: 	SunriseClient_system_isFireNear.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_position",[],[[]]],
	["_radius",-1,[0]]
];

if (EQUAL(_position,[]) OR (EQUAL(_radius,-1))) exitWith {false};
private _objectsNearby = _position nearObjects _radius;
private _result = {inflamed _x} count _objectsNearby > 0;

_result;