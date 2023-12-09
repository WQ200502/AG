/*

	Filename: 	SunriseClient_jail_spawnTruck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if !(life_is_arrested) exitWith {["Вы не заключенный!", "error"] call SunriseClient_gui_BottomNotification};
if !(isNull life_jail_truck) exitWith {["У вас уже есть грузовик!", "error"] call SunriseClient_gui_BottomNotification};
private _className = LIFE_SETTINGS(getText,"life_jail_truck");
private _spawnPoints = LIFE_SETTINGS(getArray,"life_jail_office");
private _spawnPoint = "";

if (EQUAL(_className,"")) exitWith {["Не задан класс автомобиля в конфиге","error"] call SunriseClient_gui_bottomNotification};
if (EQUAL(_spawnPoints,[])) exitWith {["Не задана точка спауна в конфиге","error"] call SunriseClient_gui_bottomNotification};

{
	if (nearestObjects[(getMarkerPos _x),["LandVehicle","Ship","Air"],5] isEqualTo []) exitWith {_spawnPoint = _x};
} foreach _spawnPoints;

if (_spawnPoint isEqualTo "") exitWith {["Точка выдачи техники занята!","error"] call SunriseClient_gui_bottomNotification};
if (!isNull life_jail_truck) exitWith {["У вас уже есть машина для обслуживания","error"] call SunriseClient_gui_bottomNotification};
if (alive life_jail_truck) exitWith {["У вас уже есть машина для обслуживания","error"] call SunriseClient_gui_bottomNotification};

life_jail_truck = createVehicle [_className,[0,0,999],[],0,"NONE"];
waitUntil {!isNil "life_jail_truck" && {!isNull life_jail_truck}};
life_jail_truck allowDamage false;
life_jail_truck setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
life_jail_truck setDir (markerDir _spawnPoint);
life_jail_truck setPos (getMarkerPos _spawnPoint);

player reveal life_jail_truck;
life_vehicles pushBack life_jail_truck;
[steamid,life_jail_truck,1] remoteExecCall ["SunriseServer_system_keyManagement",RSERV];

[life_jail_truck,"vehicle_info_owners",[[steamid,GVAR_RNAME(player)]]] call CBA_fnc_setVarNet;
[life_jail_truck,"vehicle_limits","jail"] call CBA_fnc_setVarNet;
[life_jail_truck,"insPrice"] call SunriseClient_system_clearGlobalVar;

[life_jail_truck] call SunriseClient_system_vehSetupRadio;
[life_jail_truck] call SunriseClient_system_clearVehicleAmmo;

life_jail_truck lock 2;
life_jail_truck disableTIEquipment true;
life_jail_truck enableRopeAttach false;
life_jail_truck allowDamage true;

["Автомобиль выдан!", "done"] call SunriseClient_gui_BottomNotification;