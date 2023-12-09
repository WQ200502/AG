/*

	Filename:   SunriseClient_system_freezePlayer.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
#include "..\..\script_macros.hpp"
private _admin = param [0,ObjNull,[ObjNull]];

if (userInputDisabled) then {
	["info","",format[localize "STR_NOTF_Unfrozen"]] call SunriseClient_message;
	[format[localize "STR_ANOTF_Unfrozen",GVAR_RNAME(player)],"done"] remoteExecCall ["SunriseClient_gui_bottomNotification",_admin];
	disableUserInput false;
} else {
	["info","",format[localize "STR_NOTF_Frozen"]] call SunriseClient_message;
	[format[localize "STR_ANOTF_Frozen",GVAR_RNAME(player)],"done"] remoteExecCall ["SunriseClient_gui_bottomNotification",_admin];
	disableUserInput true;
};