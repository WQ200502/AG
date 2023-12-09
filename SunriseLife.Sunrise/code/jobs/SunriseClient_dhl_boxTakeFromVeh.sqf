/*

	Filename: 	SunriseClient_dhl_boxTakeFromVeh.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if !("dhl" call SunriseClient_jobs_clothCheck) exitWith {[localize "STR_DHL_CheckError","error"] call SunriseClient_gui_bottomNotification};
if !(isNull life_dhl_box) exitWith {};

life_dhl_vehicle removeAction AID_TFW;

[player] call SunriseClient_dhl_boxSpawn;
[] spawn SunriseClient_dhl_boxPickUp;