/*

	Filename: 	SunriseClient_system_getHousePos.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _house = param [0,objNull,[objNull,[]]];
private _return = [];

private _pos = switch (true) do { 
	case (_house isEqualType objNull) : {
		getPosATL _house;
	}; 
	case (_house isEqualType []) : {
		_house;
	}; 
	default {[]}; 
};

if (EQUAL(_pos,[])) exitWith {[]};

[round(_pos select 0),round(_pos select 1),0]