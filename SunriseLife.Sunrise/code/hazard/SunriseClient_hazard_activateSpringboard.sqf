/*

	Filename: 	SunriseClient_hazard_activateSpringboard.sqf
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
private _sound = ("gravi_blowout" + str ( (floor random 6) + 1 ));
_proxy say3D _sound;

uiSleep 0.25;
private _source = "#particlesource" createVehicleLocal getPos _trg;
private _proxy2 = "Land_HelipadEmpty_F" createVehicleLocal position _trg;
_proxy2 enableSimulation false;
_proxy2 setPos (_trg modelToWorld [0,0,0.5]);

[_proxy2, _source, "active"] call SunriseClient_hazard_effectSpringboard;

_trg setVariable ["anomaly_cooldown", true, true];
{
	if (local _x) then {
		_pos1 = getpos _trg;
		_pos2 = getpos _x;
		_a = ((_pos1 select 0) - (_pos2 select 0));
		_b = ((_pos1 select 1) - (_pos2 select 1));
		_x setVelocity [_a*2, _b*2, 9 + (5 / (1 + (abs _a) + (abs _b)))];
	};
	uiSleep 1.5;
	if (local _x) then {_x setDamage 1};
	[_x] call SunriseClient_hazard_minceCorpse;
} forEach (nearestObjects [getPos _trg, ["Man"], 5]);

uiSleep 1;

if !(isNull _source) then {deleteVehicle _source};
if !(isNull _proxy2) then {deleteVehicle _proxy2};

sleep (10 + random 6);
_trg setVariable ["anomaly_cooldown", false];