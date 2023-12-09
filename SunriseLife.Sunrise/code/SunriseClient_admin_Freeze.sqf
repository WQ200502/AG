/*
	
	Filename: 	SunriseClient_admin_Freeze.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {closeDialog 0;};

private _unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if (isNil "_unit" OR {isNull _unit OR _unit isEqualTo player}) exitWith {};

[player] remoteExecCall ["SunriseClient_system_freezePlayer",_unit];