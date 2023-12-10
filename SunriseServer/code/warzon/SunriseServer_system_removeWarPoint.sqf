/*

	Filename: 	SunriseServer_system_removeWarPoint.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_pointID",0,[0]],
	["_player",objNull,[objNull]],
	["_pointName","",[""]]
];
private _playerName = _player getVariable["realname",name _player];
if (_pointName isEqualTo "" || _playerName isEqualTo "") exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptName,_this]] call SunriseServer_system_customLog};

private _membersNew = [];
{
	if ((_x select 0) != _pointID) then {_membersNew pushBack _x};
} forEach server_warzones;

missionNamespace setVariable ["server_warzones",_membersNew,true];

deleteMarker format ["war_marker_%1",_pointID];
deleteMarker format ["war_zone_%1",_pointID];

["remove",_pointName,_playerName] remoteExecCall ["SunriseClient_martiallaw_updateWarPoints",-2];