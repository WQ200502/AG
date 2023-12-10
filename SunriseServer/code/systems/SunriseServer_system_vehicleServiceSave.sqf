/*

	Filename: 	SunriseServer_system_vehicleServiceSave.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(params [
	["_vehicle_id",-1,[-1]],
	["_save_color",false,[false]],
	["_color","",[""]],
	["_custom_color","",[""]],
	["_save_material",false,[false]],
	["_material","",[""]],
	["_save_box",false,[false]],
	["_box",-1,[-1]],
	["_save_nitro",false,[false]],
	["_nitro",false,[false]]
]) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};

if (_save_color) then {format ["vehicleServiceColor:%1:%2:%3",_color,_custom_color,_vehicle_id] call SunriseServer_database_fireAndForget};
if (_save_material) then {format ["vehicleServiceMaterial:%1:%2",_material,_vehicle_id] call SunriseServer_database_fireAndForget};
if (_save_box) then {format ["vehicleServiceBox:%1:%2",_box,_vehicle_id] call SunriseServer_database_fireAndForget};
if (_save_nitro) then {format ["vehicleServiceNitro:%1:%2",_nitro,_vehicle_id] call SunriseServer_database_fireAndForget};