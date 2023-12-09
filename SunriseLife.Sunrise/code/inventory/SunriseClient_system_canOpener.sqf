/*
	
	Filename: 	SunriseClient_system_canOpener.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_newItem","_progressName","_progressDone","_sleep","_sound"];
private _oldItem = param [0,"",[""]];

if (life_action_inUse OR (call SunriseClient_system_isInterrupted)) exitWith {};
if !(EQUAL(CURWEAPON,"")) exitWith {hint "Освободите свои руки, уберите оружие за спину"};

private _doAction = false;

switch(true) do {
	case (_oldItem == "srl_TacticalBacon"): {			
		_progressName = "Открываем консерву бекона";
		_progressDone = "Вы открыли консерву.";
		_sleep = 2;		
		_newItem = "srl_TacticalBacon_100";
		_doAction = true;
		_sound = "action_can_opener";
	};

	case (_oldItem == "srl_BakedBeans"): {			
		_progressName = "Открываем тушенную фасоль";
		_progressDone = "Вы открыли тушенную фасоль.";
		_sleep = 2;		
		_newItem = "srl_BakedBeans_100";
		_doAction = true;
		_sound = "action_can_opener";
	};
};

if (!_doAction) exitWith {};
if (!(player canAdd _newItem)) exitWith {["Инвентарь переполнен","error"] call SunriseClient_gui_bottomNotification};

[_progressName,_sleep,_sound,"FT_Act_Craft_Thing",false] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
if (NOTINVEH(player)) then {player PlayActionNow "FT_Act_Gesture_Reset";};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

if !([_oldItem] call SunriseClient_system_removeItem) exitWith {["Не удалось удалить предмет","error"] call SunriseClient_gui_bottomNotification};
if !([_newItem] call SunriseClient_system_addItem) exitWith {["Не удалось добавить предмет","error"] call SunriseClient_gui_bottomNotification};

titleText[_progressDone,"PLAIN"];
[] call SunriseClient_fast_hudWeaponUpdate;