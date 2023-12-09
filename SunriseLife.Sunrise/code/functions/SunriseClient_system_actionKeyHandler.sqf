/*

	Filename: 	SunriseClient_system_actionKeyHandler.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _curTarget = param [0,objNull,[objNull]];
if (life_action_inUse) exitWith {};
if (life_interrupted) exitWith {life_interrupted = false};
if (dialog) exitWith {};
if !(NOTINVEH(player)) exitWith {};
if (isNull _curTarget) exitWith {};
if (EQUAL(_curTarget,player)) exitWith {};

switch (true) do {
	case (["atm_",([_curTarget] call SunriseClient_system_getModelName)] call SunriseClient_system_xString && {_curTarget distance player < 3}) : {
		if (DCASH > 0) then {
			[] call SunriseClient_atm_legalization;
		} else {
			[] call SunriseClient_atm_openMenu;
		};
	}; 
	case (_curTarget isKindOf "House_F") : {
		[_curTarget] call SunriseClient_system_initHouseMenu;
	};
	case (_curTarget isKindOf "CAManBase" && {player distance _curTarget < 5} && {isPlayer _curTarget} && {LSINCAP(_curTarget)}): {
		[_curTarget] spawn SunriseClient_system_agonyInteractionMenu;
	};
	case (_curTarget isKindOf "CAManBase" && {player distance _curTarget < 5} && {isPlayer _curTarget} && {alive _curTarget}): {
		if (GVAR_RESTRAINED(_curTarget)) then {
			switch(true) do {
				case (life_copDuty): {[_curTarget] spawn SunriseClient_system_copInteractionMenu};
				case (life_medDuty): {[_curTarget] spawn SunriseClient_system_medInteractionMenu};
				default {[_curTarget] spawn SunriseClient_system_civInteractionMenu};
			};
		} else {		
			[_curTarget] spawn SunriseClient_system_freeInteractionMenu;
		};
	};
	case (!alive _curTarget && {_curTarget isKindOf "Animal"} && {(typeOf _curTarget) in ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Turtle_F"]}): {
		[_curTarget] spawn SunriseClient_system_gutAnimal;
	};
	case ([_curTarget] call SunriseClient_system_isVehicleKind && {player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2}): {
		if (EQUAL((typeOf _curTarget),"ExtremoHospitalBed")) then {
			//управление больничной койкой
			[_curTarget] spawn SunriseClient_system_hbInteractionMenu;
		} else {
			[_curTarget] spawn SunriseClient_system_vInteractionMenu;
		};
	};
	case (EQUAL((typeOf _curTarget),"Land_av_Gate_gang") && {player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2}): {
		[_curTarget] spawn SunriseClient_system_gateInteractionMenu;
	};
	default {}; 
};