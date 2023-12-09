/*
	
	Filename: 	SunriseClient_system_onReloaded.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
if (perk_accuracy isEqualTo 1) then {perk_accuracy = 0.01};
if (random 1 < perk_accuracy) then {
	/*player removeWeapon _weapon;
	["error","",format["У вас сломалось оружие! Аккрутанее надо быть!"]] call SunriseClient_message;
	player say3d "weapon_break";*/

	_blurEffect = ppEffectCreate ["DynamicBlur",500];
	_blurEffect ppEffectForceInNVG true;
	_blurEffect ppEffectEnable true;
	_ppEffect = ppEffectCreate ["ColorCorrections",2500];
	_ppEffect ppEffectAdjust [1, 1, -0.01, [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]];
	_ppEffect ppEffectCommit 0.1;
	_ppEffect ppEffectEnable true;
	_ppEffect ppEffectForceInNVG true;
	_blurEffect ppEffectAdjust [3];
	_blurEffect ppEffectCommit 0.2;
	23 fadeSound 0.1;
	uiSleep 7;
	
	_ppEffect ppEffectAdjust [1, 1, -0.02, [4.5, 3.5, 1.6, -0.02],[1.8, 1.6, 1.6, 1],[-1.5,0,-0.2,1]];
	_ppEffect ppEffectCommit 10;
	uiSleep 5;
	15 fadeSound 1;
	uiSleep 5;
	_ppEffect ppEffectEnable false;
	ppEffectDestroy _ppEffect;
	
	_blurEffect ppEffectAdjust [0];
	_blurEffect ppEffectCommit 3;
	uiSleep 3;
	_blurEffect ppEffectEnable false;
	ppEffectDestroy _blurEffect;

	if ((damage player) < 0.89) then {
		player setDamage ((damage player) + 0.4);
	} else {
		[player,player] call SunriseClient_dmg_Agony;
	};
};