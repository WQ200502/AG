/*
	
	Filename: 	SunriseClient_gangs_LicenseToPlayer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _license = param [0,"",[""]];
if ((lbCurSel 2621) isEqualTo -1) exitWith {[localize "STR_GNOTF_TransferSelect","error"] call SunriseClient_gui_bottomNotification};
private _unit = call compile format["%1",CONTROL_DATA(2621)];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

[player,_license] remoteExecCall ["SunriseClient_system_setPlayerLicense",_unit];