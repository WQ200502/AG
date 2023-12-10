/*

	Filename: 	SunriseServer_system_getID.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
private ["_id","_ret"];
_id = owner (_this select 0);
_ret = owner (_this select 1);

[_id] remoteExecCall ["SunriseClient_admin_getID",_ret];
