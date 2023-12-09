/*
	
	Filename: 	SunriseClient_system_requestMedic.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_medicstatus >= 0) exitWith {titleText["Вы уже отправили запрос","PLAIN"]};

private _medicsOnline = {_x != player && {_x in units life_medGroup} && {alive _x}} count playableUnits > 0;
if (_medicsOnline) then {	
	[player,GVAR_RNAME(player)] remoteExecCall ["SunriseClient_system_medicRequest",life_medGroup];
} else {
	[player,GVAR_RNAME(player)] remoteExecCall ["SunriseClient_system_medicRequest",life_copGroup];
};

life_medicstatus = 0;
[player,"medicStatus",life_medicstatus] call CBA_fnc_setVarNet;