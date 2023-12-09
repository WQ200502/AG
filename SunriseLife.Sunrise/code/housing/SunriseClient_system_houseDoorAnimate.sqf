/*
	
	Filename: 	SunriseClient_system_houseDoorAnimate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_house",ObjNull,[ObjNull]],
	["_door",0,[0]],
	["_state",0,[0]]
];

switch (_state) do { 
	case 0 : {
		//close
		if ((_house GVAR [format["bis_disabled_Door_%1",_door],0]) isEqualTo 0) then {
			[_house, format ["Door_%1_rot",_door]] call BIS_fnc_DoorNoHandleClose;
		} else {
			hint "Дверь заперта";
		};
	}; 
	case 1 : {
		//open
		if ((_house GVAR [format["bis_disabled_Door_%1",_door],0]) isEqualTo 0) then {
			[_house, format ["Door_%1_rot",_door]] call BIS_fnc_DoorNoHandleOpen;
		} else {
			hint "Дверь заперта";
		};
	}; 
	default {};
};