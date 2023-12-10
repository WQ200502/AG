/*

	Filename:   SunriseServer_system_fetchPlayerHouses.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
#include "\SunriseServer\script_macros.hpp"
private _uid = param [0,"",[""]];
if (_uid isEqualTo "") exitWith {};

private _queryResult = format ["getPlayerHouses:%1:%2",_uid, worldName] call SunriseServer_database_selectFull;
{(nearestObject [_x select 0,_x select 1]) allowDamage false} forEach _queryResult;

_queryResult