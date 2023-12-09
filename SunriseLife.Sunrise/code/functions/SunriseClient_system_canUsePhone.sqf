/*

	Filename: 	SunriseClient_system_canUsePhone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _isPhone = false;

{
	if (["tf_", _x] call SunriseClient_system_xString && (_x != "tf_microdagr")) exitWith {_isPhone = true};
} forEach (assignedItems player);

if (_isPhone) exitWith {true};

if (([cursorObject] call SunriseClient_system_getModelName) in ["phonebooth_01_f","phonebooth_02_f"]) exitWith {true};

false