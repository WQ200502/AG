/*
	
	Filename: 	SunriseClient_system_unloadFromHB.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];

if (LSINCAP(player)) then {
	player setPosATL (getPosATL _unit);
} else {
	moveOut player;	
};