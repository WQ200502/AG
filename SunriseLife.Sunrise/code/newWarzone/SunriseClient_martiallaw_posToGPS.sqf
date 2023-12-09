/*

	Filename: 	SunriseClient_martiallaw_posToGPS.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _pos = param [0, [], [[]], [2,3]];
_pos params ["_pos_x","_pos_y"];

// ///////////////////////////////////////////////////////////////

private _map_grid_size = 100;

_pos_x = str (((_pos_x - (_pos_x mod _map_grid_size)))/_map_grid_size);
_pos_y = str (((_pos_y - (_pos_y mod _map_grid_size)))/_map_grid_size);

while { (count (toArray _pos_x)) < 3 } do
{
	_pos_x = "0" + _pos_x;
};

while { (count (toArray _pos_y)) < 3 } do
{
	_pos_y = "0" + _pos_y;
};

[_pos_x,_pos_y]