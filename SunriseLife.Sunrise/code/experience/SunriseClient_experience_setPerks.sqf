/*

	Filename: 	SunriseClient_experience_setPerks.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
scriptName "fn_setPerks";
#define __filename "fn_setPerks.sqf"

life_currentExpPerks = param [0,[],[[]]];
private _newPerks = [] call SunriseClient_experience_generateBasePerks;

{
	_perk = _x#0;
	_lvl = [_perk] call SunriseClient_experience_getPerkLevel;
	_newPerks set [_forEachIndex,[_perk,_lvl]];
} forEach _newPerks;
[] call SunriseClient_experience_initPerks;
life_currentExpPerks = _newPerks;