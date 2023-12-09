/*

	Filename: 	SunriseClient_effects_Regen.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
LIFE_HANDLE_REGEN = [{
	if (damage player isEqualTo 0 AND perk_metabolism isEqualTo 0) exitWith {[_this#1] call CBA_fnc_removePerFrameHandler;LIFE_HANDLE_REGEN = -1};
	player setDamage (damage player - perk_metabolism);
},60] call CBA_fnc_addPerFrameHandler;