/*

	Filename: 	SunriseClient_map_gps.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_display", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
if !(_ctrl AND _shift) exitWith {};
if !(isNull life_gps_agent) exitWith {["Маршрут все еще строится, ждите","error"] call SunriseClient_gui_bottomNotification};

{deleteMarkerLocal _x} forEach life_gps_markers;
life_gps_markers = [];
if (_button isEqualTo 1) exitWith {};

private _pos = _display ctrlMapScreenToWorld [_xPos,_yPos];
if (surfaceIsWater _pos) exitWith {};
//lol_totalDistance = 0;
life_gps_agent = calculatePath ["wheeled_APC","CARELESS",getPos player,_pos];
life_gps_agent addEventHandler ["PathCalculated",{ 
	deleteVehicle (_this#0);
	private _path = _this#1;
	{
		if (_forEachIndex % 3 isEqualTo 0) then {
			_mrk = createMarkerLocal ["gps_m" + str _forEachIndex, _x];
			_mrk setMarkerColorLocal "colorBLUFOR";
			_mrk setMarkerTypeLocal "mil_dot_noShadow"; 
			_mrk setMarkerSizeLocal [1.75, 0.75];
			_next = _path select (_forEachIndex + 1);
			_mrk setMarkerDirLocal (_x getDir _next) + 90;
			//if !(isNil {_path select (_forEachIndex + 1)}) then {lol_totalDistance = lol_totalDistance + (_x distance _next)};
			life_gps_markers pushBack _mrk;
		};
	} forEach _path;
}];
[{isNull life_gps_agent}, {["Маршрут построен!","done"] call SunriseClient_gui_bottomNotification}, nil, 7.5, {deleteVehicle life_gps_agent; ["Не удалось построить маршрут, попробуте заново","error"] call SunriseClient_gui_bottomNotification}] call CBA_fnc_waitUntilAndExecute;