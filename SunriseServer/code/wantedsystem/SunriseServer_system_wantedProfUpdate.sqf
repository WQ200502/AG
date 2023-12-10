/*

	Filename: 	SunriseServer_system_wantedProfUpdate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
private ["_query","_tickTime","_wantedQuery"];
params [
    ["_uid","",[""]],
    ["_name","",[""]]
];
//Bad data check
if (_uid isEqualTo "" ||  _name isEqualTo "") exitWith {};

_wantedQuery = [format ["SELECT wantedName FROM wanted WHERE wantedID='%1'",_uid],2] call SunriseServer_database_asyncCall;
if (count _wantedQuery isEqualTo 0) exitWith {};
_wantedQuery = call compile format ["%1",_wantedQuery];

if (_name != (_wantedQuery select 0)) then {
    [format ["UPDATE wanted SET wantedName='%1' WHERE wantedID='%2'",_name,_uid],2] call SunriseServer_database_asyncCall;
};
