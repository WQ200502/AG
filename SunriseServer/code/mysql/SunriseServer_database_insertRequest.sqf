/*

    Filename:   SunriseServer_database_insertRequest.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
if !(params [
	["_uid","",[""]],
	["_name","",[""]],
    ["_player",objNull,[objNull]]
]) exitWith {["error",format ["|insertRequest| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _isKnownAccount = format["isKnownAccount:%1", _uid] call SunriseServer_database_selectSingleField;
if (_isKnownAccount) exitWith {[] remoteExecCall ["SunriseClient_session_dataQuery",_player]};

private _isNameInData = format["isNameInData:%1", _name] call SunriseServer_database_selectSingleField;
if (_isNameInData) exitWith {[] remoteExec ["SunriseClient_session_nameInData",_player]};

format ["insertPlayer:%1:%2:%3", _uid, _name, worldName] call SunriseServer_database_fireAndForget;
[] remoteExecCall ["SunriseClient_session_dataQuery",_player];