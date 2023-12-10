/*
	
	Filename:   SunriseServer_system_medGoOnDuty.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _player = param[0,objNull,[objNull]];
if (isNull _player) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptName,_this]] call SunriseServer_system_customLog};
private _player_uid = getPlayerUID _player;

format ["invitePlayer:%1:%2",(life_medGroup getVariable ["gang_id",-1]),_player_uid] call SunriseServer_database_fireAndForget;
if !(isNull life_medGroup) then {
	private _membersCount = life_medGroup getVariable ["gang_membersCount",0];
	[life_medGroup,"gang_membersCount",(_membersCount + 1)] call CBA_fnc_setVarNet;
};
format["updatePlayerIndCfg_life_medDuty:true:%1",_player_uid] call SunriseServer_database_fireAndForget;
["duty",_player_uid,name _player,"1"] call SunriseServer_system_customLog;

private _gear = format ["loadDutyGear:%1",_player_uid] call SunriseServer_database_selectSingleField;
[_gear] remoteExecCall ["SunriseClient_loadout_duty",_player];