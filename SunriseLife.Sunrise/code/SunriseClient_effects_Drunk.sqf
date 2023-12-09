/*

	Filename: 	SunriseClient_effects_Drunk.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
LIFE_PPE_DRUNK = ppEffectCreate ["radialBlur", 2012];
LIFE_PPE_DRUNK ppEffectEnable true;
LIFE_HANDLE_DRUNK = [{
	if !(life_drink > 0) exitWith {
		LIFE_PPE_DRUNK ppEffectAdjust [0,0,0,0];
		LIFE_PPE_DRUNK ppEffectCommit 5;
		LIFE_PPE_DRUNK = -1;
		life_drink = 0;
		[_this#1] call CBA_fnc_removePerFrameHandler;
		LIFE_HANDLE_DRUNK = -1;
	};
	LIFE_PPE_DRUNK ppEffectAdjust[0.075, 0,0.35,0.37];
	LIFE_PPE_DRUNK ppEffectCommit 2;
	life_drink = life_drink - 0.02;
},200] call CBA_fnc_addPerFrameHandler;