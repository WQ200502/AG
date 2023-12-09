/*

	Filename: 	SunriseClient_carsharing_refresh.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _positions_array = [];
private _cs_refreshed = profileNamespace getVariable ["cs_refreshed",-900];
if ((time - _cs_refreshed) > 300 OR (time - _cs_refreshed) < -300 OR profileNamespace getVariable ["cs_cars",[]] isEqualTo []) then {
	profileNamespace setVariable ["cs_refreshed",time];
	private _nearestLoc = nearestLocations [player, ["NameCity","NameVillage", "NameCityCapital"], 1500] select 0;
	private _loc_distance = player distance (getpos _nearestLoc);
	private _tries = 0;
	while {count _positions_array < 10 AND _tries < 20} do {
		private _car_position = [[[getPos _nearestLoc, _loc_distance]],["water"],{isOnRoad _this AND (count(nearestObjects[_this,["LandVehicle","Ship","Air"],15]) isEqualTo 0)}] call BIS_fnc_randomPos;
		if !(_car_position isEqualTo [0,0]) then {_positions_array pushBack _car_position};
		_tries = _tries + 1;
	};
};
profileNamespace setVariable ["cs_cars",_positions_array];
{
	_markerName = format["%1_cs",_forEachIndex];
	_marker = createMarkerLocal [_markerName, _x];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal "c_car";
	_marker setMarkerColorLocal "ColorOrange";
} forEach _positions_array;