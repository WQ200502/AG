/*
	
	Filename: 	SunriseClient_system_searchClient.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _cop = param [0,Objnull,[objNull]];
params [
	["_cop",objNull,[objNull]],
	["_notification",false,[false]]
];
if (isNull _cop) exitWith {};
if (_notification) then {["info","",format["Вас обыскивает полицейский с PID %1. Сохраните данные, если считаете это нарушением",getPlayerUID _cop],true] call SunriseClient_message};
private _p_virt_gear = [];

{	
	_name = configName _x;
	_value = ITEM_VALUE(_name);
	if (_value > 0) then {_p_virt_gear pushBack [_name,_value]};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));

life_tempHouses = [];

[player,_p_virt_gear,DCASH] remoteExecCall ["SunriseClient_system_copSearchUpdate",_cop];