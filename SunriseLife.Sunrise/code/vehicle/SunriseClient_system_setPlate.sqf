/*

	Filename: 	SunriseClient_system_setPlate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {};

if (local _vehicle) then {
	if (isNil {_vehicle GVAR "Life_VEH_Plate"}) then {
		private _dbInfo = _vehicle GVAR ["dbInfo",[]];
		private _plate = if (count _dbInfo > 0) then {(_dbInfo select 1) splitString ""} else {["R","E","N","T","I","N","G"]};
		_vehicle SVAR ["Life_VEH_Plate",_plate,true];
	};
};

private _vehPlate = _vehicle GVAR ["Life_VEH_Plate",[]];
if (EQUAL(_vehPlate,[])) exitWith {};

private ["_platePath","_plateIndexArray"];
switch (true) do {
	case (["d3s_", (typeOf _vehicle)] call SunriseClient_system_xString): {
		_platePath = "\d3s_cars_core\license";
		_plateIndexArray = [20,21,22,23,24,25,26];
	};
	case (["ivory_", (typeOf _vehicle)] call SunriseClient_system_xString): {
		_platePath = "\ivory_data\license";
		_plateIndexArray = [4,5,6,7,8,9,10];
	};
	case (["Sunrise_", (typeOf _vehicle)] call SunriseClient_system_xString): {
		_platePath = "\Sunrise_Cars\license";
		_plateIndexArray = [2,3,4,5,6,7,8];
	};
	case (["Quiet", (typeOf _vehicle)] call SunriseClient_system_xString OR ["quiet", (typeOf _vehicle)] call SunriseClient_system_xString): {
		_platePath = "\MrShounka_Car_Rework_Pack\MrShounka_Base\MrShounka_Plaque\MrShounka_Plaque_alphabet";
		_plateIndexArray = [6,7,8,9,10,11,12];
	};
	case (["Mrshounka", (typeOf _vehicle)] call SunriseClient_system_xString OR ["Mrshouka", (typeOf _vehicle)] call SunriseClient_system_xString OR ["MrShounka", (typeOf _vehicle)] call SunriseClient_system_xString OR ["mrshounka", (typeOf _vehicle)] call SunriseClient_system_xString): {
		_platePath = "\MrShounka_Car_Rework_Pack\MrShounka_Base\MrShounka_Plaque\MrShounka_Plaque_alphabet";
		_plateIndexArray = [6,7,8,9,10,11,12];
	};
 
	default {_platePath = "";_plateIndexArray = []}; 
};

if (EQUAL(_platePath,"") OR EQUAL(_plateIndexArray,[])) exitWith {};

{
	_vehicle setObjectTextureGlobal [_x, format ["%1\%2.paa",_platePath,_vehPlate select _forEachIndex]];
} forEach _plateIndexArray;