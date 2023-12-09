/*
	
	Filename: 	SunriseClient_gangs_NewLeader.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 2621),-1)) exitWith {hint localize "STR_GNOTF_TransferSelect"};
private _unit = call compile format["%1",CONTROL_DATA(2621)];
if (isNull _unit) exitWith {}; //Bad unit?
if (EQUAL(_unit,player)) exitWith {hint localize "STR_GNOTF_TransferSelf"};

private _unitID = getPlayerUID _unit;

if (grpPlayer GVAR ["gang_deputy","-1"] == _unitID) exitWith {hint "Нельзя передать лидера заместителю. Назначьте замом другого или снимите текущего с должности";}; 

private _action = [
	format[localize "STR_GNOTF_TransferMSG",GVAR_RNAME(_unit)],
	localize "STR_Gang_Transfer",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {	
	if (EQUAL(_unitID,"")) exitWith {hint "Bad UID?"};	
	grpPlayer selectLeader _unit;
	grpPlayer SVAR ["gang_owner",_unitID,true];
	[_unit,grpPlayer] remoteExecCall ["SunriseClient_gangs_NewLeaderClient",_unit];

	//[[grpPlayer,playerSide,steamid,_unitID,GVAR_RNAME(player),GVAR_RNAME(_unit)],"newGangLeader"] call SunriseClient_system_hcExec;
	[[3,grpPlayer,steamid],"updateGang"] call SunriseClient_system_hcExec;

	[] call SunriseClient_gangs_Menu;
} else {
	[localize "STR_GNOTF_TransferCancel", "error"] call SunriseClient_gui_BottomNotification;
};