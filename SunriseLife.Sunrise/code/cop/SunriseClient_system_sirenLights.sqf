/*

	Filename: 	SunriseClient_system_sirenLights.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {}; //Bad entry!
if !((typeOf _vehicle) in (LIFE_SETTINGS(getArray,"life_vehiclesWithLights"))) exitWith {};

if (_vehicle GVAR ["lights",false]) then {	
	[_vehicle,"lights"] call SunriseClient_system_clearGlobalVar;
} else {
	[_vehicle,"lights",true] call CBA_fnc_setVarNet;
	[_vehicle,0.22] remoteExec ["SunriseClient_system_copLights",RCLIENT];
};