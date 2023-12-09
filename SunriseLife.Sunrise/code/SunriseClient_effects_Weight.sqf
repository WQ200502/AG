/*

	Filename: 	SunriseClient_effects_Weight.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
life_bp = "";
LIFE_HANDLE_WEIGHT = [{
	if (EQUAL((backpack player),"")) then {
		life_maxWeight = life_maxWeightT;
		life_bp = "";
	} else {
		if !(EQUAL(life_bp,backpack player)) then {
			life_bp = backpack player;
			_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
			if (_cfg > 350) then {_cfg = 400};
			_load = round(_cfg / 8);
			life_maxWeight = life_maxWeightT + _load;
		};		
	};

	if (life_carryWeight > life_maxWeight && !isForcedWalk player) then {
		player forceWalk true;
		player setFatigue 1;
		[localize "STR_NOTF_MaxWeight", "done"] call SunriseClient_gui_BottomNotification;
	} else {
		if (isForcedWalk player) then {
			player forceWalk false;
		};
	};
},2] call CBA_fnc_addPerFrameHandler;