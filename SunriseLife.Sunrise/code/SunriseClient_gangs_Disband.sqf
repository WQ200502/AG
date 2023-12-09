/*

	Filename: 	SunriseClient_gangs_Disband.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _gangID = grpPlayer GVAR ["gang_id",-1];
if (group player in [life_copGroup,life_medGroup]) exitWith {};

private _action = [
	localize "STR_GNOTF_DisbandWarn",
	localize "STR_Gang_Disband_Gang",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	["Расформировываем группу","info"] call SunriseClient_gui_bottomNotification;
	[grpPlayer,steamid,GVAR_RNAME(player),GANG_NAME] remoteExecCall ["SunriseServer_system_removeGang",RSERV];
} else {
	["Расформирование отменено","info"] call SunriseClient_gui_bottomNotification;
};