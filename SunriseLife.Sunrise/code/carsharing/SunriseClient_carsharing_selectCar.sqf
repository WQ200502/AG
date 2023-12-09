/*

	Filename:	SunriseClient_carsharing_selectCar.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
if !(life_cs_lastSelected isEqualTo "") then {_nearestMarker setMarkerColorLocal "ColorOrange";};
private _click_pos_world = _control ctrlMapScreenToWorld [_xPos,_yPos];
private _nearestMarker = [["0_cs","1_cs","2_cs","3_cs","4_cs","5_cs","6_cs","7_cs","8_cs","9_cs"], _click_pos_world] call BIS_fnc_nearestPosition;
_nearestMarker setMarkerColorLocal "ColorGreen";
if !(life_cs_lastSelected isEqualTo _nearestMarker) then {life_cs_lastSelected setMarkerColorLocal "ColorOrange";};
life_cs_lastSelected = _nearestMarker;
life_cs_posSelected = getMarkerPos _nearestMarker;