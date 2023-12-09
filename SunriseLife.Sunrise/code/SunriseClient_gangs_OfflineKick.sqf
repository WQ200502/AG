/*

	Filename: 	SunriseClient_gangs_OfflineKick.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 3802),-1)) exitWith {[localize "STR_GNOTF_SelectKick","error"] call SunriseClient_gui_bottomNotification};

private _gang_owner = grpPlayer GVAR ["gang_owner",""];
private _gang_deputy= grpPlayer GVAR ["gang_deputy","-1"];
if (!(EQUAL(_gang_owner,steamid)) AND !(EQUAL(_gang_deputy,steamid))) exitWith {closeDialog 0};

private _uid = CONTROL_DATA(3802);
if (EQUAL(_uid,"")) exitWith {};
if ([_uid] call SunriseClient_system_isUIDActive) exitWith {["Игрок в сети. Удалите его стандартным способом","error"] call SunriseClient_gui_bottomNotification};

private _updateGang = false;

if (EQUAL(_uid,_gang_deputy)) then {
	_updateGang = true;
	[grpPlayer,"gang_deputy"] call SunriseClient_system_clearGlobalVar;
};

[[player,grpPlayer,_uid,_updateGang],"kickOffline"] call SunriseClient_system_hcExec;
