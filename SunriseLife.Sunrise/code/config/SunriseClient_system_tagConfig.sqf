/*

	Filename: 	SunriseClient_system_tagConfig.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgTags" >> life_myTagID)) exitWith {
	life_myTagID = "";
};

private _conditions = M_CONFIG(getText,"LifeCfgTags",life_myTagID,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {
	life_myTagID = "";
};