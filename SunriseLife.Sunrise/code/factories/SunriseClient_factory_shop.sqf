/*
	
	Filename: 	SunriseClient_factory_shop.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_fact_type", "", [""]],
	["_vehicle", objNull, [objNull]]
];
if !(isClass(missionConfigFile >> "LifeCfgFactories" >> _fact_type)) exitWith {};
life_fact_type = _fact_type;
life_fact_vehicle = _vehicle;

createDialog "SunriseDialogFactoryShop";
[] call SunriseClient_factory_update;