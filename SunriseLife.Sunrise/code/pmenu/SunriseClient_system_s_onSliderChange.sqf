/*

	Filename: 	SunriseClient_system_s_onSliderChange.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_mode",-1,[0]],
	["_value",-1,[0]]
];
if (EQUAL(_mode,-1) OR EQUAL(_value,-1)) exitWith {};

disableSerialization;

switch (_mode) do {
	case 0: {
		life_viewDistanceFoot = round(_value);
		ctrlSetText[2902,format["%1",round(_value)]];
		[] call SunriseClient_system_updateViewDistance;
		SVAR_PRNS ["life_viewDistanceFoot",round(_value)];
	};
	
	case 1: {
		life_viewDistanceCar = round(_value);
		ctrlSetText[2912,format["%1",round(_value)]];
		[] call SunriseClient_system_updateViewDistance;
		SVAR_PRNS ["life_viewDistanceCar",round(_value)];
	};
	
	case 2: {
		life_viewDistanceAir = round(_value);
		ctrlSetText[2922,format["%1",round(_value)]];
		[] call SunriseClient_system_updateViewDistance;
		SVAR_PRNS ["life_viewDistanceAir",round(_value)];
	};
};