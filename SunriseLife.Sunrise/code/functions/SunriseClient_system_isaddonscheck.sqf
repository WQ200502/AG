/*

	Filename: 	SunriseClient_system_isAddonsCheck.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team

*/
#include "..\..\script_macros.hpp"
private _ClassName = param [0,"",[""]];
if (EQUAL(_ClassName,"")) exitWith {false};

private _cfg = switch (true) do {
	case (isClass (configFile >> "CfgMagazines" >> _ClassName)) : {"CfgMagazines"};
	case (isClass (configFile >> "CfgWeapons" >> _ClassName)) : {"CfgWeapons"};
	case (isClass (configFile >> "CfgVehicles" >> _ClassName)) : {"CfgVehicles"};
	case (isClass (configFile >> "CfgGlasses" >> _ClassName)) : {"CfgGlasses"};
	default {""};
};

if (EQUAL(_cfg,"")) exitWith {false};
if !(_cfg isEqualType "") exitWith {false};
if !(isClass (configFile >> _cfg >> _ClassName)) exitWith {
	format ["isAddonsCheck: В [%2] Аддонах нету такого КлассНейма [%1]",_ClassName,_cfg] call SunriseClient_system_log; 
	//systemChat format["isAddonsCheck: В [%2] Аддонах нету такого КлассНейма [%1]",_ClassName,_cfg];
	["info","",format ["isAddonsCheck: В [%2] Аддонах нету такого КлассНейма [%1]",_ClassName,_cfg],true] call SunriseClient_message;
	false
};

true