/*

	Filename: 	SunriseServer_system_initFractionGang.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _group_id = param[0,-1,[-1]];

private _queryResult = format["initFractionGang:%1",_group_id] call SunriseServer_database_selectSingle;
diag_log format ["OK fn_initFractionGang:_queryResult = %1",_queryResult];

if (_queryResult isEqualTo []) exitWith {};

_group = createGroup [civilian,false];
_group setVariable ["gang_id",(_queryResult select 0),true];
_group setVariable ["gang_owner",(_queryResult select 1),true];
_group setVariable ["gang_deputy",(_queryResult select 2),true];
_group setVariable ["gang_name",(_queryResult select 3),true];
_group setVariable ["gang_membersCount",(_queryResult select 4),true];
_group setVariable ["gang_maxMembers",(_queryResult select 5),true];
_group setVariable ["gang_bank",(_queryResult select 6),true];
_group setVariable ["gang_info",(_queryResult select 7),true];

switch (_queryResult select 0) do { 
	case 1 : {life_copGroup = _group; publicVariable "life_copGroup";[{isNull life_copGroup}, {_this call SunriseServer_system_initFractionGang}, [_queryResult select 0]] call CBA_fnc_waitUntilAndExecute}; 
	case 2 : {life_medGroup = _group; publicVariable "life_medGroup";[{isNull life_medGroup}, {_this call SunriseServer_system_initFractionGang}, [_queryResult select 0]] call CBA_fnc_waitUntilAndExecute}; 
	default {diag_log "ERROR: initFractionGang _queryResult select 0 - " + str (_queryResult select 0)}; 
};