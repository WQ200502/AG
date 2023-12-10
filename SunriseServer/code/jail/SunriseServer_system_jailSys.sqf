/*

	Filename: 	SunriseServer_system_jailSys.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
    ["_unit",objNull,[objNull]],
	["_bad",false,[false]]
];
if (isNull _unit) exitWith {};

private _ret = [_unit] call SunriseServer_system_wantedPerson;
[_ret,_bad] remoteExec ["SunriseClient_system_jailMe",_unit];