/*
    File: fn_medicRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Notifies the medics that someone has requested emergency and prompts them
    if they want to take the request or not.
*/
params [["_caller",objNull,[objNull]]];
if (isNull _caller) exitWith {};

_player = _caller getVariable ["CorpsePlayer",objNull];
if (isNull _player) exitWith {};

[format["%1 需要您的医疗救助，请查看地图寻找.",name _player],false,"slow"] call ANZUS_fnc_notificationSystem;
