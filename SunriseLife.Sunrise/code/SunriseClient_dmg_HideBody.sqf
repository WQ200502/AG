/*

	Filename: 	SunriseClient_dmg_HideBody.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _unit = cursorObject;
if !(EQUAL(CURWEAPON,"sunrise_Tool_Shovel")) exitWith {hint "У вас должна быть лопата в руках!"};
if (isNull _unit) exitWith {};

[_progressName,10,_sound,"FT_Act_Craft_Thing",false,{player forceWeaponFire ["sunrise_Tool_Shovel", "Hack"]}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};

if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

["Захоронение прошло успешно!", "done"] call SunriseClient_gui_BottomNotification;

deleteVehicle _unit;