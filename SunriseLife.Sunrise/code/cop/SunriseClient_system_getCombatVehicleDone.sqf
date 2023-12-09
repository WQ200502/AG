/*

	Filename: 	SunriseClient_system_getCombatVehicleDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_cfgClass","",[""]],
	["_marker","",[""]]
];

if (!isClass (missionConfigFile >> "LifeCfgBattleVehicles" >> _cfgClass)) exitWith {};

private _className = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"vehicleClass");
private _sp = getMarkerPos _marker;

private _vehicle = createVehicle [_className,_sp, [], 0, "NONE"];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setDir (markerDir _marker);
_vehicle setPos _sp;

player reveal _vehicle;
life_vehicles pushBack _vehicle;

[_vehicle,"vehicle_info_owners",[[steamid,GVAR_RNAME(player)]]] call CBA_fnc_setVarNet;

[steamid,_vehicle,1] remoteExecCall ["SunriseServer_system_keyManagement",RSERV];

[_vehicle] call SunriseClient_system_vehSetupRadio;
[_vehicle] call SunriseClient_system_clearVehicleAmmo;
[_vehicle] spawn SunriseClient_system_vehicleAnimate;
[_vehicle] call SunriseClient_system_clearVehicleSensors;

[_vehicle] remoteExec ["SunriseClient_system_vehicleActions",-2,_vehicle];

private _color = M_CONFIG(getText,"LifeCfgBattleVehicles",_cfgClass,"color");
if !(EQUAL(_color,"")) then {[_vehicle,_color] call SunriseClient_system_colorVehicle};

_vehicle lock 2;
_vehicle disableTIEquipment true;
_vehicle allowDamage true;

closeDialog 0;
hint "Боевая техника готова!";