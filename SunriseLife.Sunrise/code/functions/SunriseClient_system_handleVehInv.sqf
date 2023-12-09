/*

	Filename: 	SunriseClient_system_handleVehInv.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
params [
	["_math",false,[false]],
	["_item","",[""]],
	["_num",0,[0]],
	["_vehicle",objNull,[objNull]]
];

if (EQUAL(_item,"") OR EQUAL(_num,0) OR EQUAL(_vehicle,objNull)) exitWith {false};

(_vehicle getVariable ["Trunk",[[],0]]) params ["_items","_space"];
if (_space < 0) exitWith {
	[_vehicle,"Trunk"] call SunriseClient_system_clearGlobalVar;
	["error","",format["В багажнике дыра от ржавчины. Мы ее залатали, но придется начать заново"]] call SunriseClient_message;
	false
};
private _v_maxweight = getNumber(missionConfigFile >> "LifeCfgVehicles" >> typeOf _vehicle >> "vItemSpace") + (100 * (_vehicle getVariable ["adacBoxes",0]));

if (_math) then {
	private _num = [_item,_num,_space,_v_maxweight] call SunriseClient_system_calWeightDiff;
	if (_num <= 0) exitWith {false};
};

private _index = [_item,_items] call SunriseClient_system_index;
if (!_math && _index isEqualTo -1) exitWith {false};

private _weight = (ITEM_WEIGHT(_item)) * _num;
private _return = false;

if (_math) then {
	//Lets add!
	if ((_space + _weight) <= _v_maxweight) then {
		if (_index isEqualTo -1) then {
			_items pushBack [_item,_num];
		} else {
			_items set[_index,[_item,(_items#_index#1) + _num]];
		};
		[_vehicle,"Trunk",[_items,_space + _weight]] call CBA_fnc_setVarNet;
		_return = true;
	} else {
		_return = false;
	};
} else {
	private _amount = _items#_index#1 - _num;
	if (_amount < 0) then {
		_return = false;
	} else {
		if (_amount isEqualTo 0) then {
			_items deleteAt _index;
		} else {
			_items set[_index,[_item,_amount]];
		};
		[_vehicle,"Trunk",[_items,_space - _weight]] call CBA_fnc_setVarNet;
		_return = true;
	};
};
[[_vehicle,player],"vehicleUpdate"] call SunriseClient_system_hcExec;

_return;