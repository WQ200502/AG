/*

	Filename: 	SunriseClient_system_firstAid.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
private _target = param [0,ObjNull,[ObjNull]];
if (isNull _target) exitWith {};
if !(LSINCAP(_target)) exitWith {hint "Цель не в критическом состоянии"};
if (!isNil {_target GVAR "draggedBy"}) exitWith {hint "Его кто-то несет..."};
if (player distance _target > 5) exitWith {}; //Not close enough.
if !("srl_bandage" in (magazines player)) exitWith {["Вам необходимо приобрести бинт","error"] call SunriseClient_gui_bottomNotification};


[format["Оказываем первую помощь %1",GVAR_RNAME(_target)],30,"","",true,{player distance _target > 4 OR !(_target getVariable ["lifeState",""] isEqualTo "INCAPACITATED") OR _target getVariable ["firstAid","NOTHEALED"] isEqualTo "HEALED"}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if !(LSINCAP(_target)) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if (player distance _target > 4) exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]};
if (_target getVariable ["firstAid","NOTHEALED"] isEqualTo "HEALED") exitWith {titleText["Ему уже оказали первую помощь","PLAIN"]};

if !(["srl_bandage"] call SunriseClient_system_removeItem) exitWith {["Вам необходимо приобрести бинт","error"] call SunriseClient_gui_bottomNotification};
[_target,"firstAid","HEAL"] call CBA_fnc_setVarNet;