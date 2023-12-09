/*

	Filename: 	SunriseClient_admin_Compensate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {};

private _value = 5000000;

["cash","add",_value,"AdminCash"] call SunriseClient_system_myCash;
["atm","add",_value,"AdminCash"] call SunriseClient_system_myCash;
[format [localize "STR_ANOTF_Success",[_value] call SunriseClient_system_numberText], "done"] call SunriseClient_gui_BottomNotification;