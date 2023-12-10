/*

	Filename:   SunriseServer_system_dutyGearLoad.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
private _player = param [0,objNull,[objNull]];
private _player_uid = getPlayerUID _player;
if (_player_uid isEqualTo "" OR isNull _player) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};

private _gear = format ["loadDutyGear:%1",_player_uid] call SunriseServer_database_selectSingleField;
[_gear] remoteExecCall ["SunriseClient_loadout_duty",_player];
