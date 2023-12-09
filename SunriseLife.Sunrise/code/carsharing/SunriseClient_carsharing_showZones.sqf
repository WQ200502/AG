/*

	Filename: 	SunriseClient_carsharing_showZones.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"

if (life_cs_locsCache isEqualTo []) then {life_cs_locsCache = nearestLocations [player, ["NameCity","NameVillage", "NameCityCapital"], 25000]};

{
	_mrk = createMarkerLocal [format["loc_%1",_forEachIndex],getPos _x]; 
	_mrk setMarkerShapeLocal "ELLIPSE";
	_mrk setMarkerColorLocal "ColorGreen";
	_mrk setMarkerAlphaLocal 0.5;
	_mrk setMarkerSizeLocal [1000, 1000];
} forEach life_cs_locsCache;