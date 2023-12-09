/*

	Filename: 	SunriseClient_system_havePlate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _veh = param [0,"",[""]];
if (EQUAL(_veh,"")) exitWith {false};
(
	["ivory_", (_veh)] call SunriseClient_system_xString OR
	["d3s_", (_veh)] call SunriseClient_system_xString OR
	["Mrshouka",_veh] call SunriseClient_system_xString OR
	["Quiet_",_veh] call SunriseClient_system_xString OR
	["quiet_",_veh] call SunriseClient_system_xString OR
	["MrShounka",_veh] call SunriseClient_system_xString OR
	["mrshounka",_veh] call SunriseClient_system_xString OR
	["Sunrise_",_veh] call SunriseClient_system_xString
)