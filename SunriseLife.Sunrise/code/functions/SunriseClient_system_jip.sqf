/*

	Filename: 	SunriseClient_system_jip.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
"JIP - Search for Land Vehicle..." call SunriseClient_system_log;
private ["_index","_material"];
{
	_index = _x GVAR ["life_VEH_color",""];
	if !(EQUAL(_index,"")) then {
		[_x,_index] call SunriseClient_system_colorVehicle;
	};
	_material = _x GVAR ["Life_VEH_material",""];
	if !(EQUAL(_material,"")) then {
		[_x,_material] call SunriseClient_system_materialVehicle;
	};
	if ([typeof _x] call SunriseClient_system_havePlate) then {[_x] call SunriseClient_system_setPlate};
} foreach (allMissionObjects "LandVehicle");

"JIP - Search for Air Vehicle..." call SunriseClient_system_log;
{
	_index = _x GVAR ["life_VEH_color",""];
	if !(EQUAL(_index,"")) then {
		[_x,_index] call SunriseClient_system_colorVehicle;
	};
	if ([typeof _x] call SunriseClient_system_havePlate) then {[_x] call SunriseClient_system_setPlate};
} foreach (allMissionObjects "Air");
"JIP - Colors, materials and plates updated" call SunriseClient_system_log;