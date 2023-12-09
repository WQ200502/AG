/*

	Filename: 	SunriseClient_gangs_ClearLicense.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _save = param [0,true,[false]];

if (life_copDuty OR life_medDuty) exitWith {};

if (life_civlevel > 1) then {life_civlevel = 1};
player SVAR ["lvl",life_civlevel,true];
[getPlayerUID player,"life_civlevel",life_civlevel] remoteExecCall ["SunriseServer_database_updatePartial",2];
{
	if (configName _x in life_licenses) then {
		life_licenses = life_licenses - [configName _x];
	};
} foreach ("(getNumber(_x >> 'gang') isEqualTo 1)" configClasses (missionConfigFile >> "LifeCfgLicenses"));

[] call SunriseClient_system_setTag;

if (_save) then {[getPlayerUID player,"life_licenses",life_licenses] remoteExecCall ["SunriseServer_database_updatePartial",2]};