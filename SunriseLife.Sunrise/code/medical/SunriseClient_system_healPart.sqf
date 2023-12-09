/*

	Filename: 	SunriseClient_system_healPart.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	https://community.bistudio.com/wiki/getAllHitPointsDamage
*/
#include "..\..\script_macros.hpp"
private _part = param [0,"",[""]];

if (life_action_inUse) exitWith {};
if (EQUAL(_part,"")) exitWith {};
if (damage player < 0.25) exitWith {hint "Вы не можете вылечиться выше 75% здоровья, обратитесь в госпиталь или изучите навык Регенерация"};
if !("srl_bandage" in (magazines player)) exitWith {["Вам необходимо приобрести бинт","error"] call SunriseClient_gui_bottomNotification};

closeDialog 0;

titleText["Вы начали лечение...","PLAIN"];

private _partTitle = switch (_part) do {
	case "head": {"голове"};
	case "body": {"теле"};
	case "hands": {"руках"};
	case "legs": {"ногах"};
};

[format ["Лечим раны на %1",_partTitle],10,"action_bandage_0","",true] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
if (NOTINVEH(player)) then {["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;};
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

if !(["srl_bandage"] call SunriseClient_system_removeItem) exitWith {["Вам необходимо приобрести бинт","error"] call SunriseClient_gui_bottomNotification};

switch (_part) do {
	case "head": {player setHitPointDamage ["hitHead", 0];};
	case "body": {player setHitPointDamage ["hitBody", 0];};
	case "hands": {player setHitPointDamage ["hitHands", 0];};
	case "legs": {player setHitPointDamage ["hitLegs", 0];};
};

_hitHead = player getHitPointDamage "hitHead";
_hitBody = player getHitPointDamage "hitBody";
_hitHands = player getHitPointDamage "hitHands";
_hitLegs = player getHitPointDamage "hitLegs";

if (_hitHead < 0.25 && _hitBody < 0.25 && _hitHands < 0.25 && _hitLegs < 0.25) then {player setDamage 0};

titleText["Лечение закончено!","PLAIN"];

[] call SunriseClient_system_healMenu;