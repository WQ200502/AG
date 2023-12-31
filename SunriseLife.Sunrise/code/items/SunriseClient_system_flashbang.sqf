/*

	Filename: 	SunriseClient_system_flashbang.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_pos","_eyeDir","_pPos","_impactPos","_norm","_angle","_blurEffect","_ppEffect"];
_pos = param [0,[],[[]]];
if (EQUAL(_pos,[])) exitWith {}; //Badddd
if (player distance _pos > 25) exitWith {}; //Bad again.
if (life_inDeadZone) exitWith {};

_pos set[2,(_pos select 2)+0.2];
if (lineIntersects [eyePos player, ATLtoASL _pos,player]) exitWith {};

_eyeDir = eyeDirection player;
_pPos = getPosATL player;
_impactPos = [(_pos select 0)-(_pPos select 0),(_pos select 1)-(_pPos select 1),(_pos select 2)-(_pPos select 2)];
_norm = sqrt((_impactPos select 0)^2+(_impactPos select 1)^2+(_impactPos select 2)^2);
_angle = aCos ((_eyeDir select 0)*((_impactPos select 0) / _norm)+((_impactPos select 1) / _norm)*(_eyeDir select 1)+((_impactPos select 2) / _norm)*(_eyeDir select 2));

playSound "flashbang";
_blurEffect = ppEffectCreate ["DynamicBlur",500];
_blurEffect ppEffectForceInNVG true;
_blurEffect ppEffectEnable true;

if (_angle < 90) then {
	//Create white-screen
	_ppEffect = ppEffectCreate ["ColorCorrections",2500];
	_ppEffect ppEffectAdjust [1, 1, -0.01, [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]];
	_ppEffect ppEffectCommit 0.1;
	_ppEffect ppEffectEnable true;
	_ppEffect ppEffectForceInNVG true;
	_blurEffect ppEffectAdjust [3];
	_blurEffect ppEffectCommit 0.2;
	23 fadeSound 0.1;
	uiSleep 13;
	
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
} else {
	_blurEffect ppEffectAdjust [2.1];
	_blurEffect ppEffectCommit 0.1;
	15 fadeSound 0.25;
	uiSleep 15;
	_blurEffect ppEffectAdjust [0];
	_blurEffect ppEffectCommit 10;
	uiSleep 5;
	15 fadeSound 1;
	uiSleep 5;
	_blurEffect ppEffectEnable false;
	ppEffectDestroy _blurEffect;
};