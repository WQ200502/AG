/*
	
	Filename: 	SunriseClient_system_getOutW.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (NOTINVEH(player)) exitWith {};
player action ["getOut", objectParent player];
waitUntil {NOTINVEH(player)};
life_curWep_h = CURWEAPON;
player action ["SwitchWeapon",player,player,100];