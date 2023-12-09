/*

	Filename: 	SunriseClient_session_updateRequest.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isNil "life_loading_completed") exitWith {};
if !(life_loading_completed) exitWith {};

if (call SunriseClient_system_myCashCheck) exitWith {
	[steamid,0,"Money Hack At Save",format["Money Hack Detect At Save CASH %1 - BANK %2",CASH,BANK]] remoteExecCall ["SunriseServer_system_rcon",RSERV];
	[["dupe",[format["Money Hack Detect At Save CASH %1 - BANK %2 - %3 (%4)",CASH,BANK,GVAR_RNAME(player),steamid]]],"customLog"] call SunriseClient_system_hcExec;
};

[] call SunriseClient_system_saveGear;
_array = [];
{
	_array pushBack (GVAR_MNS _x);
} foreach life_indicators_array;

[[steamid,CASH,BANK,DCASH,life_licenses,life_gear,life_tmp_tax,_array,life_recipes,life_deaths,life_connected,getPosATL player],"updateRequest","DB",false] call SunriseClient_system_hcExec;

life_tmp_tax = 0;