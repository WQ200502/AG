/*

	Filename: 	SunriseClient_gangs_InvitePlayer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;

if (EQUAL((lbCurSel 2632),-1)) exitWith {[localize "STR_GNOTF_SelectPerson","error"] call SunriseClient_gui_bottomNotification};
private _unit = call compile format["%1",CONTROL_DATA(2632)];
if (isNull _unit) exitWith {};
if (EQUAL(_unit,player)) exitWith {[localize "STR_GNOTF_InviteSelf","error"] call SunriseClient_gui_bottomNotification};
if (!isNil {(group _unit) GVAR "gang_name"}) exitWith {["Этот человек уже в группировке","error"] call SunriseClient_gui_bottomNotification};
if ((grpPlayer GVAR ["gang_membersCount",0]) >= (grpPlayer GVAR ["gang_maxMembers",5])) exitWith {[localize "STR_GNOTF_MaxSlot","error"] call SunriseClient_gui_bottomNotification};

_action = [
	format[localize "STR_GNOTF_InvitePlayerMSG",GVAR_RNAME(_unit)],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	[GVAR_RNAME(player),grpPlayer,player] remoteExec ["SunriseClient_gangs_Invite",_unit];
	[format[localize "STR_GNOTF_InviteSent",GVAR_RNAME(_unit)],"info"] call SunriseClient_gui_bottomNotification;
} else {
	[localize "STR_GNOTF_InviteCancel","info"] call SunriseClient_gui_bottomNotification;
};