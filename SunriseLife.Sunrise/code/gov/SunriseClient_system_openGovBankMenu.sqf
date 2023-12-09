/*
	
	Filename: 	SunriseClient_system_openGovBankMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 3900)) then {
	if !(createDialog "SunriseDialogGovAtm") exitWith {};
};

if !(life_gov) exitWith {closeDialog 0};

private _balance = CONTROL(3900,3901);
_balance ctrlSetStructuredText parseText format ["<t size='1.2'>$%1</t>",[server_bank] call SunriseClient_system_numberText];