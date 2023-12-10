/*

	Filename: 	SunriseServer_system_chopShopOwn.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_vehicle",ObjNull,[ObjNull]],
	["_price",0,[0]],
	["_vehicleLimit",0,[0]]
];
private _pid = getPlayerUID _unit;
private _name = GVAR_RNAME(_unit);

if (isNull _unit || isNull _vehicle || _pid isEqualTo "" || _name isEqualTo "") exitWith {
	["error",format ["|chopShopOwn| PARAMS=%1|%2|%3",_this,_pid,_name]] call SunriseServer_system_customLog;
	{life_action_inUse = false} remoteExecCall ["call",_unit];
};
if (format["getPlayerVehicleCount:%1",_pid] call SunriseServer_database_selectSingleField >= _vehicleLimit) exitWith {
	["У вас слишком много машин!","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit];
	{life_action_inUse = false} remoteExecCall ["call",_unit];
};

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
format ["chopOwn:%1:%2",_pid,_dbInfo#0] call SunriseServer_database_fireAndForget;

_vehicle setVariable ["vehicle_info_owners",[[_pid,_name]],true];

[_price] remoteExecCall ["SunriseClient_system_chopShopOwnDone",_unit];

["vehicle",format["(ChopShopOwn) %1 chopped %2 (#%3)",_pid,typeOf _vehicle,_dbInfo#0]] call SunriseServer_system_customLog;