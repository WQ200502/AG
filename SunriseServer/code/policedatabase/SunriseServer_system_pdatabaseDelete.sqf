/*

    Filename:   SunriseServer_system_pdatabaseDelete.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
    ["_unit",objNull,[objNull]],
    ["_deleting","",[""]]
];
if (_deleting isEqualTo "" OR isNull _unit) exitWith {};
format ["pdatabaseDelete:%1:%2",_deleting,_deleting] call SunriseServer_database_fireAndForget;