/*

	Filename: 	SunriseClient_hud_skinUpdate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (EQUAL((lbCurSel 6005),-1)) exitWith {hint "Вы не выбрали приписку"};
private _skinCfg = CONTROL_DATA(6005);

if (!isClass (missionConfigFile >> "LifeCfgThemes" >> _skinCfg)) exitWith {};

[_skinCfg] call SunriseClient_hud_skinSet;