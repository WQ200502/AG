/*

	Filename: 	SunriseClient_gangs_NewLeaderClient.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(params [
	["_unit",objNull,[objNull]],
	["_group",grpNull,[grpNull]]
]) exitWith {};

if (player isEqualTo _unit && (group player) isEqualTo _group) then
{
	player setRank "COLONEL";
	_group selectLeader _unit;
	
	["info","","Вы стали лидером группировки."] call SunriseClient_message;
};