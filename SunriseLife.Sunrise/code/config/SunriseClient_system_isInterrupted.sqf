/*
	
	Filename: 	SunriseClient_system_isInterrupted.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
GVAR_RESTRAINED(player) OR player GVAR ["knoked",false] OR player GVAR ["tazed",false] OR LSNOTALIVE(player) OR player GVAR ["surrender", false]