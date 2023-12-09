/*

	Filename: 	SunriseClient_archeology_nearestPoint.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _curZone = "";
{	
	if ([player, (_x select 0)] call CBA_fnc_getDistance < ((getMarkerSize (_x select 0)) select 0)) exitWith {_curZone = _x select 0};
} forEach life_arc_currentZones;

if (EQUAL(_curZone,"")) exitWith {call SunriseClient_archeology_clearZone};

if !(EQUAL(life_arc_currentZone,_curZone)) then {
	life_arc_currentZone = _curZone;
	life_arc_currentPoint = [_curZone] call CBA_fnc_randPosArea;
	format["Archeology - Current Point: %1",life_arc_currentPoint] call SunriseClient_system_log; //точка где и лежит сам КЛАД		
};