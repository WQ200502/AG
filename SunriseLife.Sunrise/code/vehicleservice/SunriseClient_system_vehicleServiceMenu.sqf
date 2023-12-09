/*
	
	Filename: 	SunriseClient_system_vehicleServiceMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	this addAction["Тюнинг-сервис",SunriseClient_system_vehicleServiceMenu,nil,3,true,true,"","",10];
*/
#include "..\..\script_macros.hpp"
private _object = param [0,ObjNull,[ObjNull]];
private _nearVehicles = nearestObjects[_object,["LandVehicle","Air","Ship"],20];
if (EQUAL(_nearVehicles,[])) exitWith {["Поблизости нет техники. Подъедьте поближе!","error"] call SunriseClient_gui_bottomNotification};

disableSerialization;
if !(createDialog "SunriseDialogVehicleSelect") exitWith {};

private _control = (findDisplay 58000) displayCtrl 5802;
private _button = (findDisplay 58000) displayCtrl 5804;
_button ctrlSetText "Открыть каталог";
_button buttonSetAction "[call compile lbData[5802,lbCurSel (5802)]] spawn SunriseClient_system_vehicleServiceMenuOpen;closeDialog 0;";
lbclear _control;
{	
	if (_x in life_vehicles) then {
		_var = format["lb_car_%1",_forEachIndex];
		_control lbAdd format["%1 (#%2)",getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName"),_x getVariable ["dbInfo",["",""]] select 1];
		_control lbSetData [(lbSize _control)-1,_var];
		_control lbSetPicture [(lbSize _control)-1,getText(configFile >> "CfgVehicles" >> typeOf _x >> "picture")];
		missionNamespace setVariable [_var,_x];		
	};					
} foreach _nearVehicles;
_control lbSetCurSel 0;