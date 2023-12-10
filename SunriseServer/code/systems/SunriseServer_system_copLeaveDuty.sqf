/*
	
	Filename:   SunriseServer_system_copLeaveDuty.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _player = param[0,objNull,[objNull]];
if (isNull _player) exitWith {["error",format ["|copLeaveDuty| PARAMS=%1",_this]] call SunriseServer_system_customLog};
private _player_uid = getPlayerUID _player;

if (_player isEqualTo life_cop_disp) then {
	[format["Диспетчер (%1) ушел с дежурства", life_cop_disp getVariable ["realname",""]],"police"] remoteExecCall ["SunriseClient_system_hint",life_copGroup];
	life_cop_disp = objNull;
};
publicVariable "life_cop_disp";

format ["kickPlayer:%1",_player_uid] call SunriseServer_database_fireAndForget;
if !(isNull life_copGroup) then {
	private _membersCount = life_copGroup getVariable ["gang_membersCount",0];
	[life_copGroup,"gang_membersCount",(_membersCount - 1)] call CBA_fnc_setVarNet;
};
format["updatePlayerIndCfg_life_copDuty:false:%1",_player_uid] call SunriseServer_database_fireAndForget;
["duty",_player_uid,name _player,"0"] call SunriseServer_system_customLog;

private _gear = format ["loadDutyGear:%1",_player_uid] call SunriseServer_database_selectSingleField;
[_gear] remoteExecCall ["SunriseClient_loadout_duty",_player];