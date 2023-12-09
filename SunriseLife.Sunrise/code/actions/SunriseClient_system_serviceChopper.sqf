/*
	
	Filename: 	SunriseClient_system_serviceChopper.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText","_title","_point","_progress_rscLayer"];
if (life_action_inUse) exitWith {hint localize "STR_NOTF_Action"};
_point = _this select 3;
_search = nearestObjects[getMarkerPos _point, ["Air"],10];
if (EQUAL(_search,[])) exitWith {hint localize "STR_Service_Chopper_NoAir"};
if (CASH < 100) exitWith {hint localize "STR_Serive_Chopper_NotEnough"};
["cash","take",100] call SunriseClient_system_myCash;
call SunriseClient_actions_inUse;

_title = localize "STR_Service_Chopper_Servicing";
_cP = 0;
titleText[_title,"PLAIN"];

while {true} do {
	uiSleep  0.2;
	_cP = _cP + 0.01;
	[_cP,"repair"] call SunriseClient_system_progressBar;
	if (_cP >= 1 OR (call SunriseClient_system_isInterrupted)) exitWith {};
};

["life_progress"] call SunriseClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call SunriseClient_system_isInterrupted) exitWith {["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};

if (!alive (_search select 0) || (_search select 0) distance air_sp > 15) exitWith {hint localize "STR_Service_Chopper_Missing"};
if (!local (_search select 0)) then {
	[(_search select 0),1] remoteExecCall ["SunriseClient_system_setFuel",(_search select 0)];
} else {
	(_search select 0) setFuel 1;
};
(_search select 0) setDamage 0;
titleText [localize "STR_Service_Chopper_Done","PLAIN"];