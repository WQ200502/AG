/*

	Filename: 	SunriseClient_warzones_blastingCharge.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isNil {grpPlayer GVAR "gang_name"}) exitWith {titleText[localize "STR_GNOTF_CreateGang","PLAIN"]};

private _box = param [0,ObjNull,[ObjNull]];
if (isNull _box) exitWith {};
if !((typeOf _box) isEqualTo WZ_SETTINGS(getText,"boxClass")) exitWith {};
if (_box GVAR ["chargePlaced",false]) exitWith {titleText["Уже установлен заряд","PLAIN"]};
if !(["srl_blastingcharge"] call SunriseClient_system_removeItem) exitWith {titleText["В инвентаре нет необходимых предметов","PLAIN"]};

[_box,"chargePlaced",true] call CBA_fnc_setVarNet;
titleText["Устанавливаем заряд...","PLAIN"];