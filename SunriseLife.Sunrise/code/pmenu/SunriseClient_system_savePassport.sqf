/*
	
	Filename: 	SunriseClient_system_savePassport.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 2977),-1)) exitWith {hint "Вы не выбрали паспорт"};
life_myPassportID = CONTROL_DATA(2977);
private _info = [] call SunriseClient_system_getPassportText;
hintSilent parseText _info;