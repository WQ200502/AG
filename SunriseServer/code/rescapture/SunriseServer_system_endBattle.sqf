/*

    Filename:   SunriseServer_system_endBattle.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_group",grpNull,[grpNull]],
	["_resource","",[""]]
];
if (_group isEqualTo grpNull OR _resource isEqualTo "") exitWith {diag_log "ERROROROROROROROROROROROROROROROR END BATTLE IS NULL"};
_gangName = _group getVariable ["gang_name",""];
_gangId = _group getVariable ["gang_id",-1];
if (_gangName isEqualTo "" OR _gangId isEqualTo -1) exitWith {diag_log "ERERERERERERERERRERERERER ENDBATTLEERERER"};
battleWon = true;

deleteMarker "war_prezone_1337";
deleteMarker "war_zone_1337";
deleteMarker "war_marker_1337";

private _membersNew = [];
{
    if ((_x select 0) != 1337) then {_membersNew pushBack _x};
} forEach server_warzones;

server_warzones = _membersNew;
publicVariable "server_warzones";
["remove",format ["Битва за переработку %1",(enabledCaptures select BattleIndex) select 1],"сервер"] remoteExecCall ["SunriseClient_martiallaw_updateWarPoints",-2];
BattleIndex = -1;
publicVariable "BattleIndex";

private _processor = call compile format ["%1",_resource];
_processor setVariable ["proc_owner",_gangId,true];
_processor setVariable ["proc_name",_gangName,true];

diag_log (format ["RESOURCE CAPTURE:endBattle:%1:%2:%3",_gangName,[],_resource]);
format ["endBattle:%1:%2:%3",_gangName,[],_resource] call SunriseServer_database_fireAndForget;
uiSleep 1;
[] call SunriseServer_system_loadEnabledCaptures;