/*

	Filename: 	SunriseClient_system_setTag.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
[] call SunriseClient_system_tagConfig;

{
	if ([getText(_x >> "conditions")] call SunriseClient_system_conditionsCheck) exitWith {life_myTagID = configName _x};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgTags"));

if (EQUAL(life_myTagID,"")) then {	
	[player,"realname",profileName] call CBA_fnc_setVarNet;
} else {
	[player,"realname",format["[%1] %2",M_CONFIG(getText,"LifeCfgTags",life_myTagID,"title"),profileName]] call CBA_fnc_setVarNet;
};