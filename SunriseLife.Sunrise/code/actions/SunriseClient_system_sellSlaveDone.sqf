/*

	Filename: 	SunriseClient_system_sellSlaveDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_slave",objNull,[objNull]],
	["_rate",0,[0]]
];

if (isNull _slave) exitWith {life_action_inUse = false};

["cash","add",_rate,"sellSlave"] call SunriseClient_system_myCash;
hint format [localize "STR_NOTF_SellSlaveDone",[_rate] call SunriseClient_system_numberText,GVAR_RNAME(_slave)];
[["robbery",format["%1 (%2) sold in slavery %3 (%4)",GVAR_RNAME(player),steamid,GVAR_RNAME(_slave),getPlayerUID _slave]],"customLog"] call SunriseClient_system_hcExec;
life_action_inUse = false;