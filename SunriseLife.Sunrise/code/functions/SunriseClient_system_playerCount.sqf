/*
	
	Filename: 	SunriseClient_system_playerCount.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _faction = param [0,civilian,[east]];

{EQUAL(side _x,_faction)} count playableUnits;