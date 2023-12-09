/*
	
	Filename: 	SunriseClient_gangs_OpenInfoMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 4200)) then {
	if !(createDialog "SunriseDialogMyGangAddInfo") exitWith {};
};

private _gangInfo = grpPlayer GVAR ["gang_info",[]];

if (count _gangInfo > 1) then {
	ctrlSetText [4201,(_gangInfo select 0)];
	ctrlSetText [4202,(_gangInfo select 1)];
	ctrlSetText [4203,(_gangInfo select 2)];
};