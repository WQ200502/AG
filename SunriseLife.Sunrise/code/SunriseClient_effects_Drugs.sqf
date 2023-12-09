/*

	Filename: 	SunriseClient_effects_Drugs.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private["_dynamicBlurMax","_chromAberrationMax","_time", "_sleep","_shake"];
if (life_drug_hard) then {
	_time = 30; 
	_sleep = 600 + random(600);
	_dynamicBlurMax = 0.4;
	_chromAberrationMax = 0.25;
	_shake=10
} else {
	_time = 10;
	_sleep = 1200 + random(600);
	_dynamicBlurMax = 0.2;
	_chromAberrationMax = 0.15;
	_shake=5
};
LIFE_HANDLE_DRUGS = [{
	if ((!life_drug_light AND !life_drug_hard) OR life_speed_buff OR life_turbo_used) exitWith {[_this#1] call CBA_fnc_removePerFrameHandler;LIFE_HANDLE_DRUGS = -1};
	(_this#0) params ["_time","_dynamicBlurMax","_chromAberrationMax","_shake"];
	LIFE_PPE_DRUGS_DB = ppEffectCreate ["dynamicBlur", 2005];
	LIFE_PPE_DRUGS_DB ppEffectEnable true;
	LIFE_PPE_DRUGS_CA = ppEffectCreate ["chromAberration", 2006];  
	LIFE_PPE_DRUGS_CA ppEffectEnable true;
	player say3D "cough";

	for "_i" from 1 to _time do {
		[{
			if (life_speed_buff OR life_turbo_used) exitWith {};
			params ["_dynamicBlurMax","_chromAberrationMax","_shake"];
			LIFE_PPE_DRUGS_DB ppEffectAdjust[random _dynamicBlurMax];
			LIFE_PPE_DRUGS_DB ppEffectCommit 1;
			LIFE_PPE_DRUGS_CA ppEffectAdjust[random _chromAberrationMax,random _chromAberrationMax,false];
			LIFE_PPE_DRUGS_CA ppEffectCommit 1;
			addcamShake[random _shake, 1, random _shake];
		},[_dynamicBlurMax,_chromAberrationMax,_shake],_i] call CBA_fnc_waitAndExecute;
	};
	[{
		player say3D "cough";
		LIFE_PPE_DRUGS_DB ppEffectAdjust[0];
		LIFE_PPE_DRUGS_DB ppEffectCommit 5;
		LIFE_PPE_DRUGS_CA ppEffectAdjust[0,0,false];  
		LIFE_PPE_DRUGS_CA ppEffectCommit 5;
	},nil,_time + 1] call CBA_fnc_waitAndExecute;
	[{
		ppEffectDestroy [LIFE_PPE_DRUGS_DB,LIFE_PPE_DRUGS_CA];
		enableCamShake false;
	},nil,_time + 6] call CBA_fnc_waitAndExecute;
},_sleep,[_time,_dynamicBlurMax,_chromAberrationMax,_shake]] call CBA_fnc_addPerFrameHandler;