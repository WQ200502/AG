/*
	
	Filename: 	SunriseClient_system_groupMarkers.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _markers = [];
private _units = [];
private _markers_dead = [];
private _dead = [];

private _color =  switch(true) do {
	case (life_copDuty): {"ColorBLUFOR"};
	case (life_medDuty): {"ColorOPFOR"};
	default {"ColorCivilian"};
};
uiSleep 0.5;
if (visibleMap) then {
	if (life_mapFirstTimeOpen) then {
		mapAnimAdd [0, 0.2, player];
		mapAnimCommit;
		life_mapFirstTimeOpen = false;
	};
	_units = units(grpPlayer);
	
	private ["_marker","_unit"];
	{
		if (!(_x GVAR ["isBlind",false]) && (GVAR_RNAME(_x) != "")) then {
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal _color;
			_marker setMarkerSizeLocal [1,1.25];
			_marker setMarkerTypeLocal "mil_triangle";
			_marker setMarkerTextLocal format["%1", GVAR_RNAME(_x)];
		
			_markers pushBack [_marker,_x];
		};
	} foreach _units;

	//private _medicsOnline = {_x != player && {_x in units life_medGroup} && {alive _x}} count playableUnits > 0;
	private _medicsOnline = (playableUnits - [player]) findIf {_x in units life_medGroup && {alive _x}} > -1;
	if (!_medicsOnline AND life_copDuty) then {	
		{
			if ((GVAR_RNAME(_x) != "") && (alive _x) && (LSINCAP(_x)) && (_x GVAR ["medicStatus",-1] >= 0)) then {
				_dead pushBack _x;
			};
		} foreach playableUnits;
		
		private ["_marker","_unit"];
		{
			_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "loc_Hospital";
			_marker setMarkerTextLocal format["%1",GVAR_RNAME(_x)];
			_markers_dead pushBack [_marker,_x];
		} foreach _dead;
	};
	
	while {visibleMap} do {
		{		
			_marker = _x select 0;
			_unit = _x select 1;
			if (!isNil "_unit") then {
				if (!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
					_marker setMarkerDirLocal (getDir _unit);
				};
			};
		} foreach _markers;
		if (!visibleMap) exitWith {};
		uiSleep 1;
	};

	{deleteMarkerLocal (_x select 0)} foreach _markers;
	{deleteMarkerLocal (_x select 0)} foreach _markers_dead;
	_markers_dead = [];
	_dead = [];
	_markers = [];
	_units = [];
};