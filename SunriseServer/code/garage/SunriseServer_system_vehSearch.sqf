/*

	Filename: 	SunriseServer_system_vehSearch.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
    ["_plate","",[""]],
    ["_unit",objNull,[objNull]]
];
if (isNull _unit OR _plate isEqualTo "") exitWith {};

private _queryResult = format ["vehicleSearch:%1",_plate] call SunriseServer_database_selectSingle;
[_queryResult] remoteExec ["SunriseClient_vehdatabase_SearchDone",_unit];