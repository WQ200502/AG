/*

	Filename:   SunriseServer_system_vehicleStore.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
params [
	["_vehicle",objNull,[objNull]],
	["_impound",false,[true]],
	["_unit",objNull,[objNull]],
	["_sp","",[""]]
];

if (isNull _vehicle || isNull _unit) exitWith {
	{life_impound_inuse = false;life_garage_store = false;} remoteExecCall ["call",_unit];
};

private _vInfo = _vehicle getVariable ["dbInfo",[]];
private _fuel = (fuel _vehicle);
private _trunk = _vehicle getVariable ["Trunk", [[],0]];

if (_impound) exitWith {
	if !(_vInfo isEqualTo []) then {format ["impoundVehicle:%1:%2:%3",_trunk,_fuel,_vInfo select 0] call SunriseServer_database_fireAndForget};
	{life_impound_inuse = false} remoteExecCall ["call",_unit];
	if !(isNull _vehicle) then {deleteVehicle _vehicle};
};

if (_vInfo isEqualTo []) exitWith {
	["STR_Garage_Store_NotPersistent","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit];
	{life_garage_store = false} remoteExecCall ["call",_unit];
};

if (_trunk isEqualTo [[],0]) then {_sp = "none"};
format ["storeVehicle:%1:%2:%3:%4",_trunk,_fuel,_sp,_vInfo select 0] call SunriseServer_database_fireAndForget;

if !(isNull _vehicle) then {deleteVehicle _vehicle};

{life_garage_store = false} remoteExecCall ["call",_unit];
["Ваша техника успешно сохранена в гараже","done"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit];