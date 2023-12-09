/*

	Filename: 	SunriseClient_system_clearVehicleSensors.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0, Objnull, [Objnull]];
if (isNull _vehicle) exitWith {};
private _toOff = ["VisualSensorComponent", "ActiveRadarSensorComponent", "PassiveRadarSensorComponent"];
private _vehSensors = listVehicleSensors _vehicle; {
    if ((_x select 0) in _toOff) then {
        _vehicle enableVehicleSensor[_x select 0, false];
    };
} forEach _vehSensors;