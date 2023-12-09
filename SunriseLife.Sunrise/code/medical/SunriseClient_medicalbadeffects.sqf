/*

	Filename: 	SunriseClient_medicalbadeffects.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
private _effects = param [0,"",[""]];
private _chance = param [1,0,[100]];

if (!alive player) exitWith {};
if (player getVariable ["lifeState",""] in ["RESPAWN","INCAPACITATED","DEAD"]) exitWith {};
if (_effects isEqualTo "") exitWith {};

if (random(100) < _chance) exitWith {};
switch (_effects) do {
	case "armsOnFair": {
		addCamShake [6, 0.4, 8];
	};
	case "Legs": {
		["Перелом ног","life_blood_legs",0,3] call SunriseClient_addBuff;
	};
	case "blood_120": {
		["Кровотечение","life_bleeding",120,0] call SunriseClient_addBuff;
	};
	case "blood_180": {
		["Кровотечение","life_bleeding",180,0] call SunriseClient_addBuff;
	};
	case "blood_300": {
		["Кровотечение","life_bleeding",300,0] call SunriseClient_addBuff;
	};
	case "pain_shock_180": {
		["Болевой шок","life_pain_shock",180,0] call SunriseClient_addBuff;
	};
	case "pain_shock_300": {
		["Болевой шок","life_pain_shock",300,0] call SunriseClient_addBuff;
	};
	case "blur": {
		life_warBlur_status = true;
		player say3d "action_panic_1";
		_blurEffect = ppEffectCreate ["DynamicBlur",500];
		_blurEffect ppEffectForceInNVG true;
		_blurEffect ppEffectEnable true;
		_blurEffect ppEffectAdjust [10];
		_blurEffect ppEffectCommit 0.3;
		uiSleep 10;
		_blurEffect ppEffectAdjust [0];
		_blurEffect ppEffectCommit 3;
		uiSleep 3;
		_blurEffect ppEffectEnable false;
		ppEffectDestroy _blurEffect;
		life_warBlur_status = false;
	};
};
