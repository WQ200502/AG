/*
	
	Filename: 	SunriseClient_system_keyDrop.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _vehicles_list = CONTROL(7200,7213);

private _vehicles_list_selection = lbCurSel _vehicles_list;
if (_vehicles_list_selection isEqualTo -1) exitWith {["Вы не ничего не выбрали","error"] call SunriseClient_gui_bottomNotification};
private _index = _vehicles_list lbData _vehicles_list_selection;
if (_index isEqualTo "") exitWith {["Невозможно выбросить эти ключи","error"] call SunriseClient_gui_bottomNotification};

private _vehicle = life_vehicles select parseNumber(_index);
if (_vehicle isKindOf "House_F") exitWith {["Вы не можете выбросить ключи от дома","error"] call SunriseClient_gui_bottomNotification};
//if !(_vehicle getVariable ["vehicle_limits",""] isEqualTo "") exitWith {["Ключи от этого трансопрта нельзя выбрасывать","error"] call SunriseClient_gui_bottomNotification};

private _owners = _vehicle GVAR ["vehicle_info_owners",""];
private _owners_index = [steamid,_owners] call SunriseClient_system_index;
_owners deleteAt _owners_index;

life_vehicles = life_vehicles - [_vehicle];
_vehicle SVAR ["vehicle_info_owners",_owners,true];

[format["Вы выбросили ключи от %1",FETCH_CONFIG2(getText,"CfgVehicles",typeOf _vehicle, "displayName")],"done"] call SunriseClient_gui_bottomNotification;
[] spawn SunriseClient_pad_openStatus;