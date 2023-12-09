/*

	Filename: 	SunriseClient_system_getPrisonKey.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
if ((count units life_copGroup) < (LIFE_SETTINGS(getNumber,"life_cop_min"))) exitWith {
	hint format[localize "STR_NOTF_PrisonKeyCops",(LIFE_SETTINGS(getNumber,"life_cop_min"))];
};

if (!life_prisonkey) then {
	life_prisonkey = true;
	titleText[localize "STR_NOTF_PrisonKeyGet","PLAIN"];
};