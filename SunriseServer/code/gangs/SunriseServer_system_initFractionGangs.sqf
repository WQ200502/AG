/*

	Filename: 	SunriseServer_system_initFractionGangs.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/

private _queryResult = "initFractionGangs" call SunriseServer_database_selectFull;
format ["OK fn_initFractionGangs:_queryResult = %1",_queryResult] call SunriseServer_system_log;

if (_queryResult isEqualTo []) exitWith {};
{
	_group = createGroup [civilian,false];
	_group setVariable ["gang_id",(_x select 0),true];
	_group setVariable ["gang_owner",(_x select 1),true];
	_group setVariable ["gang_deputy",(_x select 2),true];
	_group setVariable ["gang_name",(_x select 3),true];
	_group setVariable ["gang_membersCount",(_x select 4),true];
	_group setVariable ["gang_maxMembers",(_x select 5),true];
	_group setVariable ["gang_bank",(_x select 6),true];
	_group setVariable ["gang_info",(_x select 7),true];


	switch (_x select 0) do { 
		case 1 : {life_copGroup = _group; publicVariable "life_copGroup";[{isNull life_copGroup}, {_this call SunriseServer_system_initFractionGang}, [_x select 0]] call CBA_fnc_waitUntilAndExecute}; 
		case 2 : {life_medGroup = _group; publicVariable "life_medGroup";[{isNull life_medGroup}, {_this call SunriseServer_system_initFractionGang}, [_x select 0]] call CBA_fnc_waitUntilAndExecute}; 
		default {diag_log "ERROR: initFractionGangs _x select 0 - " + str (_x select 0)}; 
	};
	
} forEach _queryResult;
