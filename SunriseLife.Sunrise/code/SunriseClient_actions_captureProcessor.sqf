/*
	
	Filename: 	SunriseClient_actions_captureProcessor.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _vendor = param [0,ObjNull,[ObjNull]];

if (life_copDuty OR life_medDuty) exitWith {["Вы служите, вы не можете захватывать переработку", "error"] call SunriseClient_gui_BottomNotification};
if !(NOTINVEH(player)) exitWith {[localize "STR_pAct_NotFromVehicle", "error"] call SunriseClient_gui_BottomNotification};
if !(str(_vendor) isEqualTo ((enabledCaptures select BattleIndex) select 0)) exitWith {["Сейчас идет битва не за эту переработку", "error"] call SunriseClient_gui_BottomNotification};
private _gangResource = call compile (LIFE_SETTINGSWORLD(getText,worldName,"life_gangResources"));
if !(_gangResource isEqualType []) exitWith {["Error in config life_gangResources", "error"] call SunriseClient_gui_BottomNotification};
if !(_vendor in _gangResource) exitWith {["STR_PRCNOT_cantBeConroled", "error"] call SunriseClient_gui_BottomNotification};

if (isNil {grpPlayer GVAR "gang_name"}) exitWith {[localize "STR_GNOTF_CreateGang", "error"] call SunriseClient_gui_BottomNotification};
if (grpPlayer GVAR ["gang_license","-1"] isEqualTo "-1") exitWith {["Только прем. организации могут захватывать переработку", "error"] call SunriseClient_gui_BottomNotification};
//if (_vendor GVAR ["inCapture",FALSE]) exitWith {hint localize "STR_pAct_CaptureInProg"};


private _vendorTitle = switch (_vendor) do {
	case coke_processor: {localize "STR_Item_Cocaine"};
	case mari_processor: {localize "STR_Item_Marijuana"};
	case heroin_processor: {localize "STR_Item_Heroin"};
	case meth_processor: {localize "STR_Item_Meth"};
	case uran_processor: {localize "STR_MF_ResGathUranus"};
	case uran_processor_clean: {localize "STR_MF_ResGathUranus"};
};


private _action = [
	format[localize "STR_GNOTF_ProcCaptureConfirm",_vendorTitle],
	localize "STR_GNOTF_ProcCaptureTitle",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;	

if !(_action) exitWith {[localize "STR_GNOTF_CaptureCancel", "error"] call SunriseClient_gui_BottomNotification};

[_vendor,"inCapture",true] call CBA_fnc_setVarNet;
[[0,1],format[localize "STR_GNOTF_ProcCaptureInProgress",GANG_NAME,_vendorTitle]] remoteExecCall ["SunriseClient_system_broadcast",-2];

[localize "STR_GNOTF_ProcCaptureTitle",900,"","",true,{(BattleIndex isEqualTo -1) OR ((getpos player) distance (getpos _vendor) > 10)}] call SunriseClient_system_progressBar;
[_vendor,"inCapture"] call SunriseClient_system_clearGlobalVar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if (BattleIndex isEqualTo -1) OR ((getpos player) distance (getpos _vendor) > 10) exitWith {[localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

[_vendor,"canProcess",[]] call CBA_fnc_setVarNet;

[[0,1],format[localize "STR_GNOTF_ProcCaptureDone",GANG_NAME,_vendorTitle]] remoteExecCall ["SunriseClient_system_broadcast",-2];
[group player,str(_vendor)] remoteExec ["SunriseServer_system_endBattle",2];