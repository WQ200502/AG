/*

	Filename: 	SunriseClient_system_removeLegcuffs.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _target = param [0,objNull,[objNull]];
if ((isNull _target) OR !(alive _target)) exitWith {};

if !(_target GVAR ["isArrested",false]) exitWith {};
if (_target GVAR ["karma",0] > 0) exitWith {hint "Этот человек был помещен в тюрьму за нарушение правил. Зря проделал такой путь..."};
[_target,"isArrested"] call SunriseClient_system_clearGlobalVar;
[2,format[localize "STR_NOTF_JailYouCanRun",GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",_target];
["done","",format[localize "STR_NOTF_JailNumberRemoved"]] call SunriseClient_message;