/*

	Filename: 	SunriseClient_system_medicRequest.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
params [
	["_caller",objNull,[objNull]],
	["_callerName","Неизвестный",[""]]
];
if (isNull _caller) exitWith {};

player reveal _caller;
["MedicalRequestEmerg",[format[localize "STR_Medic_Request",_callerName]]] call BIS_fnc_showNotification;