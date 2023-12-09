/*
	
	Filename: 	SunriseClient_system_saveTerrainGrid.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if ((lbCurSel 2975) isEqualTo -1) exitWith {hint "Вы не выбрали детализацию"};
private _grassIndex = CONTROL_VALUE(2975);

if (EQUAL(_grassIndex,life_grassIndex)) exitWith {};

life_grassIndex = _grassIndex;
setterrainGrid life_grassIndex;