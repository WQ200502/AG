/*

	Filename: 	SunriseClient_admin_QuickBan.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {closeDialog 0;};

private _unit = call compile format["%1", CONTROL_DATA(2902)];
if (isNil "_unit" OR {isNull _unit}) exitwith {closeDialog 0};
	
["ban",getPlayerUID _unit,"Admin Ingame Ban","Sunrise Quick Ban"] remoteExecCall ["SunriseServer_system_serverCommand",RSERV];