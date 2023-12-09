/*

	Filename: 	SunriseClient_martiallaw_mapControl.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
	Parameter(s):
	_this select 0 <BOOLEAN> - show or not
*/
#include "..\..\script_macros.hpp"
if (isNull (findDisplay 9701)) exitWith {};
params[
	["_show",false,[false]],
	["_wp",false,[false]]
];

_control_idc = 4002;

ctrlShow [_control_idc, _show];

if (_show) then
{
	if (_wp) then
	{
		ctrlShow [4005,false];
		ctrlShow [4006,true];
		//server_warzones [[NAME_MARKER,RADIUS_MARKER,TEXT_MARKER,NAME_PLAYER],[],[]];
		ctrlSetText [4003, format ["Название: %1", ((server_warzones select marker_IndexLocal) select 2)]];
		ctrlSetText [4004, format ["Поставил: %1", ((server_warzones select marker_IndexLocal) select 3)]];
	}
	else
	{
		ctrlShow [4005,true];
		ctrlShow [4006,false];
		ctrlSetText [4003, format ["Место: %1", sunrise_warZone select 1]];
		ctrlSetText [4004, format ["Радиус: %1", [sunrise_warZone select 2] call SunriseClient_martiallaw_formatMeters]];
	};
};