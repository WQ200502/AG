/*
	
	Filename: 	SunriseClient_system_vehicleShopMenu.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	Steam:		Sunrise Team
	Web:		

*/
#include "..\..\script_macros.hpp"
if (server_restartSoon) exitWith {["Надвигается буря. Все магазины закрыты.","error"] call SunriseClient_gui_bottomNotification};
private _shop = (_this select 3) select 0;

if !(isClass(missionConfigFile >> "LifeCfgVehShops" >> _shop)) exitWith {};

private _conditions = M_CONFIG(getText,"LifeCfgVehShops",_shop,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {
	hint format ["%1",M_CONFIG(getText,"LifeCfgVehShops",_shop,"conditionsMessage")];
};

[_this select 3,player] remoteExecCall ["SunriseServer_system_vehicleShopOpen",RSERV];
