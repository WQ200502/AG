/*
	
	Filename: 	SunriseClient_system_receiveItem.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_unit","_val","_item","_from","_diff"];
_unit = _this select 0;
if (_unit != player) exitWith {};
_val = _this select 1;
_item = _this select 2;
_from = _this select 3;

_diff = [_item,(parseNumber _val),life_carryWeight,life_maxWeight] call SunriseClient_system_calWeightDiff;

if (_diff != (parseNumber _val)) then {
	if ([true,_item,_diff] call SunriseClient_system_handleInv) then {
		hint format[localize "STR_MISC_TooMuch_3",GVAR_RNAME(_from),_val,_diff,((parseNumber _val) - _diff)];		
		[_from,_item,str((parseNumber _val) - _diff),_unit] remoteExecCall ["SunriseClient_system_giveDiff",_from];
	} else {		
		[_from,_item,_val,_unit,false] remoteExecCall ["SunriseClient_system_giveDiff",_from];
	};
} else {
	if ([true,_item,(parseNumber _val)] call SunriseClient_system_handleInv) then {
		hint format[localize "STR_NOTF_GivenItem",GVAR_RNAME(_from),_val,ITEM_NAME(_item)];
	} else {		
		[_from,_item,_val,_unit,false] remoteExecCall ["SunriseClient_system_giveDiff",_from];
	};
};