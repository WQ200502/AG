/*

	Filename: 	SunriseClient_system_WeaponAssembled.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_unit","_object"];
if (EQUAL((typeof _object),"sab_CUAV_UAV_Orange")) exitWith {};

_object disableTIEquipment true;