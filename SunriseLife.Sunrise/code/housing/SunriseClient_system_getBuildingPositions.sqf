/*

	Filename: 	SunriseClient_system_getBuildingPositions.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _house = param [0,objNull,[objNull]];
if (isNull _house) exitWith {[]};

private _restricted = M_CONFIG2(getArray,"LifeCfgHousing",worldName,typeOf _house,"restrictedPos");
private _return = [_house] call BIS_fnc_buildingPositions;

{
	_return set [_x,[-1]];
} forEach _restricted;

_return = _return - [[-1]];
_return;