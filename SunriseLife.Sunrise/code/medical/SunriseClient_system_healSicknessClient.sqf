/*

	Filename: 	SunriseClient_system_healSicknessClient.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
life_sickness = false;
[getPlayerUID player,"life_sickness",life_sickness] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];