/*

    Filename:   SunriseServer_database_queryRequest.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "..\..\script_macros.hpp"
if !(params [
	["_uid","",[""]],
	//["_guid","",[""]],
	["_player",objNull,[objNull]]
]) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};

/*private _steamids = format["getPermBans:%1",_guid] call SunriseServer_database_selectSingle;
diag_log _steamids;
if (_steamids isEqualTo []) then {
	format ["insertPermBan:%1:%2", [_uid], _guid] call SunriseServer_database_fireAndForget;
} else {
	_steamids = _steamids select 0;
	if !(_uid in _steamids) then {
		_steamids pushBack _uid;
		diag_log _steamids;
		format ["updatePlayerIDs:%1:%2", _steamids, _guid] call SunriseServer_database_fireAndForget;
	};
};

private _isPermBanned = format["isPermBanned:%1", _guid] call SunriseServer_database_selectSingleField;
if (_isPermBanned) exitWith {[_uid,"perm","Hardware BAN",_guid] call SunriseServer_system_rcon};*/

//private _isKnownAccount = format["isKnownAccount:%1", _uid] call SunriseServer_database_selectSingleField;
//if (!_isKnownAccount) exitWith {[] remoteExecCall ["SunriseClient_session_insertPlayerInfo",_player]};

private _ban = format["queryBanTime:%1",_uid] call SunriseServer_database_selectSingle;
if !(_ban isEqualTo []) exitWith {_ban remoteExec ["SunriseClient_session_banned",_player]};

private _queryResult = format ["getPlayerInfo:%1", _uid] call SunriseServer_database_selectSingle;
if (_queryResult isEqualTo []) exitWith {[] remoteExecCall ["SunriseClient_session_insertPlayerInfo",_player]};

format ["Player (%1) connected %2",_uid,server_timetext] call SunriseServer_system_log;
_queryResult params [
	["_playerid","",[""]],
	["_name","",[""]],
	["_cash",0,[0]],
	["_bankacc",0,[0]],
	["_donorlevel",0,[0]],
	["_licenses",[],[[]]],
	["_civlevel",0,[0]],
	["_coplevel",0,[0]],
	["_mediclevel",0,[0]],
	["_gear",[],[[]]],
	["_recipes",[],[[]]],
	["_logout_pos",[],[[]]],
	["_karma",0,[0]],
	["_deaths",0,[0]],
	["_servermap","",[""]],
	["_dcash",0,[0]],
	["_arrested",false,[false]],
	["_jail_time",0,[0]],
	["_first_time",false,[false]],
	["_playtime",0,[0]],
	["_exp_level",0,[0]],
	["_exp_total",0,[0]],
	["_exp_perkPoints",0,[0]],
	["_exp_perks",[],[[]]],
	["_gangId",0,[0]],
	["_damage",0,[0]]
];
_cash = [_cash] call SunriseServer_database_numberSafe;
_bankacc = [_bankacc] call SunriseServer_database_numberSafe;
_dcash = [_dcash] call SunriseServer_database_numberSafe;

private _gangData = [format ["getPlayerGang:%1",_gangId] call SunriseServer_database_selectSingle,[]] select (_gangId isEqualTo -1);
private _houseData = _uid call SunriseServer_system_fetchPlayerHouses;

private _configsData = format ["getPlayerConfig:%1", _uid] call SunriseServer_database_selectSingle;
if (_configsData isEqualTo []) then {
	format ["insertPlayerConfig:%1", _uid] call SunriseServer_database_fireAndForget;
	_configsData = format ["getPlayerConfig:%1", _uid] call SunriseServer_database_selectSingle;
	["error",format ["|queryRequest| _configsData isEqualTo [];%1",_this]] call SunriseServer_system_customLog;
};

private _indicatorsData = format ["getPlayerIndicators:%1", _uid] call SunriseServer_database_selectSingle;
if (_indicatorsData isEqualTo []) then {
	format ["insertPlayerIndicators:%1", _uid] call SunriseServer_database_fireAndForget;
	_configsData = format ["getPlayerIndicators:%1", _uid] call SunriseServer_database_selectSingle;
	["error",format ["|queryRequest| _indicatorsData isEqualTo [];%1",_this]] call SunriseServer_system_customLog;
};

private _keysData = missionNamespace getVariable [(_uid + "_KEYS"),[]];

[
	_playerid,
	_name,
	_cash,
	_bankacc,
	_dcash,
	_donorlevel,
	_licenses,
	_civlevel,
	_coplevel,
	_mediclevel,
	_gear,
	_recipes,
	_logout_pos,
	_karma,
	_deaths,
	_servermap,
	_arrested,
	_jail_time,
	_first_time,
	_playtime,
	_damage,
	_exp_level,
	_exp_total,
	_exp_perkPoints,
	_exp_perks,
	_gangData,
	_houseData,
	_configsData,
	_indicatorsData,
	_keysData
] remoteExec ["SunriseClient_session_requestReceived",_player];

missionNamespace setVariable ["JT_" + _uid,serverTime];