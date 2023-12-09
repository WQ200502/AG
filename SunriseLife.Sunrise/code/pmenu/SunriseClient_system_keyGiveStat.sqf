/*
	
	Filename: 	SunriseClient_system_keyGiveStat.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _vehicles_list = CONTROL(2000,7213);
private _near_vehicles = CONTROL(2000,7214);

private _vehicles_list_selection = lbCurSel _vehicles_list;
private _vehicleIndex = _vehicles_list lbData _vehicles_list_selection;
if (_vehicleIndex isEqualTo "") exitWith {["Невозможно передать эти ключи","error"] call SunriseClient_gui_bottomNotification};
private _vehicle = life_vehicles select parseNumber(_vehicleIndex);
//if !(_vehicle getVariable ["vehicle_limits",""] isEqualTo "") exitWith {["Ключи от этого трансопрта нельзя передавать","error"] call SunriseClient_gui_bottomNotification};

private _near_vehicles_selection = lbCurSel _near_vehicles;
private _unit = _near_vehicles lbData _near_vehicles_selection;
_unit = call compile format["%1", _unit];
if (isNull _unit OR isNil "_unit") exitWith {}; 

private _player_id = getPlayerUID _unit;
private _owners = _vehicle GVAR ["vehicle_info_owners",[]];
private _index = [_player_id,_owners] call SunriseClient_system_index;
if (_index isEqualTo -1) then {
	_owners pushBack [_player_id,GVAR_RNAME(_unit)];
	_vehicle SVAR ["vehicle_info_owners",_owners,true];
};

[format["Вы передали %1 ключи от %2",GVAR_RNAME(_unit),typeOf _vehicle],"done"] call SunriseClient_gui_bottomNotification;
[_vehicle,_unit,GVAR_RNAME(player)] remoteExecCall ["SunriseClient_system_keyRecive",_unit];