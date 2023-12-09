/*

	Filename: 	SunriseClient_session_insertPlayerInfo.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...


[[steamid,profileName,player],"insertRequest","DB",false] call SunriseClient_system_hcExec;