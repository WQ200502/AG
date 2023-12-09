/*

	Filename: 	SunriseClient_hazard_deactivateHazardZone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (!isNull LIFE_HANDLE_HAZARD) then {terminate LIFE_HANDLE_HAZARD};

if !(EQUAL(LIFE_PPE_ANOMALY_COLOR,-1)) then {
	LIFE_PPE_ANOMALY_COLOR ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
	LIFE_PPE_ANOMALY_COLOR ppEffectCommit 3;
	LIFE_PPE_ANOMALY_COLOR = -1;
};

if !(EQUAL(LIFE_PPE_ANOMALY_FILMGRAIN,-1)) then {
	LIFE_PPE_ANOMALY_FILMGRAIN ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
	LIFE_PPE_ANOMALY_FILMGRAIN ppEffectCommit 3;
	LIFE_PPE_ANOMALY_FILMGRAIN = -1;
};

if !(EQUAL(LIFE_PPE_ANOMALY_COLORINVERSION,-1)) then {
	LIFE_PPE_ANOMALY_COLORINVERSION ppEffectAdjust [0, 0, 0];
	LIFE_PPE_ANOMALY_COLORINVERSION ppEffectCommit 3;
	LIFE_PPE_ANOMALY_COLORINVERSION = -1;
};

3 fadeMusic 0;

uiSleep 3;

ppEffectDestroy LIFE_PPE_ANOMALY_COLOR;
ppEffectDestroy LIFE_PPE_ANOMALY_FILMGRAIN;
ppEffectDestroy LIFE_PPE_ANOMALY_COLORINVERSION;

playMusic ""