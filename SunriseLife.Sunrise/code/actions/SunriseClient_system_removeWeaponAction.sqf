/*
	
	Filename: 	SunriseClient_system_removeWeaponAction.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,ObjNull,[ObjNull]];
if (isNull _unit) exitWith {};
hint format [localize "STR_NOTF_IllegalWeapSearch",GVAR_RNAME(_unit)];
if (player distance _unit > 5 || (call SunriseClient_system_isInterrupted) || !alive _unit) exitWith {hint localize "STR_NOTF_ActionCancel"};
[player] remoteExecCall ["SunriseClient_system_removeWeapons",_unit];
life_action_inUse = false;