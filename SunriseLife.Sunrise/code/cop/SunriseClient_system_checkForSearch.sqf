/*

	Filename: 	SunriseClient_system_checkForSearch.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
([_unit,"base_pd"] call CBA_fnc_getDistance < 100) OR ([_unit,"base_pd_1"] call CBA_fnc_getDistance < 100) OR ([_unit,"base_cop_jail"] call CBA_fnc_getDistance < 100);