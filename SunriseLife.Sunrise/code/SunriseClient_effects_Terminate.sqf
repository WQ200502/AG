/*

	Filename: 	SunriseClient_effects_Terminate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
{
	if !(EQUAL(_x,-1)) then {
		ppEffectDestroy [_x];
	};
} forEach [LIFE_PPE_DAMAGE05,LIFE_PPE_DRUNK,LIFE_PPE_DRUGS_DB,LIFE_PPE_DRUGS_CA];


if !(LIFE_HANDLE_EFFECTS isEqualTo -1) then {
	[LIFE_HANDLE_EFFECTS] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_EFFECTS = -1;
};

if !(LIFE_HANDLE_DRUGS isEqualTo -1) then {
	[LIFE_HANDLE_DRUGS] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_DRUGS = -1;
};

if !(LIFE_HANDLE_TEMPVARS isEqualTo -1) then {
	[LIFE_HANDLE_TEMPVARS] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_TEMPVARS = -1;
};
if !(LIFE_HANDLE_DMG isEqualTo -1) then {
	if !(EQUAL(LIFE_PPE_DAMAGE05,-1)) then {
		LIFE_PPE_DAMAGE05 ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
		LIFE_PPE_DAMAGE05 ppEffectCommit 5;
		LIFE_PPE_DAMAGE05 = -1;
	};
	[LIFE_HANDLE_DMG] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_DMG = -1;
};

if !(LIFE_HANDLE_SICK isEqualTo -1) then {
	[LIFE_HANDLE_SICK] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_SICK = -1;
};

if !(LIFE_HANDLE_DRUNK isEqualTo -1) then {
	LIFE_PPE_DRUNK ppEffectAdjust [0,0,0,0];
	LIFE_PPE_DRUNK ppEffectCommit 5;
	LIFE_PPE_DRUNK = -1;
	life_drink = 0;
	[LIFE_HANDLE_DRUNK] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_DRUNK = -1;
};

if !(LIFE_HANDLE_FOODWATER isEqualTo -1) then {
	[LIFE_HANDLE_FOODWATER] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_FOODWATER = -1;
};

if !(LIFE_HANDLE_WEIGHT isEqualTo -1) then {
	[LIFE_HANDLE_WEIGHT] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_WEIGHT = -1;
};

if !(LIFE_HANDLE_CIRRHOSIS isEqualTo -1) then {
	[LIFE_HANDLE_CIRRHOSIS] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_CIRRHOSIS = -1;
};

if !(LIFE_HANDLE_PVP isEqualTo -1) then {
	[LIFE_HANDLE_PVP] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_PVP = -1;
};

if !(LIFE_HANDLE_WARZONES isEqualTo -1) then {
	life_inwarzone = false;
	[LIFE_HANDLE_WARZONES] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_WARZONES = -1;
};

if !(LIFE_HANDLE_TEAMSPEAK isEqualTo -1) then {
	[LIFE_HANDLE_TEAMSPEAK] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_TEAMSPEAK = -1;
};

if !(LIFE_HANDLE_REGEN isEqualTo -1) then {
	[LIFE_HANDLE_REGEN] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_REGEN = -1;
};