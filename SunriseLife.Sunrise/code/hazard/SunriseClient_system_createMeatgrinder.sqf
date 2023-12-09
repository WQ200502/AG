/*

	Filename:   SunriseClient_system_createMeatgrinder.sqf
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
_trg setTriggerStatements ["this and !(thisTrigger getVariable ['anomaly_cooldown',false])", "[thisTrigger,thisList] spawn SunriseClient_hazard_activateMeatgrinder", ""];

_trg