/*

	Filename: 	SunriseClient_system_refuelVehicleMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_target", "_caller", "_actionId", "_id"];
if (life_action_inUse) exitWith {[localize "STR_NOTF_Action","error"] call SunriseClient_gui_bottomNotification};
if !(NOTINVEH(player)) exitWith {["У вас недостаточно длинные руки, чтобы заправляться прямо из машины.","error"] call SunriseClient_gui_bottomNotification};
if ((gas_array # _id # 0) < 1) exitWith {["На заправке кончилось топливо","error"] call SunriseClient_gui_bottomNotification};

private _nearVehicles = nearestObjects[_target,["LandVehicle","Air","Ship"],25];
if (EQUAL(_nearVehicles,[])) exitWith {["Поблизости нет техники. Подъедьте поближе!","error"] call SunriseClient_gui_bottomNotification};

disableSerialization;
if !(createDialog "SunriseDialogVehicleSelect") exitWith {};

private _control = (findDisplay 58000) displayCtrl 5802;
private _button = (findDisplay 58000) displayCtrl 5804;
_button ctrlSetText "Начать заправку";
_button buttonSetAction format ["[call compile lbData[5802,lbCurSel (5802)],%1] spawn SunriseClient_system_refuelVehicle",_id];
lbclear _control;
{	
	_var = format["lb_car_%1",_forEachIndex];
	_control lbAdd format["%1 (#%2)",getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),_x getVariable ["dbInfo",["",""]] select 1];
	_control lbSetData [(lbSize _control)-1,_var];
	_control lbSetPicture [(lbSize _control)-1,getText(configFile >> "CfgVehicles" >> typeOf _x >> "picture")];
	missionNamespace setVariable [_var,_x];					
} foreach _nearVehicles;
_control lbSetCurSel 0;