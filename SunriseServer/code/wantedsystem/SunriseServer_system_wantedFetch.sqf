/*

    Filename:   SunriseServer_system_wantedFetch.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
private _player = param [0,objNull,[objNull]];
if (isNull _player) exitWith {};

private _wanted = "wantedFetch" call SunriseServer_database_selectFull;
private _prisoners = "wantedFetchPrisoners" call SunriseServer_database_selectFull;
if (_prisoners isEqualTo []) exitWith {[_wanted,[]] remoteExec ["SunriseClient_system_wantedList",_player];};

[_wanted,_prisoners] remoteExec ["SunriseClient_system_wantedList",_player];