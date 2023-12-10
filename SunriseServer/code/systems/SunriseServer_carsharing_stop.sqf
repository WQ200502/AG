/*

	Filename: 	SunriseServer_carsharing_stop.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _vehicle = param[0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

private _veh_crew = crew _vehicle;
if !(_veh_crew isEqualTo []) then {[] remoteExecCall ["SunriseClient_system_pulloutVeh",_veh_crew]};

if (local _vehicle) then {
	[_vehicle,2] call SunriseClient_system_lockVehicle;
} else {
	[_vehicle,2] remoteExecCall ["SunriseClient_system_lockVehicle",_vehicle];
};
[{_this enableSimulationGlobal false; deleteVehicle _this},_vehicle,5] call CBA_fnc_waitAndExecute;