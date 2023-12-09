/*

	Filename: 	SunriseClient_experience_getPerkLevel.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
scriptName "fn_hasPerk";
#define __filename "fn_hasPerk.sqf"

private _perk = param [0,"",[""]];
private _lvl = -1;
{
    if (_x#0 isEqualTo _perk) exitWith {_lvl = _x#1}
} forEach life_currentExpPerks;
if (_lvl isEqualTo -1) exitWith {0};
_lvl