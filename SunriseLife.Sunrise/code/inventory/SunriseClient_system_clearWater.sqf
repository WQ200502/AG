/*
	
	Filename: 	SunriseClient_system_clearWater.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_clearComponent","_itemsOld","_newItem","_progressName","_progressDone","_sleep","_sourcesArray","_source","_error","_sound","_doAction","_progress_rscLayer"];
_clearComponent = param [0,"",[""]];

if (life_action_inUse OR (call SunriseClient_system_isInterrupted)) exitWith {};

_error = false;
_doAction = false;

switch(true) do {
	case (_clearComponent == "srl_Waterpure"): {
		switch(true) do {
			case ("srl_canteen_dirty" in (magazines player)): {				
				_progressName = "Очищаем фляжку с грязной водой";
				_progressDone = "Вы очистили воду во фляжке.";
				_sleep = 2;
				_itemsOld = [_clearComponent,"srl_canteen_dirty"];
				_newItem = "srl_canteen_clean_3";
				_doAction = true;
				_sound = "action_painkiller_0";
			};
			case ("srl_bottle_dirty" in (magazines player)): {
				["srl_Waterpure","srl_bottle_dirty"] spawn SunriseClient_system_clearWater;
				_progressName = "Очищаем бутылку с грязной водой";
				_progressDone = "Вы очистили воду в бутылке.";
				_sleep = 2;
				_itemsOld = [_clearComponent,"srl_bottle_dirty"];
				_newItem = "srl_bottleclean_100";
				_doAction = true;
				_sound = "action_painkiller_0";
			};
			default {hint "У вас нет грязной воды для очистки"};
		}; 
	};
};

if (!_doAction) exitWith {};
if (!(player canAdd _newItem)) exitWith {["Инвентарь переполнен","error"] call SunriseClient_gui_bottomNotification};

[_progressName,_sleep,_sound,"FT_Act_Craft_Thing",false] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
if (NOTINVEH(player)) then {player PlayActionNow "FT_Act_Gesture_Reset";};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

{	
	if !([_x] call SunriseClient_system_removeItem) exitWith {_error = true};
} forEach _itemsOld;

if (_error) exitWith {titleText["В инвентаре нет необходимых предметов","PLAIN"];};
[_newItem] call SunriseClient_system_addItem;
titleText[_progressDone,"PLAIN"];
[] call SunriseClient_fast_hudWeaponUpdate;