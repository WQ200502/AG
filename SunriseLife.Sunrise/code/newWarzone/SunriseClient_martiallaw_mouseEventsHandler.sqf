/*

	Filename: 	SunriseClient_martiallaw_mouseEventsHandler.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
	Description:
	Handle mouse events on the map.
	
	Parameter(s):
	_this select 0 <ARRAY> - mouse event parameters, passed as is
		`--- select 0 <CONTROL> - map control
		`--- select 1 <INTEGER> - passed button
		`--- select 2 <FLOAT> - "x" coordinate
		`--- select 3 <FLOAT> - "y" coordinate
		`--- select 4 <BOOLEAN> - "shift" state
		`--- select 5 <BOOLEAN> - "control" state
		`--- select 6 <BOOLEAN> - "alt" state
	_this select 1 <STRING> - mouse event name without "on" prefix
*/
#include "..\..\script_macros.hpp"
private["_event_data","_map_ctrl","_event_button","_event_x","_event_y","_event_shift","_event_control","_event_alt","_event_name","_eh_mouse_moving_id","_marker_name"];
params [
	["_event_data", [], [[]], [7]],
	["_event_name", "", [""]]
];

if (count _event_data == 0) exitWith {};
if (_event_name == "") exitWith {};

_event_data params [
	["_map_ctrl", controlNull, [controlNull]],
	["_event_button", -1, [0]],
	["_event_x", -1, [0]],
	["_event_y", -1, [0]],
	["_event_shift", false, [false]],
	["_event_control", false, [false]],
	["_event_alt", false, [false]]
];

_marker_name = life_warzone_markerName;
_marker_name_2 = life_warzone_markerName2;
_radius_marker = life_warzone_markerNameRadius;

private _inZone = false;

if !(server_warzones isEqualTo []) then {
	_inZone = false;
	{
		_marker = format["war_zone_%1",_x select 0];
		_marker_pos_tmp = markerPos _marker;
		_click_pos_world = _map_ctrl ctrlMapScreenToWorld [_event_x,_event_y];
		_distance_tmp = [_marker_pos_tmp select 0, _marker_pos_tmp select 1] distance _click_pos_world;
		if (_distance_tmp <= (_x select 1)) exitWith {_inZone = true; marker_countLocal = (_x select 0); marker_IndexLocal = _forEachIndex;};
	} forEach server_warzones;
};

////////////////////////////////////////////////////////////////////

switch _event_name do
{
	case "mouseButtonDown":
	{
		switch _event_button do
		{
			case 0:
			{
				if (_inZone) then
				{
					[true,true] call SunriseClient_martiallaw_mapControl;
					[] call SunriseClient_martiallaw_deleteMarker;
				}
				else
				{
					private["_marker_pos"];
					if ((markerShape _marker_name)=="") then
					{
						[_map_ctrl,_event_x,_event_y] call SunriseClient_martiallaw_createMarker;
					}
					else
					{
						private["_distance","_click_pos_world"];
						_marker_pos = markerPos _marker_name;
						_click_pos_world = _map_ctrl ctrlMapScreenToWorld [_event_x,_event_y];
						_distance = [_marker_pos select 0, _marker_pos select 1] distance _click_pos_world;
						if (_distance <= ((getMarkerSize _marker_name) select 0)) then
						{
							[false] call SunriseClient_martiallaw_mapControl;
							_map_ctrl ctrlSetEventHandler ["mouseMoving","_this call SunriseClient_martiallaw_setRadius"];
						}
						else
						{
							[] call SunriseClient_martiallaw_deleteMarker;
							[_map_ctrl,_event_x,_event_y] call SunriseClient_martiallaw_createMarker;						
						};
					};
				};
			};
			case 1:
			{
				if (_event_control) then
				{
					if (_inZone) then
					{
						[true,true] call SunriseClient_martiallaw_mapControl;
						[] call SunriseClient_martiallaw_deleteMarker;
					}
					else
					{
						// delete marker if ctrl+RMB inside it
						private["_radius","_marker_pos","_click_distance","_click_world_coords"];
						_radius = (getMarkerSize _marker_name) select 0;
						_marker_pos = [(getMarkerPos _marker_name) select 0, (getMarkerPos _marker_name) select 1];
						_click_world_coords = _map_ctrl ctrlMapScreenToWorld [_event_x,_event_y];
						_click_distance = _marker_pos distance _click_world_coords;
						if (_click_distance < _radius) then
						{
							[] call SunriseClient_martiallaw_deleteMarker;
						};
					};
				};
			};
		};
	};
	case "mouseButtonUp":
	{
		if (_event_button == 0) then
		{
			_map_ctrl ctrlRemoveAllEventHandlers "mouseMoving";
			deleteMarkerLocal _radius_marker;
			[true,_inZone] call SunriseClient_martiallaw_mapControl;
		};
	};
};