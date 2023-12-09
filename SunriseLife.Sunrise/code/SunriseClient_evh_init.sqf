/*

	Filename: 	SunriseClient_evh_init.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
player addEventHandler["Killed", {_this spawn SunriseClient_evh_onPlayerKilled}];
player addEventHandler["HandleDamage",{_this call SunriseClient_evh_damageHandle}];
player addEventHandler["Respawn", {_this call SunriseClient_evh_onPlayerRespawn}];
player addEventHandler["Take",{_this call SunriseClient_system_onTakeItem}];
player addEventHandler["Put",{_this call SunriseClient_system_onPutItem}];
player addEventHandler["Fired",{_this call SunriseClient_system_onFired}];
player addEventHandler["InventoryClosed", {_this call SunriseClient_evh_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call SunriseClient_evh_inventoryOpened}];
player addEventHandler["WeaponAssembled", {_this call SunriseClient_system_WeaponAssembled}];
//player addEventHandler["Reloaded", {_this call SunriseClient_system_onReloaded}];

["cameraView", {_this call SunriseClient_evh_cameraView}] call CBA_fnc_addPlayerEventHandler;
["vehicle", {_this call SunriseClient_evh_vehicleChange}] call CBA_fnc_addPlayerEventHandler;