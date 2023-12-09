/*

	Filename: 	SunriseClient_martiallaw_setRadius.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	

	Description:
	Handle mouse events on the map.
	
	Parameter(s):
	_this <ARRAY> - mouse event parameters, passed as is
	`--- select 0 <CONTROL> - map control
	`--- select 1 <FLOAT> - "x" cursor coordinate relative to control
	`--- select 2 <FLOAT> - "x" cursor coordinate relative to control
*/
#include "..\..\script_macros.hpp"
private["_map_ctrl","_cursor_x","_cursor_y","_wz","_wz_pos","_cursor_world_pos","_radius",
"_radius_min","_radius_max","_radius_marker"];
params [
	["_map_ctrl", controlNull, [controlNull]],
	["_cursor_x", -1, [0]],
	["_cursor_y", -1, [0]]
];

_cursor_pos = _map_ctrl ctrlMapScreenToWorld [_cursor_x,_cursor_y];

_wz = life_warzone_markerName;
_wz_pos = getMarkerPos _wz;

_radius_min = life_warzone_minRadius;
_radius_max = life_warzone_maxRadius;
_radius_step = life_warzone_radiusStep;

_radius_marker = life_warzone_markerNameRadius;
if (markerType _radius_marker == "") then
{
	createMarkerLocal [_radius_marker, _cursor_pos];
	_radius_marker setMarkerTypeLocal "selector_selectable";
	_radius_marker setMarkerColorLocal "ColorWhite";
	_radius_marker setMarkerTextLocal (str _radius_min);
}
else
{
	_radius_marker setMarkerPosLocal (_map_ctrl ctrlMapScreenToWorld [_cursor_x,_cursor_y]);
};

_cursor_world_pos = _map_ctrl ctrlMapScreenToWorld [_cursor_x,_cursor_y];

// //////////////////////////////////////////////////////////////////////

_radius = _radius_step * round ((_wz_pos distance _cursor_world_pos)/_radius_step);
if (_radius <= _radius_min) then
{
	_radius = _radius_min;
}
else
{
	if (_radius > _radius_max) then
	{
		_radius = _radius_max;
	};
};

if (((getMarkerSize _wz) select 0) != _radius) then
{
	_wz setMarkerSizeLocal [_radius,_radius];
	_radius_marker setMarkerTextLocal (str _radius);
};

// radius indicator position
private["_d_x","_d_y","_angle","_r_x","_r_y"];
_angle = ((_cursor_pos select 1) - (_wz_pos select 1)) atan2 ((_cursor_pos select 0) - (_wz_pos select 0));
_r_x = _radius * (cos _angle);
_r_y = _radius * (sin _angle);
_radius_marker setMarkerPosLocal [((_wz_pos select 0) + _r_x), ((_wz_pos select 1) + _r_y)];

sunrise_warZone set [2, _radius];

true;
