/*

    Filename:   SunriseServer_system_initBattle.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_captIndex",-1,[0]]
];
if (_captIndex isEqualTo -1) exitWith {diag_log "ERROROROROROROROROROROROROROROROR INIT BATTLE ISNULL"};
BattleIndex = _captIndex;
publicVariable "BattleIndex";
battleWon = false;
private _captureArray = (enabledCaptures select _captIndex);
private _processor = call compile format ["%1",_captureArray select 0];
private _arr = player nearEntities ["Man", 1500];
private _logErr = [];
{
	_logErr pushBack (_x getVariable ["realname",""]);
} forEach _arr; 
diag_log (format ["RESOURCE CAPTURE:InitBattle:%1",_logErr]);

_pos = getPos _processor;
_position = [_pos select 0,_pos select 1];

_pointName = format ["Битва за переработку %1",_captureArray select 1];

_marker = createMarker ["war_marker_1337",_position];
_marker setMarkerColor "ColorWhite";
_marker setMarkerTypeLocal "KIA";
_marker setMarkerText "Не входить! Ведётся военное положение!";

_warn = createMarker ["war_zone_1337",_position];
_warn setMarkerShape "ELLIPSE";
_warn setMarkerSize [1500,1500];
_warn setMarkerColor "ColorEAST";
_warn setMarkerBrush "Solid";
_warn setMarkerAlpha 0.5;

server_warzones pushBack [1337,1500,_pointName,"сервер"];
publicVariable "server_warzones";

_preZone = createMarker ["war_prezone_1337",_position];
_preZone setMarkerShape "ELLIPSE";
_preZone setMarkerSize [1500,1500];
_preZone setMarkerColor "ColorEAST";
_preZone setMarkerBrush "Solid";
_preZone setMarkerAlpha 0.5;

["add",_pointName,"сервер"] remoteExecCall ["SunriseClient_martiallaw_updateWarPoints",-2];
for "_i" from 1400 to 300 step -100 do {
	_warn setMarkerSize [_i,_i];
	_preZone setMarkerSize [_i-100,_i-100];
	if (_i isEqualTo 300) then {deleteMarker _preZone};
	diag_log [1337,_i + 100,_pointName,"сервер"];
	_index = server_warzones find [1337,_i + 100,_pointName,"сервер"];
	(server_warzones select _index) set[1, _i];
	publicVariable "server_warzones";
	if (battleWon) exitWith {diag_log "RESOURCE CAPTURE:BATTLE WON EXIT FROM CYCLE"};
	["circle",_captureArray select 1,"10"] remoteExecCall ["SunriseClient_martiallaw_updateWarPoints",civilian];
	uiSleep (10 * 60);
};


if (battleWon) exitWith {diag_log "RESOURCE CAPTURE:BATTLE WON EXIT FROM SCRIPT"};
BattleIndex = -1;
publicVariable "BattleIndex";
["remove",_pointName,"сервер"] remoteExecCall ["SunriseClient_martiallaw_updateWarPoints",-2];
deleteMarker "war_zone_1337";
deleteMarker "war_marker_1337";

private _membersNew = [];
{
    if ((_x select 0) != 1337) then {_membersNew pushBack _x};
} forEach server_warzones;

server_warzones = _membersNew;
publicVariable "server_warzones";
diag_log (format ["RESOURCE CAPTURE:endBattle:%1:%2:%3","Никто",[],_captureArray select 0]);

format ["endBattle:%1:%2:%3","Никто",[],_captureArray select 0] call SunriseServer_database_fireAndForget;
_processor setVariable ["proc_owner",-1,true];
_processor setVariable ["proc_name","Никто",true];
uiSleep 1;
[] call SunriseServer_system_loadEnabledCaptures;
/////////////////////////