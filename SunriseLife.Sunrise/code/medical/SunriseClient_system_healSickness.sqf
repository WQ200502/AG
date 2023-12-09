/*

	Filename: 	SunriseClient_system_healSickness.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _bed = param [0,objNull,[objNull]];
private _unit = (crew _bed) select 0;

if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};
if (!isNil {_unit GVAR "draggedBy"}) exitWith {};

[format["Вы лечите гастрит %1",GVAR_RNAME(_unit)],600,"defib","",true,{(player distance _unit > 4) OR (LSDEAD(_unit))}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false;};

if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification;};
[player] remoteExecCall ["SunriseClient_system_healSicknessClient",_unit];
