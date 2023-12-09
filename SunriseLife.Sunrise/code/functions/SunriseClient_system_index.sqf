/*

	Filename: 	SunriseClient_system_index.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_item","_stack"];

_stack findIf {_item in _x}