/*

	Filename: 	SunriseClient_system_setDeadState.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[objNull]];

private _deathAnim = [_unit] call SunriseClient_system_getDeathAnimation;

if (EQUAL(_deathAnim,"Unconscious") && !(NOTINVEH(_unit))) exitWith {
	[_unit] remoteExecCall ["SunriseClient_system_pulloutVeh",_unit];
};

[_unit,_deathAnim] remoteExecCall ["SunriseClient_system_animSync",RCLIENT];