/*

	Filename: 	SunriseClient_system_vehicleServiceConfirm.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _total = 0;
private _box = CONTROL_VALUE(8403);
private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf life_service_vehicle,"price");

if (lbCurSel 8401 > 0 OR lbCurSel 8402 > 0) then {_total = _total + (_basePrice * LIFE_SETTINGS(getNumber,"life_servicePrice"))};
if (lbCurSel 8403 > 0) then {_total = _total + (_basePrice * LIFE_SETTINGS(getNumber,"life_boxPrice") * _box)};
if (life_service_updateNitro) then {_total = _total + (_basePrice * LIFE_SETTINGS(getNumber,"life_nitroPrice"))};
if (FETCH_CONST(life_donator) > 0) then {_total = [_total] call SunriseClient_system_discount};
if (_total isEqualTo 0) exitWith {["Вы ничего не выбрали","error"] call SunriseClient_gui_bottomNotification};

private _action = [
	format["Обслуживание вашего автомобиля будет вам стоить $%1. Деньги будут списаны с банковского счета. Вы уверены?",[_total] call SunriseClient_system_numberText],
	"Тюнинг-сервис",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call SunriseClient_gui_guiMessage;

if (_action) then {
	if (BANK < _total) exitWith {["У вас недостаточно денег на банковском счете","error"] call SunriseClient_gui_bottomNotification};
	["atm","take",_total] call SunriseClient_system_myCash;
	
	private _color = CONTROL_DATA(8401);
	private _material = CONTROL_DATA(8402);
	private _custom_color = format["#(rgb,8,8,3)color(%1,%2,%3,1,co)",sliderPosition CONTROL(8400,8404),sliderPosition CONTROL(8400,8405),sliderPosition CONTROL(8400,8406)];
	
	if (lbCurSel 8401 > 0) then {[life_service_vehicle,_color,true,_custom_color] call SunriseClient_system_colorVehicle};
	if (lbCurSel 8402 > 0) then {[life_service_vehicle,_material] call SunriseClient_system_materialVehicle};
	if (lbCurSel 8403 > 0) then {[life_service_vehicle,"adacBoxes",_box] call CBA_fnc_setVarNet};
	if (life_service_updateNitro) then {
		if (life_service_nitro) then {
			[life_service_vehicle,"adacNitroUsed",0] call CBA_fnc_setVarNet
		} else {
			[life_service_vehicle,"adacNitroUsed",nil] call CBA_fnc_setVarNet
		};
	};

	[life_service_vehicle getVariable ["dbInfo",[-1,""]] select 0,(lbCurSel 8401 > 0),_color,_custom_color,(lbCurSel 8402 > 0),_material,(lbCurSel 8403 > 0),_box,life_service_updateNitro,life_service_nitro] remoteExecCall ["SunriseServer_system_vehicleServiceSave",2];
	["Вы успешно установили тюнинг!","done"] call SunriseClient_gui_bottomNotification;
	closeDialog 0;
} else {
	["Вы отказались от обслуживания","error"] call SunriseClient_gui_bottomNotification;
};