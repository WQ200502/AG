/*
	
	Filename: 	SunriseClient_system_insurancePay.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_vehicle","_vid"];

disableSerialization;
if (lbCurSel 2802 isEqualTo -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = (call compile format["%1",CONTROL_DATA(2802)]) select 0;
_vid = CONTROL_VALUE(2802);

if (life_action_inUse) exitWith {};
if (isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

closeDialog 0;

call SunriseClient_actions_inUse;
hint "Отправка запроса в страховую...";
[_vid,steamid,player,life_garage_type,_vehicle] remoteExecCall ["SunriseServer_system_insurancePayRequest",RSERV];