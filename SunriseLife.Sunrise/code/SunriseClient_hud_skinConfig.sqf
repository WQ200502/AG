/*

	Filename: 	SunriseClient_hud_skinConfig.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgThemes" >> life_myThemeID)) then {
	life_myThemeID = "default";
};