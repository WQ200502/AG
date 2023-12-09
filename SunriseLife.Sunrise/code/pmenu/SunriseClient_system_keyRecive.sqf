/*

	Filename: 	SunriseClient_system_keyRecive.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
    ["_vehicle",objNull,[objNull]],
	["_unit",objNull,[objNull]],
	["_giver","",[""]]
];
if (isNull _unit OR _giver isEqualTo "") exitWith {};
if (player isEqualTo _unit && !(_vehicle in life_vehicles)) then {
	[format["%1 передал вам ключи от %2",_giver,getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")],"done"] call SunriseClient_gui_bottomNotification;
	life_vehicles pushBack _vehicle;		
	[steamid,_vehicle,1] remoteExecCall ["SunriseServer_system_keyManagement",RSERV];
};