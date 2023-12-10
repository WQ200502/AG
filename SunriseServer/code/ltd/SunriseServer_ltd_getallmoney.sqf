/*

	Filename: 	SunriseServer_ltd_getallmoney.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\..\script_macros.hpp"
params [
	["_ltdId",-1,[0]],
	["_pid","",[""]],
	["_ret",objNull,[objNull]]
];

if (isNull _ret) exitWith {diag_log "SunriseServer_ltd_getAllMoney: isnul _ret"};
if (EQUAL(_ltdId,-1)) exitWith {diag_log "SunriseServer_ltd_getAllMoney: _ltdId var error"};
if (EQUAL(_pid,"")) exitWith {diag_log "SunriseServer_ltd_getAllMoney: _pid var error"};

private _unitName = GVAR_RNAME(_ret);

_ret = owner _ret;
if !(EQUAL(EOWNER,_ret)) exitWith {diag_log "SunriseServer_ltd_getAllMoney: EOWNER var error"};

private _query = format ["ltdGetInfoBank:%1:%2",_pid,_ltdId];
private _queryResult = [_query,2] call SunriseServer_database_asyncCall;

if (EQUAL(_queryResult,[])) exitWith {
	life_action_inUse = false;
	PVAR_ID("life_action_inUse",_ret);
	[2,"Не получен ответ при выполнении запроса. Сообщите администрации."] remoteExecCall ["SunriseClient_system_broadcast",_ret];
};

private _money = _queryResult select 0;
if (EQUAL(_money,0)) exitWith {
	life_action_inUse = false;
	PVAR_ID("life_action_inUse",_ret);
	[2,"Нет денег на счете фирмы"] remoteExecCall ["SunriseClient_system_broadcast",_ret];
};

private _message = format ["Владелец вывел со своей фирмы ID %1 денег в размере $%2",_ltdId,[_money] call SunriseClient_system_numberText];

private _query = format ["ltdGetAllMoney:%1:%2:%3:%4:%5:%6",_money,_ltdId,_pid,_unitName,"TakeAllMoney",_message];
[_query,1] call SunriseServer_database_asyncCall;

[_money] remoteExecCall ["SunriseClient_ltd_takeMoneyActionDone",_ret];