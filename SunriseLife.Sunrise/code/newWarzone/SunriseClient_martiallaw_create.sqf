/*

	Filename: 	SunriseClient_martiallaw_create.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

if ((sunrise_warZone select 2) isEqualTo 0) then {
	hint "Ошибка! Радиус военного положения не может быть равен нулю!";
} else {
	deleteMarkerLocal life_warzone_markerNameLocal;
	deleteMarkerLocal life_warzone_markerName2Local;
	///			[икс,								игрек]									радус 					название маркера для людей
	[((sunrise_warZone select 0) select 0),((sunrise_warZone select 0) select 1),(sunrise_warZone select 2),(sunrise_warZone select 1),player] remoteExecCall ["SunriseServer_system_addWarPoint",RSERV];	
	[false] call SunriseClient_martiallaw_mapControl;
};