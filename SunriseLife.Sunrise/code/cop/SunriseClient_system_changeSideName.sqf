/*
	
	Filename: 	SunriseClient_system_changeSideName.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params[
	["_mode","",[""]],
	["_data","",[""]]
];
if (_mode isEqualTo "") exitWith {systemChat "SunriseClient_system_changeSideName ERROR! #1"};

switch (_mode) do { 
	case "name" : {
		if (count _data > 24) exitWith {hint "错误！名称的最大长度为24个字符！";};
		if ([_data] call SunriseClient_system_badProfileName) exitWith {hint "错误！你输入的名字错了！";};
		[player,"realname",_data] call CBA_fnc_setVarNet;
		private _info = [] call SunriseClient_system_getPassportText;
		hintSilent parseText _info;
	}; 
	case "side" : {
		_side = player getVariable ["fakeside",false];
		[player,"fakeside",!(_side)] call CBA_fnc_setVarNet;
		private _info = [] call SunriseClient_system_getPassportText;
		hintSilent parseText _info;
	}; 
	default {systemChat "SunriseClient_system_changeSideName ERROR! #2"}; 
};
