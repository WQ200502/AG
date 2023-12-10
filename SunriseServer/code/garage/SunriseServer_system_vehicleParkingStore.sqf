/*

	Filename: 	SunriseServer_system_vehicleParkingStore.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
	["_vehicle",ObjNull,[ObjNull]],
	["_parkingCost",0,[0]],
	["_parkingMessage","",[""]],
	["_unit",ObjNull,[ObjNull]]
];

private _dbInfo = _vehicle getvariable ["dbInfo",[]];
_parkingMessage = [_parkingMessage] call SunriseServer_database_strip;

format ["vehicleParkingStore:%1:%2",[_parkingCost,_parkingMessage],_dbInfo#0] call SunriseServer_database_fireAndForget;
life_impound_inuse = false;

if !(isNull _vehicle) then {deleteVehicle _vehicle;};

[] remoteExecCall ["SunriseClient_parking_ImpoundActionDone",_unit];