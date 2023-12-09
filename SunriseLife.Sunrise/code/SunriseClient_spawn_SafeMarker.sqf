/*

	Filename: 	SunriseClient_spawn_SafeMarker.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _side = param [0,civilian,[civilian]];


_ret = switch (worldName) do {
	case "Sunrise": {
		switch (_side) do {
			case civilian : {getMarkerPos "spawn_kavala"}; //атира
			case independent : {getMarkerPos "reb_city_spawn_1"}; //юго-восток
			case west : {getMarkerPos "cop_spawn_1"}; //кавала
			case east : {getMarkerPos "medic_spawn_2"}; //кавала
			default {getMarkerPos "emergency_spawn"};
		};

	};
	case "Tanoa": {
		switch (_side) do {
			case civilian : {getMarkerPos "civ_spawn_3"}; //Ла-Рошель
			case independent : {getMarkerPos "reb_spawn_3"}; //каткоула
			case west : {getMarkerPos "cop_spawn_1"}; //джордж-таун
			case east : {getMarkerPos "medic_spawn_1"}; //джордж-таун
			default {getMarkerPos "emergency_spawn"};
		};
	};
	default {getMarkerPos "emergency_spawn"};
};

_ret