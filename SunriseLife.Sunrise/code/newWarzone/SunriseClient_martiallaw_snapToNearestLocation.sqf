/*

	Filename: 	SunriseClient_martiallaw_snapToNearestLocation.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
	Description:
	Snap world coordinates to the nearest marker or location within snap threshold.
	Location classes are "NameCity", "NameLocal", "NameVillage", "Hill".
	
	Parameter(s):
	_this <ARRAY>
		`--- select 0 <CONTROL> - map control
		`--- select 1 <ARRAY> - position world coordinates
*/
#include "..\..\script_macros.hpp"
private["_map_ctrl","_click_pos"];
params [
	["_map_ctrl", controlNull, [controlNull]],
	["_click_pos", [], [[]], [2]]
];

// ////////////////////////////////////////////////////////////////////////////////

private["_return","_return_value","_distance_screen"];
_return = false;
_return_value = [];

// ////////////////////////////////////////////////////////////////////////////////
// Прилипаем к ближайшему маркеру, если экранное расстояние до него не превышает
// порога life_warzone_snapScreenThreshold
private["_snap_threshold_screen","_nearest_marker","_distance_screen","_temp"];
_snap_threshold_screen = life_warzone_snapScreenThreshold;
_return = false;
_temp = [];
while {true} do
{
	_nearest_marker = [allMapMarkers,_click_pos] call BIS_fnc_nearestPosition;
	// Берутся в расчет только видимые маркеры с текстом 
	if (((count (toArray (markerText _nearest_marker)))>0) && ((markerAlpha _nearest_marker)>0)) exitWith
	{
		_distance_screen = (_map_ctrl ctrlMapWorldToScreen _click_pos) distance (_map_ctrl ctrlMapWorldToScreen (getMarkerPos _nearest_marker));
		//hint format ["Marker: %1. Text: %2. Alpha: %3. Distance screen: %4", _nearest_marker, markerText _nearest_marker, markerAlpha _nearest_marker, _distance_screen];
		if (_distance_screen <= _snap_threshold_screen) then
		{
			_return = true;
			_return_value = [(getMarkerPos _nearest_marker) select 0, (getMarkerPos _nearest_marker) select 1];
			sunrise_warZone set [0, _return_value];
			if (["STR_",(markerText _nearest_marker)] call BIS_fnc_inString) then {sunrise_warZone set [1, localize (markerText _nearest_marker)]} else {sunrise_warZone set [1, markerText _nearest_marker]};
		};
	};
	// невидимые маркеры или маркеры без текста временно перемещаются
	// в точку [-100,-100]
	_temp pushBack [_nearest_marker, getMarkerPos _nearest_marker];
	_nearest_marker setMarkerPosLocal [-100,-100];
};
// невидимые маркеры возвращаются на исходные позиции
{ (_x select 0) setMarkerPosLocal (_x select 1); } forEach _temp;
if (_return) exitWith { _return_value };

// ////////////////////////////////////////////////////////////////////////////////
// Проверяем ближайшие локации и прилипаем к той, экранное расстояние к которой
// минимально
private["_nearest_location","_radius","_distance","_min_distance_screen"];
_min_distance = 99999; // заведомо большое
_return_value = [];
{
	_nearest_location = nearestLocation [_click_pos,_x select 0];
	// идут в расчет только локации с названиями
	if ((count (toArray (text _nearest_location))) > 0) then
	{
		_radius = ((size _nearest_location) select 0) max ((size _nearest_location) select 1);
		_distance = _click_pos distance _nearest_location;
		// идут в расчет только локации, в радиусе которых произошел клик
		if (_distance <= _radius) exitWith
		{
			if (_distance < _min_distance) then
			{
				_return_value = [(getPos _nearest_location) select 0, (getPos _nearest_location) select 1];
				_return = true;
				sunrise_warZone set [0, _return_value];
				sunrise_warZone set [1, format ["%1 %2", _x select 1, text _nearest_location]];
			};
		};
	};
} forEach [["NameCity","Город"],["NameVillage","Деревня"],["Hill","Холм"],["NameLocal","Местность"]];

if (_return) exitWith {	_return_value };

// ////////////////////////////////////////////////////////////////////////////////
// Если поблизости нет совсем ничего, то берем координаты центра квадрата
private["_map_grid_size","_pos_x","_pos_y"];
_map_grid_size = 100;

_pos_x = (_click_pos select 0) - ((_click_pos select 0) mod _map_grid_size) + (_map_grid_size/2);
_pos_y = (_click_pos select 1) - ((_click_pos select 1) mod _map_grid_size) + (_map_grid_size/2);

_gps_pos = [[_pos_x,_pos_y]] call SunriseClient_martiallaw_posToGPS;
sunrise_warZone set [0, [_pos_x,_pos_y]];
sunrise_warZone set [1, format ["Квадрат %1-%2", _gps_pos select 0, _gps_pos select 1]];

[_pos_x,_pos_y];