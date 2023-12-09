/*

	Filename: 	SunriseClient_warzones_openVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (isNil {grpPlayer GVAR "gang_name"}) exitWith {[localize "STR_GNOTF_CreateGang", "error"] call SunriseClient_gui_BottomNotification};

private _vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {};
if !((typeOf _vehicle) isEqualTo WZ_SETTINGS(getText,"vehClass")) exitWith {};
if (_vehicle GVAR ["opened",false]) exitWith {["Обломки уже вскрыты", "error"] call SunriseClient_gui_BottomNotification};

["Вскрываем обломки",90,"","",true,{}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

if (_vehicle GVAR ["opened",false]) exitWith {["Обломки уже вскрыты", "error"] call SunriseClient_gui_BottomNotification};

[_vehicle,"opened",true] call CBA_fnc_setVarNet;
["Обломки успешно вскрыты!", "done"] call SunriseClient_gui_BottomNotification
