/*
	
	Filename: 	SunriseClient_system_defuseKit.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _vault = param [0,ObjNull,[ObjNull]];
if (isNull _vault) exitWith {};
if (typeOf _vault != LIFE_SETTINGS(getText,"life_vaultBoxClass")) exitWith {};
if !(_vault GVAR ["chargeplaced",false]) exitWith {[localize "STR_ISTR_Defuse_Nothing", "error"] call SunriseClient_gui_BottomNotification};

[localize "STR_ISTR_Defuse_Process",75,"","",true,{}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
	
[_vault,"chargeplaced"] call SunriseClient_system_clearGlobalVar;
[0,"STR_ISTR_Defuse_Success"] remoteExecCall ["SunriseClient_system_broadcast",life_copGroup];
