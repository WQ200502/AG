/*

	Filename: 	SunriseClient_system_putInCar.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit OR !isPlayer _unit) exitWith {};
if !(isNull life_DraggedBody) exitWith {["error","",format[localize "STR_NOTF_DragSmth"]] call SunriseClient_message};

private _nearestVehicle = nearestObjects [getPosATL player,["LandVehicle","Ship","Submarine","Air"],10] select 0;
if (isNil "_nearestVehicle") exitWith {["error","",format[localize "STR_NOTF_VehicleNear"]] call SunriseClient_message};

detach _unit;
[_nearestVehicle] remoteExecCall ["SunriseClient_system_moveIn",_unit];