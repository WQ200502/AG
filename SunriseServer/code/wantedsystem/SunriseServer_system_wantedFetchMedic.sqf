/*

    Filename:   SunriseServer_system_wantedFetchMedic.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {};

private _queryResult = "wantedFetch" call SunriseServer_database_selectFull;
[_queryResult] remoteExec ["SunriseClient_system_medicMenuReceive",_unit];