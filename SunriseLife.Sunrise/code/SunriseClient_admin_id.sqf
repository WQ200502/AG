/*
	
	Filename: 	SunriseClient_admin_id.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private["_ret","_text"];
disableSerialization;
_ret = param [0,objNull,[objNull]];
_text = CONTROL(2900,2903);

_text ctrlSetStructuredText parseText format["ID: %1",_ret];