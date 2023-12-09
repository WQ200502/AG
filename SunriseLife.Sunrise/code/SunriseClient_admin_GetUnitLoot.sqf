/*

	Filename: 	SunriseClient_admin_GetUnitLoot.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {closeDialog 0;};

private _unit = CONTROL_DATA(2902);
_unit = call compile format["%1", _unit];
if (isNil "_unit" OR {isNull _unit}) exitwith {};

[player] remoteExecCall ["SunriseClient_admin_sendLootToAdmin",_unit];