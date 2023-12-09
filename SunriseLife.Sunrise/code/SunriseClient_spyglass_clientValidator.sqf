/*

	Filename: 	SunriseClient_spyglass_clientValidator.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/

#include "..\script_macros.hpp"
{
	if (!isNil {GVAR_MNS _x}) exitWith {endMission "SpyGlass"};
} foreach ["sell_array","buy_array","life_action_gathering","life_drink"];
