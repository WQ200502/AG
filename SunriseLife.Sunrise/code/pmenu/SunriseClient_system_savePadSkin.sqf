/*
	
	Filename: 	SunriseClient_system_savePadSkin.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (EQUAL((lbCurSel 2973),-1)) exitWith {hint "Вы не выбрали цвет"};
life_myPadSkinID = CONTROL_DATA(2973);
