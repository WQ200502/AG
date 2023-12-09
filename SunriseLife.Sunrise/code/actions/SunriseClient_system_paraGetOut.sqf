/*

	Filename: 	SunriseClient_system_paraGetOut.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
params [
	["_vehicle",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

private _dist_out_para = 20;
private _pos = (_vehicle worldToModel (visiblePosition _unit));
private _x_offset = _pos select 0;

if (_x_offset < 0) then {
	if ((typeOf _vehicle) in ["B_Heli_Light_01_F"]) then {
		_x_offset = 90;
	} else {
		_x_offset = 8;
	};
} else {
	if ((typeOf _vehicle) in ["B_Heli_Light_01_F"]) then {
		_x_offset = -90;
	} else {
		_x_offset = -8;
	};
};

uiSleep 0.2;
unassignVehicle _unit;
_unit action ["getout",_vehicle];
uiSleep 0.5;

_pos = ([_vehicle, _dist_out_para, ((getDir _vehicle) + 180 + _x_offset)] call BIS_fnc_relPos);
_pos = [_pos select 0, _pos select 1, ((visiblePosition _vehicle) select 2)];
_unit setPosATL _pos;
private _dist = _vehicle distance _unit;

waitUntil {uiSleep 0.03; (_vehicle distance _unit) - _dist > 20};
waitUntil {uiSleep 0.03; (visiblePosition _unit) select 2 < 100};

if !(unitBackpack _unit isKindOf "B_Parachute") then {
	private _chute = createVehicle ["Steerable_Parachute_F", position _unit, [], 0, "CAN_COLLIDE"];
	_chute AttachTo [_unit, [0,0,0]];
	detach _chute;
	private _velocity = velocity _unit;
	_unit moveInDriver _chute;
	_chute setVelocity _velocity;
};