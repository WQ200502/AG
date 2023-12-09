/*
	
	Filename: 	SunriseClient_system_colorVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_vehicle",Objnull,[Objnull]],
	["_color","",[""]],
	["_global",true,[true]],
	["_custom_color","",[""]]
];

format["VehicleColor - This: %1",_this] call SunriseClient_system_log;

if (isNull _vehicle OR (EQUAL(_color,""))) exitWith {};
if (!alive _vehicle) exitWith {};

if (_color select [0,1] isEqualTo "#") exitWith {
	if (_global) then {
		_vehicle setObjectTextureGlobal [0,_color];
	} else {
		_vehicle setObjectTexture [0,_color];
	};
	if (local _vehicle) then {_vehicle SVAR ["Life_VEH_color",_color,true]};
};
if (_color isEqualTo "custom") exitWith {
	if (_global) then {
		_vehicle setObjectTextureGlobal [0,_custom_color];
	} else {
		_vehicle setObjectTexture [0,_custom_color];
	};
	if (local _vehicle) then {_vehicle SVAR ["Life_VEH_color",_custom_color,true]};
};
if !(isClass (missionConfigFile >> "LifeCfgVehTextures" >> _color)) exitWith {};
{
	if !(EQUAL(_x,"")) then {
		if (_global) then {
			_vehicle setObjectTextureGlobal [_forEachIndex,_x];
		} else {
			_vehicle setObjectTexture [_forEachIndex,_x];
		};
	};
} forEach (M_CONFIG(getArray,"LifeCfgVehTextures",_color,"texture"));
if (local _vehicle) then {_vehicle SVAR ["Life_VEH_color",_color,true]};
