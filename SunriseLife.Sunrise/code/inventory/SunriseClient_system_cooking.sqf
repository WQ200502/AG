/*
	
	Filename: 	SunriseClient_system_cooking.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _oldItem = param [0,"",[""]];
if !(NOTINVEH(player)) exitWith {};
if (life_action_inUse) exitWith {};

call SunriseClient_actions_inUse;
private _error = false;

private ["_newItem","_progressName","_progressDone","_sleep","_sound"];
switch(true) do {
	case (_oldItem in ["srl_canteen_salt","srl_bottle_salt"]): {
		_progressName = "Кипятим морскую воду на костре";
		_progressDone = "Вы прокипятили морскую воду.";	
		_sleep = 15;			
		_newItem = switch (_oldItem) do {
			case "srl_canteen_salt": {"srl_canteen_clean_3"};
			case "srl_bottle_salt": {"srl_bottleclean_100"};
		};		
		_sound = "action_cooking_fire_0";
	};

	case (_oldItem == "srl_Meat"): {
		_progressName = "Жарим мясо на костре";
		_progressDone = "Вы приготовили мясо на костре.";
		_sleep = 15;		
		_newItem = "srl_MeatC";
		_sound = "action_cooking_fire_0";
	};
};
[_progressName,_sleep,_sound,"FT_Act_Craft_Thing",false] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
player PlayActionNow "FT_Act_Gesture_Reset";
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

if !([_oldItem] call SunriseClient_system_removeItem) exitWith {["Не удалось удалить предмет","error"] call SunriseClient_gui_bottomNotification};
if !([_newItem] call SunriseClient_system_addItem) exitWith {["Не удалось добавить предмет","error"] call SunriseClient_gui_bottomNotification};

titleText[_progressDone,"PLAIN"];
[] call SunriseClient_fast_hudWeaponUpdate;