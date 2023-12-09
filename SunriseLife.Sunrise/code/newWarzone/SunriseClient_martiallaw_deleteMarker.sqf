/*

	Filename: 	SunriseClient_martiallaw_deleteMarker.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_marker_name","_marker_name_2","_radius_marker"];
_marker_name = life_warzone_markerName;
_marker_name_2 = life_warzone_markerName2;
_radius_marker = life_warzone_markerNameRadius;

// /////////////////////////////////////////////////////////


	deleteMarkerLocal _marker_name;
	deleteMarkerLocal _marker_name_2;
	deleteMarkerLocal _radius_marker;

sunrise_warZone = [[0,0],"",0,false];

[false] call SunriseClient_martiallaw_mapControl;