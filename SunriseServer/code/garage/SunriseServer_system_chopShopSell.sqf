/*

	Filename: 	SunriseServer_system_chopShopSell.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_vehicle",ObjNull,[ObjNull]],
	["_price",0,[0]]
];

if (isNull _vehicle || isNull _unit) exitWith  {
	{life_action_inUse = false} remoteExecCall ["call",_unit];
};

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
private _v_id = _dbInfo#0;

if (_v_id in life_sold_usedcars) exitWith {
	["dupe",format ["|DUPE chopShopSell| VID - '%1' || PID - '%2' || PRICE - '%3'",getPlayerUID _unit,_v_id,_price]] call SunriseServer_system_customLog;
	{life_action_inUse = false} remoteExecCall ["call",_unit];
};

life_sold_usedcars pushBack _v_id;
format ["chopSell:%1",_v_id] call SunriseServer_database_fireAndForget;
["vehicle",format["(ChopShopSell) %1 (%2) sold %3 (%4) for $%5",_unit getVariable "realname",getPlayerUID _unit,typeOf _vehicle,_dbInfo,_price]] call SunriseServer_system_customLog;


[_price] remoteExecCall ["SunriseClient_system_chopShopSellDone",_unit];

deleteVehicle _vehicle;