/*
	
	Filename: 	SunriseClient_system_saveTitle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 2978),-1)) exitWith {hint "Вы не выбрали приписку"};
life_myTitleID = CONTROL_DATA(2978);
[] call SunriseClient_system_setTitle;
private _info = [] call SunriseClient_system_getPassportText;
hintSilent parseText _info;