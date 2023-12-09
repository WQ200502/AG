/*

	Filename: 	SunriseClient_gangs_Leave.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (steamid isEqualTo (grpPlayer GVAR "gang_owner")) exitWith {[localize "STR_GNOTF_LeaderLeave","error"] call SunriseClient_gui_bottomNotification};
private _action = [
	format["Вы действительно хотите покинуть банду %1?",GANG_NAME],
	"Выход из банды",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	closeDialog 0;
	if (grpPlayer GVAR["gang_deputy","-1"] isEqualTo steamid) then {
		[grpPlayer,"gang_deputy"] call SunriseClient_system_clearGlobalVar;
		[[4,grpPlayer,steamid],"updateGang"] call SunriseClient_system_hcExec;
	};

	[[5,grpPlayer,steamid],"updateGang"] call SunriseClient_system_hcExec;

	[player] joinSilent (createGroup civilian);
	[] call SunriseClient_gangs_ClearLicense;
	["Вы покинули банду!","done"] call SunriseClient_gui_bottomNotification;
};