/*

	Filename: 	SunriseClient_system_removeBuff.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _type = param [0,"",[""]];
if (EQUAL(_type,"")) exitWith {};

switch (_type) do {
	case "debuffs": {
		life_bleeding = false;
		life_pain_shock = false;
		life_critHit = false;
	}; 
	case "buffs": {
		life_speed_buff = false;
		life_radx_used = false;
		life_turbo_used = false;
	};
	case "all": {
		life_bleeding = false;
		life_pain_shock = false;
		life_critHit = false;
		life_speed_buff = false;
		life_radx_used = false;
		life_turbo_used = false;
	};
	default {
		SVAR_MNS [_type,false];
	};
};