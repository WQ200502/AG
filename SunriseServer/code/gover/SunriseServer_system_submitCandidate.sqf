/*

	Filename: 	SunriseServer_system_submitCandidate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
    ["_player",objNull,[objNull]],
	["_invest",0,[0]],
    ["_policy","",[""]]
];

if (isNull _player || _policy isEqualTo "") exitWith {};

private _name = name _player;
private _uid = getPlayerUid _player;

_query = format ["INSERT INTO politics (name,uid,invest,policy,active) VALUES('%1', '%2', '%3', '%4', '1')",_name,_uid,_invest,_policy];

[_query,1] call SunriseServer_database_asyncCall;

server_candidates pushBack [_uid,_name,_invest,_policy];
publicVariable "server_candidates";