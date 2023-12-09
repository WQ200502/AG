/*

	Filename: 	SunriseClient_system_campFire.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];

if (life_action_inUse OR (call SunriseClient_system_isInterrupted)) exitWith {};
private _camps = nearestObjects[getPosATL player,["Campfire_burning_F"],30];
if (count _camps > 0) exitWith {["В радиусе 30 метров уже есть костер. Воспользуйтесь им.", "error"] call SunriseClient_gui_BottomNotification;};

private _progressName = "Создаем костер";
private _progressDone = "Костер готов";
private _sleep = 15;
private _sound = "action_crafting_0";

[_progressName,_sleep,_sound,"FT_Act_Craft_Thing",false,{}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
player PlayActionNow "FT_Act_Gesture_Reset";
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if !([_item] call SunriseClient_system_removeItem) exitWith {["В инвентаре нет необходимых предметов", "error"] call SunriseClient_gui_BottomNotification;};

createVehicle ["Campfire_burning_F",getPosATL player,[],0,"FORM"];

[_progressDone,"done"] call SunriseClient_gui_BottomNotification;
[] call SunriseClient_fast_hudWeaponUpdate;
