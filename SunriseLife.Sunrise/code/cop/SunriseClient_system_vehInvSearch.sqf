/*
	
	Filename: 	SunriseClient_system_vehInvSearch.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = cursorObject;
if (isNull _vehicle) exitWith {};
if !([_vehicle] call SunriseClient_system_isVehicleKind) exitWith {};
if !([player] call SunriseClient_system_checkForSearch) exitWith {["error","","Для обыска автомобиля доставьте его в полицейский участок!"] call SunriseClient_message};

createDialog "SunriseDialogSearchVeh";
[] call SunriseClient_system_vehInvSearchUpdate;