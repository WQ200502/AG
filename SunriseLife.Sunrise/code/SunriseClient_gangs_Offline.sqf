/*
	
	Filename: 	SunriseClient_gangs_Offline.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 3800)) then {
	if !(createDialog "SunriseDialogGangOffline") exitWith {};
};

if !(((getPlayerUID player) isEqualTo ((group player) getVariable ["gang_owner",""])) OR ((getPlayerUID player) isEqualTo ((group player) getVariable ["gang_deputy",""]))) exitWith {closeDialog 0; hint "Вы не являетесь замом или владельцем группы"};
private _gangName = GANG_NAME;

(CONTROL(3800,3801)) ctrlSetText format ["%1 (Оффлайн)",_gangName];

private _members = CONTROL(3800,3802);
lbClear _members;

_members lbAdd "Получение списка...";

[[player,grpPlayer],"getOffline","SYS",false] call SunriseClient_system_hcExec;