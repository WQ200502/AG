/*
	
	Filename: 	SunriseClient_system_giveDiff.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_unit","_item","_val","_from"];
if !(EQUAL(_unit,player)) exitWith {};
private _bool = if (count _this > 4) then {true} else {false};
private _name = ITEM_NAME(_item);

if (_bool) then {
	if ([true,_item,(parseNumber _val)] call SunriseClient_system_handleInv) then {
		hint format[localize "STR_MISC_TooMuch",GVAR_RNAME(_from),_val,_name];
	};
} else {
	if ([true,_item,(parseNumber _val)] call SunriseClient_system_handleInv) then {
		hint format[localize "STR_MISC_TooMuch_2",GVAR_RNAME(_from),_val,_name];
	};
};