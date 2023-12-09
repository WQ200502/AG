/*
	
	Filename: 	SunriseClient_admin_getID.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _unit = CONTROL_DATA(2902);
_unit = call compile format["%1", _unit];
if (isNil "_unit" OR isNull _unit) exitwith {};

[_unit,player] remoteExecCall ["SunriseServer_system_getID",RSERV];