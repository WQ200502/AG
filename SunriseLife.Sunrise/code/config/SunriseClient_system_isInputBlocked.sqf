/*
	
	Filename: 	SunriseClient_system_isInputBlocked.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
GVAR_RESTRAINED(player) OR LSINCAP(player) OR !(NOTATTACHED(player)) OR player GVAR ["knoked",false] OR player GVAR ["tazed",false] OR player GVAR ["isBlind",false]