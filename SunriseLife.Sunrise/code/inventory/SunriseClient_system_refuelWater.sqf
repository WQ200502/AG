/*
	
	Filename: 	SunriseClient_system_refuelWater.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
private _oldItem = param [0,"",[""]];
if (life_action_inUse) exitWith {};
if !(NOTINVEH(player)) exitWith {};

private ["_newItem","_progressName","_progressDone","_doAction"];
//соленая вода из морей и т.п.
switch (true) do { 
	case (([cursorObject] call SunriseClient_system_getModelName) in ["water_source_f","watertank_01_f","watertank_02_f"]) : {
		_progressName = "Набираем чистую воду";
		_progressDone = "Вы набрали чистой воды.";
		_newItem = switch (_oldItem) do {
			case "srl_canteen_empty": {"srl_canteen_clean_3"};
			case "srl_bottle_empty": {"srl_bottleclean_100"};
		};
		_doAction = true;
	}; 
	case (([cursorObject] call SunriseClient_system_getModelName) in ["barrelwater_f","barrelwater_grey_f","waterbarrel_f","watertank_f","stallwater_f","waterpump_01_f"]) : {
		_progressName = "Набираем грязную воду";
		_progressDone = "Вы набрали грязной воды.";			
		_newItem = switch (_oldItem) do {
			case "srl_canteen_empty": {"srl_canteen_dirty"};
			case "srl_bottle_empty": {"srl_bottle_dirty"};
		};
		_doAction = true;
	};
	case (surfaceIsWater (getPosATL player)): {
		_progressName = "Набираем морскую воду";
		_progressDone = "Вы набрали морской воды.";	
		_newItem = switch (_oldItem) do {
			case "srl_canteen_empty": {"srl_canteen_salt"};
			case "srl_bottle_empty": {"srl_bottle_salt"};
		};
		_doAction = true;
	};
	default {_doAction = false}; 
};

if (!_doAction) exitWith {hint "Рядом нет источников воды";life_action_inUse = false;life_interrupted = false;};

[_progressName,10,"action_fillwater","FT_Act_Craft_Thing"] call SunriseClient_system_progressBar;
player PlayActionNow "FT_Act_Gesture_Reset";
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

if !([_oldItem] call SunriseClient_system_removeItem) exitWith {["Не удалось удалить предмет","error"] call SunriseClient_gui_bottomNotification};
if !([_newItem] call SunriseClient_system_addItem) exitWith {["Не удалось добавить предмет","error"] call SunriseClient_gui_bottomNotification};

titleText[_progressDone,"PLAIN"];
[] call SunriseClient_fast_hudWeaponUpdate;