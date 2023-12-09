/*

	Filename: 	SunriseClient_system_titleConfig.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgTitles" >> life_myTitleID)) exitWith {
	life_myTitleID = "default";
};

if !([M_CONFIG(getText,"LifeCfgTitles",life_myTitleID,"conditions")] call SunriseClient_system_conditionsCheck) exitWith {
	life_myTitleID = "default";
};