/*
	
	Filename: 	SunriseClient_factory_vehicleLoadMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	this addAction["Начать погрузку",SunriseClient_factory_vehicleLoadMenu,"ironore",3,true,true,"","",15];
*/
#include "..\..\script_macros.hpp"
if (life_copDuty OR life_medDuty) exitWith {["error","","Вы на службе, какая работа!?"] call SunriseClient_message};

private _object = param [0,ObjNull,[ObjNull]];
private _resource = param [3,"",[""]];
private _conditions = M_CONFIG(getText,"LifeCfgFactoriesResources",_resource,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {["error","",format["%1",[M_CONFIG(getText,"LifeCfgFactoriesResources",_resource,"conditionsMessage")]]] call SunriseClient_message};

private _nearVehicles = nearestObjects[_object,["LandVehicle","Air","Ship"],50];
if (EQUAL(_nearVehicles,[])) exitWith {["error","","Поблизости нет техники. Подъедьте поближе!"] call SunriseClient_message};

disableSerialization;
if !(createDialog "SunriseDialogVehicleSelect") exitWith {};

private _control = (findDisplay 58000) displayCtrl 5802;
private _button = (findDisplay 58000) displayCtrl 5804;
_button ctrlSetText "Начать погрузку";
_button buttonSetAction format ["['%1',call compile lbData[5802,lbCurSel (5802)],%2] spawn SunriseClient_factory_vehicleLoad",_resource,_object];
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