/*

	Filename: 	SunriseClient_system_isUIDActive.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _uid = param [0,"",[""]];
if (EQUAL(_uid,"")) exitWith {false}; //Bad UID

!(allPlayers findIf {getPlayerUID _x isEqualTo _uid} isEqualTo -1);