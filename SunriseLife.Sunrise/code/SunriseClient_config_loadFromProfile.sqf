/*

	Filename: 	SunriseClient_config_loadFromProfile.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"

if (GVAR_PRNS ["PRNS_ServerSession",""] isEqualTo server_timeText) then {
	life_arc_currentZones = GVAR_PRNS ["PRNS_arc_currentZones",[]];
} else {
	SVAR_PRNS ["PRNS_ServerSession",server_timeText];
	
	life_arc_currentZones = [];
	SVAR_PRNS ["PRNS_arc_currentZones",life_arc_currentZones];
};