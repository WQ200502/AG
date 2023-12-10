/*

	Filename: 	SunriseServer_system_vehicleSell.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
	["_vid",0,[0]],
	["_pid","",[""]],
	["_price",0,[0]],
	["_type","",[""]],
	["_vehicle","",[""]],
	["_unit",ObjNull,[ObjNull]],
	["_unitName","",[""]]
];
if (_vehicle isEqualTo "" || isNull _unit) exitWith {
	{life_action_inUse = false} remoteExecCall ["call",_unit];
};

if (_vid in life_sold_cars) exitWith {
	["dupe",format ["|DUPE vehicleSell| VID - '%1' || PID - '%2' || PRICE - '%3' || TYPE = '%4' || PLAYER ='%5' || CLASSNAME = '%6'",_vid,_pid,_price,_type,_unitName,_vehicle]] call SunriseServer_system_customLog;
	{life_action_inUse = false} remoteExecCall ["call",_unit];
};

life_sold_cars pushBack _vid;
format ["vehicleSell:%1:%2:%3",_pid,_vid,_type] call SunriseServer_database_fireAndForget;
[_vehicle,_price] remoteExecCall ["SunriseClient_garage_SellVehicleDone",_unit];