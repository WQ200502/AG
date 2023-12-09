/*

	Filename: 	SunriseClient_system_revivePlayer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _target = param [0,ObjNull,[ObjNull]];
if (isNull _target) exitWith {};
if (life_inwarzone) exitWith {["Вы в зоне боевых действий, реанимация недоступна","error"] call SunriseClient_gui_bottomNotification};
if !(life_copDuty OR life_medDuty) exitWith {["У вас нет навыков для реанимации. Используйте больничную койку.","error"] call SunriseClient_gui_bottomNotification};
if (life_medDuty && !("srl_defibrillator" in (magazines player))) exitWith {["У вас нет дефибриллятора, необходимого для реанимации в полевых условиях","error"] call SunriseClient_gui_bottomNotification};

if !(LSINCAP(_target)) exitWith {["Цель не в критическом состоянии","error"] call SunriseClient_gui_bottomNotification};
if (!isNil {_target GVAR "draggedBy"}) exitWith {["Его кто-то несет...","error"] call SunriseClient_gui_bottomNotification};
if (_target GVAR ["reviving",ObjNull] isEqualTo player) exitWith {[localize "STR_Medic_AlreadyReviving","error"] call SunriseClient_gui_bottomNotification};
if (player distance _target > 5) exitWith {}; //Not close enough.

if (life_copDuty && ((count units life_copGroup) > LIFE_SETTINGS(getNumber,"life_cop_min") OR (count units life_medGroup) > LIFE_SETTINGS(getNumber,"life_med_min")) && !([player] call SunriseClient_system_isHospitalNear)) exitWith {hint format["Полицейских на острове больше %1, или медиков больше %2, а значит реанимировать можно только через больничную койку или дефибриллятор",LIFE_SETTINGS(getNumber,"life_cop_min"),LIFE_SETTINGS(getNumber,"life_med_min")];};

_target SVAR ["reviving",player,true];
[format[localize "STR_Medic_Progress",GVAR_RNAME(_target)],25,"defib","",true,{(player distance _target > 4 OR _target getVariable ["reviving",ObjNull] != player OR !(_target getVariable ["lifeState",""] isEqualTo "INCAPACITATED"))}] call SunriseClient_system_progressBar;

if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false;_target SVAR ["Reviving",objNull,false];};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; _target SVAR ["Reviving",objNull,false]; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

if (_target GVAR ["reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"};
[_target,"reviving"] call SunriseClient_system_clearGlobalVar;

if !(LSINCAP(_target)) exitWith {hint localize "STR_Medic_RevivedRespawned"};
if (player distance _target > 4) exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]};

if (life_medDuty) then {
	private _reviveFee = LIFE_SETTINGS(getNumber,"life_revive_fee");
	["atm","add",_reviveFee,"revivePlayer"] call SunriseClient_system_myCash;	
	titleText[format[localize "STR_Medic_RevivePayReceive",[_reviveFee] call SunriseClient_system_numberText],"PLAIN"];
};
["PlayerRevived"] spawn SunriseClient_experience_addExp;
[player] remoteExecCall ["SunriseClient_system_revived",_target];