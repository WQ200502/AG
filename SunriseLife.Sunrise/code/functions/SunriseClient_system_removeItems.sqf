/*

	Filename: 	SunriseClient_system_removeItems.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_item","",[""]],
	["_amount",-1,[-1]]
];
for "_x" from 1 to _amount do {[_item] call SunriseClient_system_removeItem};