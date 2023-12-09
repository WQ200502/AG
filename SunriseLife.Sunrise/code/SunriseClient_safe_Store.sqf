/*
	
	Filename: 	SunriseClient_safe_Store.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _ctrl = CONTROL_DATA(3503);
private _num = ctrlText 3506;

//Error checks
if !([_num] call SunriseClient_system_isnumber) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if (_num < 1) exitWith {hint localize "STR_Cop_VaultUnder1";};
if (_ctrl != "goldbar") exitWith {hint localize "STR_Cop_OnlyGold"};
if (_num > life_inv_goldbar) exitWith {hint format[localize "STR_Cop_NotEnoughGold",_num];};

//Store it.
if !([false,_ctrl,_num] call SunriseClient_system_handleInv) exitWith {hint localize "STR_Cop_CantRemove";};
private _safeInfo = life_safeObj GVAR ["safe",0];
life_safeObj SVAR ["safe",_safeInfo + _num,true];

[life_safeObj] call SunriseClient_safe_Inventory;