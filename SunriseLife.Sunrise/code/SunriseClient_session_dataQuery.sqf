/*

	Filename: 	SunriseClient_session_dataQuery.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_session_completed) exitWith {};
//22345200abe84f6090c80d43c5f6c0f6
//private _guid = "BanSystem" callExtension "";
/*private _guid = "22345200abe84f6090c80d43c5f6c0f6";
if (isNil "_guid" OR {_guid isEqualTo ""}) exitWith {
	[["error",format["BanSystem GUID parse failed - %1 - %2 - %3",getPlayerUID player,isNil "_guid",_guid]],"customLog"] call SunriseClient_system_hcExec;
	endMission "LoadingError";
};*/
[steamid,player] remoteExec ["SunriseServer_database_queryRequest",RSERV];