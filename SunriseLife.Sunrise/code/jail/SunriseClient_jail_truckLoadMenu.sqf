/*
	
	Filename: 	SunriseClient_jail_truckLoadMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _object = param [0,ObjNull,[ObjNull]];
private _nearVehicles = nearestObjects[_object,["LandVehicle"],35];
if (EQUAL(_nearVehicles,[])) exitWith {["Поблизости нет техники. Подъедьте поближе!","error"] call SunriseClient_gui_bottomNotification};

disableSerialization;
if !(createDialog "SunriseDialogVehicleSelect") exitWith {};

_control = (findDisplay 58000) displayCtrl 5802;
_button = (findDisplay 58000) displayCtrl 5804;
_button ctrlSetText "Начать погрузку";
_button buttonSetAction format ["[call compile lbData[5802,lbCurSel (5802)],%1] spawn SunriseClient_jail_loadTruck",_object];
lbclear _control;
{	
	if (_x in life_vehicles) then {
		_var = format["lb_car_%1",_forEachIndex];
		_control lbAdd format["%1 (%2 м.)",getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),_x distance player];
		_control lbSetData [(lbSize _control)-1,_var];
		_control lbSetPicture [(lbSize _control)-1,getText(configFile >> "CfgVehicles" >> typeOf _x >> "picture")];
		missionNamespace setVariable [_var,_x];		
	};					
} foreach _nearVehicles;
_control lbSetCurSel 0;