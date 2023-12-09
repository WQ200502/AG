/*
	
	Filename: 	SunriseClient_system_insurancePayDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params[
	["_vehicle","",[""]],
	["_price",0,[0]]
];
_price = round (_price / 2);

private _displayName = getText(configFile >> "CfgVehicles" >> (_vehicle) >> "displayName");
hint format["Ваша техника (%1) попала под страховой случай!.\n\nСтраховая компания возмещает вам часть стоимости и переводит на банковский счет $%2",_displayName,[_price] call SunriseClient_system_numberText];

["atm","add",_price,"insurancePay"] call SunriseClient_system_myCash;
life_action_inUse = false;