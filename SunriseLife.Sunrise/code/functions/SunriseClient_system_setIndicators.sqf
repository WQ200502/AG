/*
	
	Filename: 	SunriseClient_system_setIndicators.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _indicators = param [0,[],[[]]];
if (EQUAL(_indicators,[])) exitWith {};

{
	_x params ["_var","_val"];
	
	switch (_var) do {
		case "life_hunger": {
			if (_val < 20) then {_val = 20};
		};
		case "life_thirst": {
			if (_val < 20) then {_val = 20};
		};
		case "life_myIdentity": {
			if (EQUAL(FETCH_CONST(life_donator),0)) then {_val = ""};
		};
		case "life_myPassportID": {
			if !(_val isEqualType "") then {_val = ""};
		};
		case "life_death_endtime": {
			if (EQUAL(_val,0)) then {
				life_death_markers = [];
			};
		};
	};
	
	SVAR_MNS [_var,_val];
} foreach _indicators;