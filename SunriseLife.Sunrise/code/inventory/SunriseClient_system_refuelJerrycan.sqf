/*
	
	Filename: 	SunriseClient_system_refuelJerrycan.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _oldItem = param [0,"",[""]];
if (life_action_inUse OR (call SunriseClient_system_isInterrupted)) exitWith {};

private _doAction = false;

private["_newItem","_progressName","_progressDone","_sleep","_sound"];
if (([cursorObject] call SunriseClient_system_getModelName) in ["fuelstation_feed_f","metalbarrel_f","flexibletank_01_f","fs_feed_f","fuelstation_01_pump_f","fuelstation_02_pump_f"]) then {
	_progressName = "Пополняем канистру";
	_progressDone = "Вы пополнили канистру.";
	_sleep = 15;	
	_newItem = "srl_Fuelcan";
	_doAction = true;
	_sound = "action_refuel";
} else {
	hint "Вы должны быть рядом с заправкой";
};

if (!_doAction) exitWith {};

[_progressName,_sleep,_sound,"",true,{}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

if !([_oldItem] call SunriseClient_system_removeItem) exitWith {["Не удалось удалить предмет","error"] call SunriseClient_gui_bottomNotification};
if !([_newItem] call SunriseClient_system_addItem) exitWith {["Не удалось добавить предмет","error"] call SunriseClient_gui_bottomNotification};

titleText[_progressDone,"PLAIN"];
[] call SunriseClient_fast_hudWeaponUpdate;