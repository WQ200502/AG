/*

	Filename: 	SunriseClient_system_removeItemFromInventory.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {false};

private _return = false;

switch (true) do {
	case (_item in PUNIFORM_ITEMS): {
		private _oldCount = count PUNIFORM_ITEMS;
		player removeItemFromUniform _item;
		if (count PUNIFORM_ITEMS < _oldCount) then {_return = true};		 
	};
	case (_item in PVEST_ITEMS): {
		private _oldCount = count PVEST_ITEMS;
		player removeItemFromVest _item;
		if (count PVEST_ITEMS < _oldCount) then {_return = true};
	};
	case (_item in PBACKPACK_ITEMS) : {
		private _oldCount = count PBACKPACK_ITEMS;
		player removeItemFromBackpack _item;
		if (count PBACKPACK_ITEMS < _oldCount) then {_return = true};
	};
	case (_item in P_ASSIGNED): {
		private _oldCount = count P_ASSIGNED;
		player unlinkItem _item;
		if (count P_ASSIGNED < _oldCount) then {_return = true};
	};
	default {};
};

_return