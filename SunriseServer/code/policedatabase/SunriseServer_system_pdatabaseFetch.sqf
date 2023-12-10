/*

    Filename:   SunriseServer_system_pdatabaseFetch.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
    ["_searching","",[""]],
    ["_player",objNull,[objNull]]
];
if (_searching isEqualTo "" OR isNull _player) exitWith {};

_data = format ["pdatabaseFetch:%1:%2",_searching,_searching] call SunriseServer_database_selectSingle;
[2,_data] remoteExec ["SunriseClient_system_policedb",_player];