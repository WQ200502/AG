/*

	Filename: 	SunriseClient_hazard_deactivateZone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _trigger = _this;
uiSleep random [5,7,10];
waitUntil {!(_trigger getVariable ["zone_loading",false])};
if (player in list _trigger) exitWith {};
private _zone_triggers = _trigger getVariable ["zone_triggers",[]];
if (_zone_triggers isEqualTo []) exitWith {};

anomalies_holder = anomalies_holder - _zone_triggers;
{ 
	_sound = _x getVariable ["anomaly_sound", objNull];
	_proxy = _x getVariable ["anomaly_particle_proxy", objNull];
	_source = _x getVariable ["anomaly_particle_source", objNull];
	_idle_sound_trig = _x getVariable ["anomaly_idle_sound", objNull];
	_idle_sound_second = _idle_sound_trig getVariable ["anomaly_idle_sound", objNull];
	if !(isNull _sound) then {deleteVehicle _sound};
	if !(isNull _proxy) then {deleteVehicle _proxy};
	if !(isNull _source) then {deleteVehicle _source};
	if !(isNull _idle_sound_trig) then {deleteVehicle _idle_sound_trig};
	if !(isNull _idle_sound_second) then {deleteVehicle _idle_sound_second};
	deleteVehicle _x;
} foreach _zone_triggers;