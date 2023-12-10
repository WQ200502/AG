/*

    Filename:   SunriseServer_system_combatVehicleReq.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
    ["_unit",objNull,[objNull]],
    ["_cfgClass","",[""]],
    ["_marker","",[""]],
    ["_maximum",0,[0]]
];

if (isNull _unit) exitWith {};

if (_cfgClass isEqualTo "") exitWith {["Класс техники не задан","error"] remoteExecCall ["SunriseClient_gui_bottomNotification", _unit]};
if (_marker isEqualTo "") exitWith {["Маркер не задан","error"] remoteExecCall ["SunriseClient_gui_bottomNotification", _unit]};
if (_maximum isEqualTo 0) exitWith {["Максимум техники за рестарт не задан","error"] remoteExecCall ["SunriseClient_gui_bottomNotification", _unit]};

private _used = missionNamespace getVariable[format["BV_%1", _cfgClass], 0];

if (_used >= _maximum) exitWith {
    [format["Запас этой техники (%1 шт) уже был израсходован", _maximum],"error"] remoteExecCall ["SunriseClient_gui_bottomNotification", _unit];
};

private _pos = getArray(missionConfigFile >> "LifeCfgSpawnPoints" >> worldName >> _marker >> "position");

private _nearVehicles = nearestObjects[_pos, ["LandVehicle", "Air", "Ship"], 10];
if !(_nearVehicles isEqualTo []) exitWith {
    ["Место занято!","error"] remoteExecCall["SunriseClient_gui_bottomNotification", _unit];
};

missionNamespace setVariable[format["BV_%1", _cfgClass], _used + 1];
[_cfgClass, _marker] remoteExec ["SunriseClient_system_getCombatVehicleDone", _unit];