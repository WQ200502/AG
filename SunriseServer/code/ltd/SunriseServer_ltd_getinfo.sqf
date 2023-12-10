/*

	Filename: 	SunriseServer_ltd_getinfo.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\..\script_macros.hpp"
private _pid = param [0,"",[""]];

if (EQUAL(_pid,"")) exitWith {};

private _query = format ["ltdGetInfo:%1",_pid];
private _queryResult = [_query,2] call SunriseServer_database_asyncCall;

SVAR_MNS [format["ltd_%1",_pid],_queryResult];

true