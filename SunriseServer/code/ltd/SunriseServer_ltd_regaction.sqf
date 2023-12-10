/*

	Filename: 	SunriseServer_ltd_regaction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\..\script_macros.hpp"
params [	
	["_uid","",[""]],
	["_ltdName","",[""]],
	["_ret",objNull,[objNull]]
];

_ret = owner _ret;

private _query = format["ltdAddCheck:%1",_ltdName];
private _queryResult = [_query,2] call SunriseServer_database_asyncCall;

if !(EQUAL(_queryResult,[])) exitWith {
	[false,"Уже есть фирма с таким названием. Придумайте другое!"] remoteExecCall ["SunriseClient_ltd_regActionDone",_ret];
};

_query = format["ltdAdd:%1:%2:%3:%4:%5",_uid,_ltdName,100000,"",[]];
_queryResult = [_query,2] call SunriseServer_database_asyncCall;

[true,_queryResult] remoteExecCall ["SunriseClient_ltd_regActionDone",_ret];