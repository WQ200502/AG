/*

	Filename: 	SunriseClient_system_inJail.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"

player setPosATL (getMarkerPos "life_jail_spawn");
cutText ["Вы оказались в тюрьме","BLACK IN",5];