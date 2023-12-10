/*

	Filename: 	SunriseServer_system_vehicleAdacRematerial.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_vehicle",ObjNull,[ObjNull]],
	["_material","",[""]]
];
if (isNull _vehicle) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};
format ["adacRematerial:%1:%2",_material,_dbInfo#0] call SunriseServer_database_fireAndForget;