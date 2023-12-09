/*
	
	Filename: 	SunriseClient_gangs_Lvl.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private["_unit"];
disableSerialization;
_mode = param [0,0,[0]];
if ((lbCurSel 2621) isEqualTo -1) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format["%1",CONTROL_DATA(2621)];
if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

[player,_mode] remoteExecCall ["SunriseClient_system_setPlayerLvL",_unit];