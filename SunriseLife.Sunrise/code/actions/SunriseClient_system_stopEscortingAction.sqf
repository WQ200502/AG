/*

	Filename: 	SunriseClient_system_stopEscortingAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
player removeAction AID_SEA;
{detach _x} forEach (attachedObjects player);