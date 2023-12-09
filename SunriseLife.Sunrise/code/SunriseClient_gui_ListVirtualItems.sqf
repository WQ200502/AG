/*

	Filename: 	SunriseClient_gui_ListVirtualItems.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _list = param [0,controlNull,[controlNull]];
if (isNull _list) exitWith {};

private ["_value","_icon"];
{
	_value = ITEM_VALUE(configName _x);
	if (_value > 0) then {
		_list lbAdd format ["%1 x %2",_value,localize (getText(_x >> "displayName"))];
		_list lbSetData [(lbSize _list)-1,configName _x];
		_icon = getText (_x >> "icon");
		if !(EQUAL(_icon,"")) then {
			_list lbSetPicture [(lbSize _list)-1,_icon];
		};
	};
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));