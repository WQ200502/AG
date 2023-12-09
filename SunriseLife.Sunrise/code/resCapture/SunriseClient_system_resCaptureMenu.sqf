/*
	
	Filename: 	SunriseClient_system_ResCaptureMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (isNull grpPlayer) exitWith {hint "У вас нет доступа к этому ноутбуку"};
if (grpPlayer GVAR ["gang_license","-1"] isEqualTo "-1") exitWith {hint "У вас нет доступа к этому ноутбуку"};
disableSerialization;
if (isNull (findDisplay 4500)) then {
	if !(createDialog "SunriseDialogResCapture") exitWith {};
};

private _ownerID = grpPlayer GVAR["gang_owner",""];
private _gangDeputy = grpPlayer GVAR ["gang_deputy","-1"];
if ((EQUAL(_gangDeputy,steamid)) OR (EQUAL(_ownerID,steamid))) then {
	ctrlShow[4505,true];
};

private _list = CONTROL(4500,4501);
lbClear _list;
{
	_list lbAdd format ["%1", _x select 1];
	_list lbSetData [(lbSize _list)-1,str(_x)];
} foreach enabledCaptures;

_list lbSetCurSel 0;