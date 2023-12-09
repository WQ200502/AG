/*
	
	Filename: 	SunriseClient_system_clothingMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _shop = param [3,"",[""]];
if !(isClass(missionConfigFile >> "LifeCfgClothShops" >> _shop)) exitWith {};
if (server_restartSoon) exitWith {["Надвигается буря. Все магазины закрыты.","error"] call SunriseClient_gui_bottomNotification};

private _conditions = M_CONFIG(getText,"LifeCfgClothShops",_shop,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {
	hint format ["%1",M_CONFIG(getText,"LifeCfgClothShops",_shop,"conditionsMessage")];
};
[_shop,player] remoteExecCall ["SunriseServer_system_clothingShopOpen",RSERV];
