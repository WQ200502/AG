/*

	Filename: 	SunriseClient_system_clearGlobalVar.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params [
	["_object",objNull,[objNull,grpNull]],
	["_var","",[""]]
];
if (isNull _object) exitWith {};
if (EQUAL(_var,"")) exitWith {};

if (!isNil {_object GVAR _var}) then {
	_object SVAR [_var,nil,true];
	format["ClearGlobalVar - %1 isNil",_var] call SunriseClient_system_log;
};