/*

	Filename: 	SunriseClient_dlv_price.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_from","",[""]],
	["_to","",[""]],
	["_vehicle",objNull,[objNull]]
];

if (EQUAL(_from,"") OR EQUAL(_to,"") OR EQUAL(_vehicle,objNull)) exitWith {0};

private _distance = _vehicle distance (call compile _to);
private _price = (LIFE_SETTINGS(getNumber,"life_dlv_price") * _distance);

if (IS_VIP) then {_price = _price call SunriseClient_system_increase};

round _price