/*
	
	Filename: 	SunriseClient_system_nearPlayers.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_position",getPos player,[[]]],
	["_radius",30,[0]]
];

private _ret = false;
_ret = {_x != player && alive _x && !(GVAR_RESTRAINED(_x)) && _position distance _x < _radius} count playableUnits > 0;
_ret;