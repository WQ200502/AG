/*
	
	Filename: 	SunriseClient_admin_Query.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _info = call compile format["%1", CONTROL_DATA(2902)];
if (isNil "_info") exitWith {CONTROL(2900,2903) ctrlSetText localize "STR_ANOTF_QueryFail";};
if (isNull _info) exitWith {CONTROL(2900,2903) ctrlSetText localize "STR_ANOTF_QueryFail";};
CONTROL(2900,2903) ctrlSetText localize "STR_ANOTF_Query";
[player] remoteExecCall ["SunriseClient_admin_PlayerQuery",_info];