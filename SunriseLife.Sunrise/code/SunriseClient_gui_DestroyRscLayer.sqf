/*

	Filename: 	SunriseClient_gui_DestroyRscLayer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _resource = param [0,"",[""]];

(_resource call BIS_fnc_rscLayer) cutText ["","PLAIN"];