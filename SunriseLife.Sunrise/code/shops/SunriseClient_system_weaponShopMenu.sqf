/*

	Filename: 	SunriseClient_system_weaponShopMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (server_restartSoon) exitWith {["Надвигается буря. Все магазины закрыты.","error"] call SunriseClient_gui_bottomNotification};
private _shop = _this select 3;
if !(isClass(missionConfigFile >> "LifeCfgWeaponShops" >> _shop)) exitWith {};

private _conditions = M_CONFIG(getText,"LifeCfgWeaponShops",_shop,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {hint M_CONFIG(getText,"LifeCfgWeaponShops",_shop,"conditionMessage")};

[_shop,player] remoteExecCall ["SunriseServer_system_weaponShopOpen",RSERV];
