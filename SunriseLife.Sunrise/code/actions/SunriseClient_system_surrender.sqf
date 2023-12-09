/*

	Filename: 	SunriseClient_system_surrender.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
[player,"surrender",true] call CBA_fnc_setVarNet;

while {player GVAR ["surrender",false]}  do {	
	player playAction "Surrender";
	if (LSNOTALIVE(player) or GVAR_RESTRAINED(player)) then {
		[player,"surrender"] call SunriseClient_system_clearGlobalVar;
	};
	uiSleep 0.3;
};

["AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;