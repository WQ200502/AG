/*

	Filename: 	SunriseClient_system_serviceBoxUpdate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_vehicleClassName","",[""]],
	["_color","",[""]],
	["_material","",[""]]
];

if (EQUAL(_vehicleClassName,"")) exitWith {};

if (!(EQUAL((typeOf ShopBoxVehicle),_vehicleClassName)) OR "" in [_color,_material]) then {
	if (!isNull ShopBoxVehicle) then {
		deleteVehicle ShopBoxVehicle;
	};
	ShopBoxVehicle = _vehicleClassName createVehicleLocal ShopBoxVehiclePosition;
	ShopBoxVehicle setDir (getDir player);
	ShopBoxVehicle allowDamage false;
	ShopBoxVehicle enableSimulation false;
	ShopBoxVehicle setPosASL ShopBoxVehiclePosition;

	ShopBoxCamera camPrepareTarget ShopBoxVehicle;
	ShopBoxCameraCord = [ShopBoxVehicle,ShopBoxRadius,ShopBoxAngle] call BIS_fnc_relPos;
	ShopBoxCameraCord set [2, ShopBoxAltitude];
	ShopBoxCamera camPreparePos ShopBoxCameraCord;
	ShopBoxCamera camCommitPrepared ShopBoxSpeed;
};

if !(EQUAL(_color,"") OR EQUAL(_color,"custom")) then {[ShopBoxVehicle,_color,false] call SunriseClient_system_colorVehicle};
if !(EQUAL(_material,"")) then {[ShopBoxVehicle,_material,false] call SunriseClient_system_materialVehicle};