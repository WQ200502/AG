/*

	Filename: 	SunriseClient_system_removeDrugs.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private["_medic"];
_medic = param [0,ObjNull,[ObjNull]];

life_drug_light = false;
[getPlayerUID player,"life_drug_light",life_drug_light] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];
life_drug_hard = false;
[getPlayerUID player,"life_drug_hard",life_drug_hard] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2];

hint format["Медик %1 снял с вас все наркотические зависимости!",GVAR_RNAME(_medic)];