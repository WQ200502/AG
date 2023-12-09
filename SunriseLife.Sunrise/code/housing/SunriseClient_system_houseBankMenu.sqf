/*

	Filename: 	SunriseClient_system_houseBankMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _curTarget = param [0,ObjNull,[ObjNull]];
if (isNull _curTarget) exitWith {}; //Bad target
if !(life_copDuty) exitWith {};
if (dialog) exitWith {};

createDialog "SunriseDialogPlayerInteraction";
waitUntil {!isNull (findDisplay 37400)};

private _display = findDisplay 37400;
life_pInact_curTarget = _curTarget;

INIT_BUTTON(1,37402,localize "STR_pInAct_Repair","[life_pInact_curTarget] spawn SunriseClient_system_repairDoor; closeDialog 0;");
INIT_BUTTON(2,37403,localize "STR_pInAct_CloseOpen","[life_pInact_curTarget] call SunriseClient_system_doorAnimate; closeDialog 0;");