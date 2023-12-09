/*

	Filename: 	SunriseClient_system_setPlayerLicense.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_admin",ObjNull,[ObjNull]],
	["_license","",[""]]
];

if (!isClass (missionConfigFile >> "LifeCfgLicenses" >> _license)) exitWith {["error","",format["Не удалось найти лицензию"]] call SunriseClient_message};

private _gang_license = M_CONFIG(getNumber,"LifeCfgLicenses",_license,"gang");
if (EQUAL(_gang_license,0)) exitWith {["error","",format["Похоже, что это не лицензия группировки"]] call SunriseClient_message};

if !(_license in life_licenses) then {
	life_licenses pushBack _license;
	["done","",format["%1 включил вам лицензию ""%2""",GVAR_RNAME(_admin),localize M_CONFIG(getText,"LifeCfgLicenses",_license,"displayName")]] call SunriseClient_message;
	["done","",format["Вы прописали ""%1"" для %2",localize M_CONFIG(getText,"LifeCfgLicenses",_license,"displayName"),GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_message",_admin];
} else {
	life_licenses = life_licenses - [_license];
	["error","",format["%1 отключил вам лицензию ""%2""",GVAR_RNAME(_admin),localize M_CONFIG(getText,"LifeCfgLicenses",_license,"displayName")]] call SunriseClient_message;
	["error","",format["Вы отключили ""%1"" для %2",localize M_CONFIG(getText,"LifeCfgLicenses",_license,"displayName"),GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_message",_admin];
};

[] call SunriseClient_system_setTag;
[getPlayerUID player,"life_licenses",life_licenses] remoteExecCall ["SunriseServer_database_updatePartial",2];