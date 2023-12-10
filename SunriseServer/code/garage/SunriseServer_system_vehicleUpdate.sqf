/*

	Filename: 	SunriseServer_system_vehicleUpdate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if !(params [
	["_vehicle",objNull,[objNull]],
	["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|vehicleUpdate| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};

private _trunk = _vehicle getVariable ["Trunk",[[],0]];
format ["vehicleUpdate:%1:%2",_trunk,_dbInfo#0] call SunriseServer_database_fireAndForget;
["Содержимое багажника сохранено!"] remoteExecCall ["systemChat",_unit];