/*

	Filename: 	SunriseClient_system_knockedOut.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
    ["_target",ObjNull,[ObjNull]],
    ["_who","",[""]]
];
if (isNull _target) exitWith {};
if !(_target isEqualTo player) exitWith {};
if (_who isEqualTo "") exitWith {};
//if (random 1 > perk_endurance) exitWith {["done","","Вы смогли сдержать удар!"] call SunriseClient_message};

titleText ["Вас сбили с ног!","PLAIN"];
//systemChat format ["Вас сбил с ног игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_who];	
["info","",format["Вас сбил с ног игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_who],true] call SunriseClient_message;

player say3D "kick";
[player,"knoked",true] call CBA_fnc_setVarNet;
disableUserInput true;

["CL3_anim_Knockout2In"] call SunriseClient_system_animDo;
uiSleep 8;

[player,"knoked"] call SunriseClient_system_clearGlobalVar;
[player,"robbed"] call SunriseClient_system_clearGlobalVar;
disableUserInput false;