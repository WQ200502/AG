/*

	Filename: 	SunriseClient_adac_InitUpgrades.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_vehicle",Objnull,[Objnull]],
	["_config",[],[[]]]
];

if (EQUAL(_config,[])) exitWith {};
_config params [
	["_boxes",0,[0]],
	["_nitro",false,[false]]
];
if (_boxes > 0) then {[_vehicle,"adacBoxes",_boxes] call CBA_fnc_setVarNet};
if (_nitro) then {[_vehicle,"adacNitroUsed",0] call CBA_fnc_setVarNet};
