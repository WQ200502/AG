/*

	Filename:   SunriseClient_system_createBurner.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
private _pos = param [0,[],[[]]];
if (_pos isEqualTo []) exitWith {};

private _trg = createTrigger ["EmptyDetector", _pos, false];
_trg setPosATL _pos;
_trg setVariable ["anomaly_cooldown", false];

private _proxy = "Land_HelipadEmpty_F" createVehicleLocal position _trg;
_proxy enableSimulation false;
_proxy setPos (_trg modelToWorld [0,0,0.5]);
_trg setVariable ["anomaly_sound", _proxy];
_trg setTriggerArea [4, 4, 0, false,4];
_trg setTriggerActivation ["ANY", "PRESENT", true];
_trg setTriggerStatements ["this and !(thisTrigger getVariable ['anomaly_cooldown',false])", "[thisTrigger,thisList] spawn SunriseClient_hazard_activateBurner", ""];

// set up idle sound speaker;
private _trg2 = createTrigger ["EmptyDetector", _pos, false];
_trg2 setPosATL _pos;
_trg setVariable ["anomaly_idle_sound", _trg2];
private _proxy = "Land_HelipadEmpty_F" createVehicleLocal position _trg2;
_proxy enableSimulation false;
_proxy setPos (_trg2 modelToWorld [0,0,0.5]);
_trg2 setVariable ["anomaly_idle_sound", _proxy];
_trg2 setTriggerArea [25, 25, 0, false, 2];
_trg2 setTriggerActivation ["ANY", "PRESENT", true];
_trg2 setTriggerStatements ["this && {([] call CBA_fnc_currentUnit) in thisList}", "[thisTrigger] spawn {params['_thisTrigger']; sleep random 5; while{!isNull _thisTrigger && {triggerActivated _thisTrigger}} do {(_thisTrigger getVariable 'anomaly_idle_sound') say3D 'fire_idle'; sleep 8.272060}}", ""];

_trg