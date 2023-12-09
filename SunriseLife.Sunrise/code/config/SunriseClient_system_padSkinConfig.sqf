/*

	Filename: 	SunriseClient_system_padSkinConfig.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (!isClass (missionConfigFile >> "LifeCfgPadSkins" >> life_myPadSkinID)) exitWith {
	life_myPadSkinID = "default";
};

private _conditions = M_CONFIG(getText,"LifeCfgPadSkins",life_myPadSkinID,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {
	life_myPadSkinID = "default";
};