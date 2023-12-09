/*

	Filename: 	SunriseClient_dmg_dieInAgony.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];

["all"] call SunriseClient_removeBuff;
_unit setDamage 1;