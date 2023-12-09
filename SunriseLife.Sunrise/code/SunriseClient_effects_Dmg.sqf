/*

	Filename: 	SunriseClient_effects_Dmg.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
life_heartbeatTime = 0;

LIFE_HANDLE_DMG = [{
	if !(damage player > 0.25 && LSALIVE(player)) exitWith {
		if !(EQUAL(LIFE_PPE_DAMAGE05,-1)) then {
			LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
			LIFE_PPE_DAMAGE05 ppEffectCommit 5;
			LIFE_PPE_DAMAGE05 = -1;
		};
		[_this#1] call CBA_fnc_removePerFrameHandler;
		LIFE_HANDLE_DMG = -1;
	};
	if ((time - life_heartbeatTime) > 60) then {
		player say3D "heartbeat";
		life_heartbeatTime = time;
	};
	if (damage player > 0.5) then {	
		if (EQUAL(LIFE_PPE_DAMAGE05,-1)) then {
			LIFE_PPE_DAMAGE05 = ppEffectCreate ["colorCorrections", 2009];
			LIFE_PPE_DAMAGE05 ppEffectEnable true;
			LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1.04, -0.004, [0.5, 0.5, 0.5, 0.0], [0.5, 0.5, 0.5, 0.0],  [0.5, 0.5, 0.5, 0.0]]; 
			LIFE_PPE_DAMAGE05 ppEffectCommit 5;
		};
	} else {
		if !(EQUAL(LIFE_PPE_DAMAGE05,-1)) then {
			LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
			LIFE_PPE_DAMAGE05 ppEffectCommit 5;
			LIFE_PPE_DAMAGE05 = -1;
		};
	};
},5] call CBA_fnc_addPerFrameHandler;