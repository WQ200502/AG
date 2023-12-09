/*
	
	Filename: 	SunriseClient_system_licenseCheck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _cop = param [0,ObjNull,[ObjNull]];
if (isNull _cop) exitWith {};

private _licenses = "";

{	
	_licenses = _licenses + (localize (getText(missionConfigFile >> "LifeCfgLicenses" >> _x >> "displayName"))) + "<br/>";
} forEach life_licenses;

if (EQUAL(_licenses,"")) then {_licenses = localize "STR_Cop_NoLicensesFound"};

[GVAR_RNAME(player),_licenses] remoteExecCall ["SunriseClient_system_licensesRead",_cop];