/*

	Filename: 	SunriseClient_system_copsForIllegal.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _ret = round((count playableUnits - (count units life_copGroup + count units life_medGroup)) * 0.065);
if (_ret < LIFE_SETTINGS(getNumber,"life_cop_min_illegal")) then {_ret = LIFE_SETTINGS(getNumber,"life_cop_min_illegal")};
_ret;