/*

	Filename: 	SunriseClient_system_tfRadioParent.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {""};

private _return = _item;

if (getText (configFile >> "CfgWeapons" >> _item >> "simulation") isEqualTo "ItemRadio") then {
	if (isClass(configFile >> "CfgPatches" >> "task_force_radio_items")) then {
		private _radio = getText (configFile >> "CfgWeapons" >> _item >> "tf_parent");
		if !(EQUAL(_radio,"")) then {_return = _radio};
	};
};

_return