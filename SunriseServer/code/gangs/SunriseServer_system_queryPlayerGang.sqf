/*

    Filename:   SunriseServer_system_queryPlayerGang.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
params [
    ["_uid","",[""]],
    ["_side","",[""]]
];
private _getPlayerGang = format ["getPlayerGang:%1:%2",_side,format["%2%1%2",_uid,"%"]] call SunriseServer_database_selectSingle;
missionNamespace setVariable [format ["gang_%1",_uid],_getPlayerGang];