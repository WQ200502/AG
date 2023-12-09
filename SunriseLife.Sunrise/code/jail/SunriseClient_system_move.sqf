/*

	Filename: 	SunriseClient_system_move.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (!alive player) exitWith {};
(_this select 3) params [
    ["_unit",objNull,[objNull]],
	["_target","",[""]]
];
private _kk_fnc_setPos = {
	params ["_obj", "_pos", "_offset"];
	_offset = _pos select 2;
	if (isNil "_offset") then {_offset = 0};
	_pos set [2, worldSize]; 
	_obj setPosASL _pos;
	_pos set [2, vectorMagnitude (_pos vectorDiff getPosVisual _obj) + _offset];
	_obj setPosASL _pos;
};
_action = [
		"Готовы отправиться?",
		"Тюрьма",
		"Да",
		"Нет"
	] call BIS_fnc_guiMessage;

if (_action) then {
	hint "Ожидайте прибытия охранника...";
	sleep random [5,10,15];
	titleText ["Вас переводят в другой участок","BLACK",1];
	uisleep 2;
	if (!life_is_arrested) exitWith {["info","",format ["Ошибка! Вы вышли из тюрьмы до перевода в другой участок."],true] call SunriseClient_message};
	if (_target isEqualTo "stolovaya") then {player setpos (getMarkerPos "stolovaya")} else {[player, (getMarkerPos _target)] call _kk_fnc_setPos};
	titleText ["","BLACK IN"];
	hint "";
};
