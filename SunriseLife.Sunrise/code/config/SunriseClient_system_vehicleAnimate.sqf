/*

	Filename: 	SunriseClient_system_vehicleAnimate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_vehicle",Objnull,[Objnull]]	
];

if (isNull _vehicle) exitwith {};

private _className = typeOf _vehicle;

private "_animate";
switch (true) do {
	case (life_copDuty): {
		if (_className in ["B_UAV_02_F","B_UGV_01_F"]) then {createVehicleCrew _vehicle};
	};
	default {
		if (_className in ["I_UGV_01_F"]) then {createVehicleCrew _vehicle};
		if (EQUAL(_className,"B_Heli_Light_01_F") && !([LIFE_SETTINGS(getText,"life_benchesForCivHumm")] call SunriseClient_system_conditionsCheck)) then {_animate = "civ_littlebird"};
	};
};

if (isNil "_animate") exitWith {};

if (_animate isEqualType []) then {
	{
		_vehicle animate [_x select 0,_x select 1];
	} foreach _animate;
} else {
	switch (_animate) do {
		case "civ_littlebird": {			
			_vehicle animate ["addDoors",1];
			_vehicle animate ["addBenches",0];
			_vehicle animate ["addTread",0];
			_vehicle animate ["AddCivilian_hide",1];
			_vehicle lockCargo [2,true];
			_vehicle lockCargo [3,true];
			_vehicle lockCargo [4,true];
			_vehicle lockCargo [5,true];
		};
		default {};
	};
};