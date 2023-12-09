/*

	Filename: 	SunriseClient_hazard_activateBurner.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params[
	["_trg",objNull],
	["_list",[]]
];
if (isNull _trg) exitWith {};

private _proxy = _trg getVariable "anomaly_sound";
_proxy say3d "fire2";

private _pos = position _trg;
private _source = "#particlesource" createVehicleLocal getPos _trg;
private _proxy2 = "Land_HelipadEmpty_F" createVehicleLocal [((_pos select 0) - 2 + (random 2)), ((_pos select 1) - 2 + (random 2)), _pos select 2];
_proxy2 enableSimulation false;
private _source2 = "#particlesource" createVehicleLocal [((_pos select 0) - 2 + (random 2)), ((_pos select 1) - 2 + (random 2)), _pos select 2];
private _proxy3 = "Land_HelipadEmpty_F" createVehicleLocal position _trg;
_proxy3 enableSimulation false;

[_proxy2, _source, "active"] call SunriseClient_hazard_effectBurner;
[_proxy3, _source2, "active"] call SunriseClient_hazard_effectBurner;

private _light = "#lightpoint" createVehicleLocal (getpos _proxy);
_light setLightBrightness 1;
_light setLightAmbient [1, 0.6, 0.6];
_light setLightColor [1, 0.6, 0.6];
_light setLightUseFlare false;
_light setLightFlareSize 100;
_light setLightFlareMaxDistance 100;
_light setLightDayLight true;


_trg setVariable ["anomaly_cooldown", true, true];
{
	if (local _x) then {_x setDamage 1};
	[_x] call SunriseClient_hazard_minceCorpse;
} forEach (nearestObjects [getPos _trg, ["Man"], 5]);
sleep 5;

if !(isNull _source) then {deleteVehicle _source};
if !(isNull _proxy2) then {deleteVehicle _proxy2};
if !(isNull _source2) then {deleteVehicle _source2};
if !(isNull _proxy3) then {deleteVehicle _proxy3};
if !(isNull _light) then {deleteVehicle _light};

sleep (5 + random 21);
_trg setVariable ["anomaly_cooldown", false, true];