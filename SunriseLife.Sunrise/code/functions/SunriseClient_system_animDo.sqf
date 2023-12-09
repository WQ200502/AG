/*
	
	Filename: 	SunriseClient_system_animDo.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [	
	["_anim","",[""]],
	["_isSwitchMove",true,[true]],
	["_isPlayMove",true,[true]]
];

if (LSNOTALIVE(player) && {!(EQUAL(_anim,"unconsciousrevivedefault"))}) exitWith {};

[player,_anim,_isSwitchMove,_isPlayMove] remoteExecCall ["SunriseClient_system_animSync",RCLIENT];