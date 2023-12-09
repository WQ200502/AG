/*

	Filename: 	SunriseClient_system_radioParent.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {""};

if (EQUAL(getText (configFile >> "CfgWeapons" >> _item >> "simulation"),"ItemRadio")) then {
	if (isClass(configFile >> "CfgPatches" >> "task_force_radio_items")) then {
		_radio = getText (configFile >> "CfgWeapons" >> _item >> "tf_parent");
		if ((_radio isEqualType "") && !(EQUAL(_radio,""))) then {_item = _radio};
	};
};

_item