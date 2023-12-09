/*
	
	Filename: 	SunriseClient_gangs_Kick.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if ((lbCurSel 2621) isEqualTo -1) exitWith {[localize "STR_GNOTF_SelectKick","error"] call SunriseClient_gui_bottomNotification};
private _unit = call compile format["%1",CONTROL_DATA(2621)];
if (isNull _unit) exitWith {}; //Bad unit?
if (_unit isEqualTo player) exitWith {[localize "STR_GNOTF_KickSelf","error"] call SunriseClient_gui_bottomNotification};
if ((getPlayerUID _unit) isEqualTo (grpPlayer GVAR ["gang_owner",""])) exitWith {["Нельзя исключить лидера","error"] call SunriseClient_gui_bottomNotification};

[player,grpPlayer] remoteExecCall ["SunriseClient_gangs_ClientKick",_unit];