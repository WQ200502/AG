/*

	Filename: 	SunriseServer_system_handleVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_vehicle",objNull,[objNull]],
	["_player",objNull,[objNull]],
	["_time",0,[0]]
];
if (isNull _vehicle OR _time isEqualTo 0) exitWith {};
diag_log format ["handleVehicle vehicle - %1; time - %2",_vehicle,_time];
[{diag_tickTime > (_this#0) OR isNull (_this#1) OR driver (_this#1) != (_this#2)}, {if !(isNull (_this#1)) then {deleteVehicle (_this#1)}}, [diag_tickTime + _time,_vehicle,_player]] call CBA_fnc_waitUntilAndExecute;