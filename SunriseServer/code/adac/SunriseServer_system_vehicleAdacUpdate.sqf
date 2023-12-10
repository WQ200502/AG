/*

	Filename: 	SunriseServer_system_vehicleAdacUpdate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_config",[],[[]]]
];
if (isNull _vehicle) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};
_config params ["_boxes","_nitro"];
format ["adacUpdate:%1:%2:%3",_boxes,_nitro,_dbInfo#0] call SunriseServer_database_fireAndForget;