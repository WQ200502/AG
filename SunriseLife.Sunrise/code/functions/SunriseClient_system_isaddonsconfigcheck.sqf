/*

	Filename: 	SunriseClient_system_isAddonsConfigCheck.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	E-mail:		Sunrise Team

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
    format ["isAddonsConfigCheck: В [%2] Аддонах нету такого КлассНейма [%1]",_ClassName,_cfg] call SunriseClient_system_log; 
	//systemChat format["isAddonsConfigCheck: В [%2] Аддонах нету такого КлассНейма [%1]",_ClassName,_cfg];
	["info","",format ["isAddonsConfigCheck: В [%2] Аддонах нету такого КлассНейма [%1]",_ClassName,_cfg],true] call SunriseClient_message;
	false
};

private _return = true;

switch (true) do {
	case (_cfg in ["CfgMagazines","CfgWeapons"]) : {
	    if !(isClass(missionConfigFile >> "LifeCfgItems" >> _ClassName)) then {
	        /*format["isConfigCheck: В [LifeCfgItems] нету такого КлассНейма [%1]",_ClassName] call SunriseClient_system_log;
			systemChat format["isConfigCheck: В [LifeCfgItems] нету такого КлассНейма [%1]",_ClassName];*/
			_return = false;
		};
	};
	/*case (EQUAL(_cfg,"CfgVehicles")) : {
	    if !(isClass(missionConfigFile >> "LifeCfgVehicles" >> _ClassName)) then {
		    format["isConfigCheck: В [LifeCfgVehicles] нету такого КлассНейма [%1]",_ClassName] call SunriseClient_system_log;
			systemChat format["isConfigCheck: В [LifeCfgVehicles] нету такого КлассНейма [%1]",_ClassName];
			_return = false;
	    };
	};*/
	default {_return = true};
};

_return