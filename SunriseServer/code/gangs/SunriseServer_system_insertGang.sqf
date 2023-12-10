/*

    Filename:   SunriseServer_system_insertGang.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
if !(params [
	["_player",objNull,[objNull]],
	["_uid","",[""]],
	["_gangName","",[""]],
	["_name","",[""]]
]) exitWith {["error",format ["|SunriseServer_system_insertGang| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _group = group _player;


private _nameTaken = format["nameTaken:%1",_gangName] call SunriseServer_database_selectSingleField;
if (_nameTaken) exitWith {
	["Уже существует группа с таким названием, пожалуйста, выберите другое название","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player];
	{life_action_gangInUse = false} remoteExecCall ["call",_player];
};

private _inGang = format["inGang:%1",_uid] call SunriseServer_database_selectSingleField;
if (_inGang) exitWith {
	["У вас уже есть группа, пробуйте перезайти или ливните с старой","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player];
	{life_action_gangInUse = false} remoteExecCall ["call",_player];
};

private _gangID = format["insertGang:%1:%2",_uid,_gangName] call SunriseServer_database_insertSingle;
_group setVariable ["gang_id",_gangID,true];
_group setVariable ["gang_name",_gangName,true];
_group setVariable ["gang_owner",_uid,true];
_group setVariable ["gang_deputy","-1",true];
_group setVariable ["gang_bank",0,true];
_group setVariable ["gang_maxMembers",8,true];
_group setVariable ["gang_membersCount",1,true];
_group setVariable ["gang_info",[],true];
_group setVariable ["gang_license","-1",true];
_group setVariable ["gang_warpoints",0,true];

format ["invitePlayer:%1:%2",_gangID,_uid] call SunriseServer_database_fireAndForget;

[_group] remoteExecCall ["SunriseClient_gangs_Created",_player];