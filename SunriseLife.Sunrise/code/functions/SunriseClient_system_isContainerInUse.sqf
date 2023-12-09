/*

	Filename: 	SunriseClient_system_isContainerInUse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _container = param [0,objNull,[objNull]];
if (isNull _container) exitWith {diag_log "isnull _container";false};
if (isNil {_container GVAR "openedByUnit"}) exitWith {diag_log "isNil openedByUnit";false};

private _ret = false;
private _usedByPID = _container GVAR ["openedByUnit",""];

if !(EQUAL(_usedByPID,"")) then {
	if (!(EQUAL(_usedByPID,steamid)) && {[_usedByPID] call SunriseClient_system_isUIDActive}) then {_ret = true};
};

_ret;