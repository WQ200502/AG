/*
	
	Filename: 	SunriseClient_system_voteAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_unitID"];
_unitID = CONTROL_DATA(3301);
if (isNil "_unitID") exitwith {};
if (_unitID isEqualTo "") exitWith {};

[_unitID,steamid,player] remoteExec ["SunriseServer_system_vote",RSERV];

hint "Ваш бюллетень оправлен на рассмотрение...";
closeDialog 0;