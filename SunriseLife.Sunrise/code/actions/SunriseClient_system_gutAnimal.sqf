/*
	
	Filename: 	SunriseClient_system_gutAnimal.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _animalCorpse = param [0,ObjNull,[ObjNull]];
if (isNull _animalCorpse) exitWith {};
if !((typeOf _animalCorpse) in ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Hen_random_F","Cock_random_F","Goat_random_F","Sheep_random_F","Rabbit_F","Turtle_F"]) exitWith {};
if (player distance _animalCorpse > 5) exitWith {};
if ((["srl_knife"] call SunriseClient_system_itemCount) isEqualTo 0) exitWith {["error","",format[localize "STR_NOTF_KnifeNeed"]] call SunriseClient_message};

private _item = switch (typeOf _animalCorpse) do {
	case "Hen_random_F": {"meat"};
	case "Cock_random_F": {"meat"};
	case "Goat_random_F": {"meat"};
	case "Sheep_random_F": {"meat"};
		
	case "Salema_F": {"fish_meat"};
	case "Ornate_random_F" : {"fish_meat"};
	case "Mackerel_F" : {"fish_meat"};
	case "Tuna_F" : {"fish_meat"};
	case "Mullet_F" : {"fish_meat"};
	case "CatShark_F" : {"fish_meat"};

	case "Turtle_F": {"turtle"};
	
	default {""};
};

if (EQUAL(_item,"")) exitWith {};
if (EQUAL(_item,"turtle") && player distance getMarkerPos "turtle_1" > 350 AND !life_turtle_pass) exitWith {["error","","Охотиться на черепах можно только с пропуском и в черепашьей гавани!"] call SunriseClient_message};
if (EQUAL(_item,"meat") && !life_hunting_pass) exitWith {["error","","Для охоты в этих местах нужен пропуск, купите его!"] call SunriseClient_message};
private _time = 30;
if (IS_VIP) then {_time = _time call SunriseClient_system_timeDiscount};
	
[localize "STR_NOTF_CutCorpse",_time,"","",true,{isNull _animalCorpse}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};
if (isNull _animalCorpse) exitWith {["error","",format["Животное пропало"],true] call SunriseClient_message};
if (time - (missionNamespace getVariable ["life_job_startTime",-1800]) > 1800) then {life_job_startTime = time;};

private _count = switch (FETCH_CONST(life_donator)) do {
	case 0: {2};
	case 1: {2};
	case 2: {2};
	case 3: {3};
	case 4: {4};
};

if ([true,_item,_count] call SunriseClient_system_handleInv) then {
	deleteVehicle _animalCorpse;
	["done","",format[localize "STR_NOTF_CutCorpseDone"]] call SunriseClient_message;
} else {
	["error","",format[localize "STR_NOTF_InvFull"]] call SunriseClient_message;
};
