/*

	Filename: 	SunriseClient_system_resHB.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _bed = param [0,objNull,[objNull]];
private _unit = (crew _bed) select 0;

if (isNil "_unit") exitWith {};
if (isNull _unit) exitWith {};

if !(LSINCAP(_unit)) exitWith {};
if (!isNil {_unit GVAR "draggedBy"}) exitWith {};
if (life_inwarzone) exitWith {["Вы в зоне боевых действий, реанимация недоступна", "error"] call SunriseClient_gui_BottomNotification};
if (_unit GVAR ["reviving",ObjNull] isEqualTo player) exitWith {[localize "STR_Medic_AlreadyReviving", "error"] call SunriseClient_gui_BottomNotification};
_unit SVAR ["reviving",player,true];

[format["Вы реанимируете %1",GVAR_RNAME(_unit)],15,"defib","",true,{(player distance _unit > 4) OR (LSDEAD(_unit) OR _unit GVAR ["reviving",ObjNull] != player)}] call SunriseClient_system_progressBar;
[player,"reviving"] call SunriseClient_system_clearGlobalVar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};

if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
[player] remoteExec ["SunriseClient_system_resHBClient",_unit];
