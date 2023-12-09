/*

	Filename: 	SunriseClient_martiallaw_createMarker.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
		Parameter(s):
	_this select 0 <CONTROL> - map control
	_this select 1 <FLOAT> - "x" click screen position
	_this select 2 <FLOAT> - "y" click screen position
*/
#include "..\..\script_macros.hpp"
private["_marker_name","_marker_name_2","_wz_min_radius","_map_ctrl","_click_x","_click_y","_marker_pos"];
_marker_name = life_warzone_markerName;
_marker_name_2 = life_warzone_markerName2;
_wz_min_radius = life_warzone_minRadius;

params [
	["_map_ctrl", controlNull, [controlNull]],
	["_click_x", 0, [0]],
	["_click_y", 0, [0]]
];

// /////////////////////////////////////////////////////////

private _click_pos_world = _map_ctrl ctrlMapScreenToWorld [_click_x,_click_y];
private _inZone = false;

if !(server_warzones isEqualTo []) then {
	_inZone = false;
	{
		_marker = format["war_zone_%1",_x select 0];
		_marker_pos_tmp = markerPos _marker;
		_distance_tmp = [_marker_pos_tmp select 0, _marker_pos_tmp select 1] distance _click_pos_world;
		if (_distance_tmp <= (_x select 1)) exitWith {_inZone = true; marker_countLocal = (_x select 0); marker_IndexLocal = _forEachIndex;};
	} forEach server_warzones;
};

if (_inZone) then {
	[true,true] call SunriseClient_martiallaw_mapControl;
} else {

	// main circle
	_marker_pos = _map_ctrl ctrlMapScreenToWorld [_click_x,_click_y];
	_marker_pos = [_map_ctrl,_marker_pos] call SunriseClient_martiallaw_snapToNearestLocation;
	
	createMarkerLocal [_marker_name, _marker_pos];
	_marker_name setMarkerShapeLocal "ELLIPSE";
	_marker_name setMarkerSizeLocal [_wz_min_radius,_wz_min_radius];
	_marker_name setMarkerColorLocal "ColorEAST";
	_marker_name setMarkerBrushLocal "Solid";
	_marker_name setMarkerAlphaLocal 0.5;
	
	// warning marker
	createMarkerLocal [_marker_name_2, _marker_pos];
	_marker_name_2 setMarkerColorLocal "ColorWhite";
	_marker_name_2 setMarkerTypeLocal "KIA";
	
	_map_ctrl ctrlSetEventHandler ["mouseMoving","_this call SunriseClient_martiallaw_setRadius"];

};
