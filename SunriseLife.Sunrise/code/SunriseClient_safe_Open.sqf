/*
	
	Filename: 	SunriseClient_safe_Open.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (dialog) exitWith {}; //A dialog is already open.
life_safeObj = param [0,ObjNull,[ObjNull]];
if (isNull life_safeObj) exitWith {};
if (life_copDuty OR life_medDuty) exitWith {};
if ((life_safeObj GVAR ["safe",-1]) < 1) exitWith {[localize "STR_Civ_VaultEmpty","error"] call SunriseClient_gui_bottomNotification};
if (life_safeObj GVAR ["inUse",false]) exitWith {[localize "STR_Civ_VaultInUse","error"] call SunriseClient_gui_bottomNotification};
private _minCops = LIFE_SETTINGS(getNumber,"life_cop_min") * 2;
if ((count units life_copGroup) < _minCops) exitWith {[format[localize "STR_Civ_NotEnoughCops",_minCops],"error"] call SunriseClient_gui_bottomNotification};
if !(createDialog "SunriseDialogFederalSafe") exitWith {[localize "STR_MISC_DialogError","error"] call SunriseClient_gui_bottomNotification};
	
disableSerialization;
ctrlSetText[3501,(localize "STR_Civ_SafeInv")];
[life_safeObj] call SunriseClient_safe_Inventory;
life_safeObj SVAR ["inUse",true,true];

[{isNull (findDisplay 3500)}, {[_this,"inUse"] call SunriseClient_system_clearGlobalVar}, life_safeObj] call CBA_fnc_waitUntilAndExecute;