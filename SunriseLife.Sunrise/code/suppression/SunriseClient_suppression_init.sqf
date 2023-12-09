/*

	Filename: 	SunriseClient_suppression_init.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
// Color Correction
life_suppr_cc = ppEffectCreate ["colorCorrections", 1501];
life_suppr_cc ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
life_suppr_cc ppEffectEnable true;
life_suppr_cc ppEffectCommit 0;

// Blur
life_suppr_blur = ppEffectCreate ["DynamicBlur", 800];
life_suppr_blur ppEffectAdjust [0];
life_suppr_blur ppEffectCommit 0.3;
life_suppr_blur ppEffectEnable true;

// RBlur
life_suppr_rBlur = ppEffectCreate ["RadialBlur", 1003];
life_suppr_rBlur ppEffectAdjust [0, 0, 0, 0];
life_suppr_rBlur ppEffectCommit 0;
life_suppr_rBlur ppEffectEnable true;


life_suppr_impactCC = ppEffectCreate ["colorCorrections", 1499];
life_suppr_impactCC ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1],[1,1,1,0]];
life_suppr_impactCC ppEffectEnable true;
life_suppr_impactCC ppEffectCommit 0;

life_suppr_impactBlur = ppEffectCreate ["RadialBlur", 1002];
life_suppr_impactBlur ppEffectAdjust [0, 0, 0, 0];
life_suppr_impactBlur ppEffectCommit 0;
life_suppr_impactBlur ppEffectEnable true;

// Check if active, exec script if so
[SunriseClient_suppression_mainHandler] call CBA_fnc_addPerFrameHandler;
[SunriseClient_suppression_main, 1] call CBA_fnc_addPerFrameHandler;
[SunriseClient_suppression_pinnedDown, 0.5] call CBA_fnc_addPerFrameHandler;