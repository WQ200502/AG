/*

	Filename:   SunriseServer_system_spawnVehicle.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
#include "\SunriseServer\script_macros.hpp"
params [
	["_vid",-1,[0]],
	["_pid","",[""]],
	["_sp",[],[[],""]],
	["_unit",objNull,[objNull]],
	["_price",0,[0]],
	["_dir",0,[0]],
	["_sp_name","",[""]]   
];

if (_vid isEqualTo -1 || _pid isEqualTo "") exitWith {};
if (_vid in serv_sv_use) exitWith {["error",format ["|spawnVehicle| PARAMS=%1",_this]] call SunriseServer_system_customLog};
serv_sv_use pushBack _vid;
private _vInfo = format ["spawnVehicle:%1",_vid] call SunriseServer_database_selectSingle;
if (_vInfo isEqualTo []) exitWith {serv_sv_use deleteAt (serv_sv_use find _vid);};

_vInfo params ["_id", "_classname", "_type", "_pid", "_alive", "_active", "_plate", "_color", "_custom_color", "_material", "_boxes", "_nitro", "_inventory", "_gear", "_fuel", "_spname", "_baseprice"];
if (_spname in [_sp_name,"","none"]) then {
	if !(_alive) exitWith {
		serv_sv_use deleteAt (serv_sv_use find _vid);
		[1,"STR_Garage_SQLError_Destroyed",true,[_type]] remoteExecCall ["SunriseClient_system_broadcast",_unit];
	};
	if (_active) exitWith {
		serv_sv_use deleteAt (serv_sv_use find _vid);
		[1,"STR_Garage_SQLError_Active",true,[_type]] remoteExecCall ["SunriseClient_system_broadcast",_unit];
	};
	
	private _nearVehicles = if (!(_sp isEqualType "")) then {nearestObjects[_sp,["LandVehicle","Air","Ship"],10]} else {[]};
	if !(_nearVehicles isEqualTo []) exitWith {
		serv_sv_use deleteAt (serv_sv_use find _vid);
		["atm","add",_price] remoteExecCall ["SunriseClient_system_myCash",_unit];
		[1,"STR_Garage_SpawnPointError",true] remoteExecCall ["SunriseClient_system_broadcast",_unit];
	};
	
	format ["spawnVehicleActive:%1",_vid] call SunriseServer_database_fireAndForget;
	[_classname,_color,_custom_color,_material,_sp,_dir,_fuel,_inventory,_gear,[_id,_plate],_boxes,_nitro,_baseprice] remoteExecCall ["SunriseClient_garage_SpawnVehicle",_unit];
	serv_sv_use deleteAt (serv_sv_use find _vid);
} else {
	serv_sv_use deleteAt (serv_sv_use find _vid);
	["atm","add",_price] remoteExecCall ["SunriseClient_system_myCash",_unit];
	["Эта техника в другом гараже","warning"] remoteExecCall ["SunriseClient_system_hint",_unit];
};