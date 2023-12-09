/*

	Filename: 	SunriseClient_system_isTrunkInUse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _trunk = param [0,objNull,[objNull]];
if (isNull _trunk) exitWith {false};
if (isNil {_trunk GVAR "trunk_inUseBy"}) exitWith {false};
private _ret = false;
private _usedByPID = _trunk GVAR ["trunk_inUseBy",""];

if !(EQUAL(_usedByPID,"")) then {
	if (!(EQUAL(_usedByPID,steamid)) && {[_usedByPID] call SunriseClient_system_isUIDActive}) then {_ret = true};
};

_ret;