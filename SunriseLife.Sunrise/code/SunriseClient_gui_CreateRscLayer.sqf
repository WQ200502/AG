/*

	Filename: 	SunriseClient_gui_CreateRscLayer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_resource","",[""]],
	["_type","PLAIN",[""]],
	["_speed",0,[0]],
	["_showOnMap",false,[false]]
];

if ([_resource] call SunriseClient_gui_HasDisplay) then {
	[_resource] call SunriseClient_gui_DestroyRscLayer;
};

(_resource call BIS_fnc_rscLayer) cutRsc [_resource,_type,_speed,_showOnMap];