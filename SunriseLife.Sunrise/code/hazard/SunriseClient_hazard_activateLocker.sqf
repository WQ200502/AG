/*

	Filename: 	SunriseClient_hazard_activateLocker.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params[
	["_trg",objNull],
	["_list",[]]
];
if (isNull _trg) exitWith {};

private _sucked = [];
private _proxy = _trg getVariable "anomaly_sound";
_proxy say3D "anomaly_mincer_blowout";
_trg setVariable ["anomaly_cooldown", true];
{
	if (alive _x) then {
		_sucked pushBackUnique _x;
		if (local _x) then {[_x, getpos _trg,2] spawn SunriseClient_hazard_suckToLocation};
	} else {
		[_x] call SunriseClient_hazard_minceCorpse;
	};
} forEach (nearestObjects [getPos _trg, ["Man","WeaponHolderSimulated"], 5]);
sleep 5;
{
	[_x] call SunriseClient_hazard_minceCorpse;
	if (local _x) then {_x setDamage 1};
} forEach _sucked;

private _source = "#particlesource" createVehicleLocal getPos _trg;
private _proxy2 = "Land_HelipadEmpty_F" createVehicleLocal position _trg;
_proxy2 enableSimulation false;
_proxy2 setPos (_trg modelToWorld [0,0,0.5]);
[_trg, _proxy2, "active"] call SunriseClient_hazard_effectSpringboard;
sleep 1;
deleteVehicle _proxy2;
deleteVehicle _source;

sleep (30 + random 30);
_trg setVariable ["anomaly_cooldown", false];


for "_i" from 0 to 360 step 10 do { 
	_an =[player getPos [10, _i]] call SunriseClient_system_createBurner; 
	 anomalies_holder pushBack _an;
	 _an setVariable ["anomaly_type", 3]
};