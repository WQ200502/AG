/*
	
	Filename: 	SunriseClient_safe_Fix.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _vault = _this select 0;
if !(_vault GVAR ["safe_open",false]) exitWith {[localize "STR_Cop_VaultLocked", "error"] call SunriseClient_gui_BottomNotification};

[localize "STR_Cop_RepairVault",25,"","",true,{}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};

[_vault,"safe_open"] call SunriseClient_system_clearGlobalVar;
[localize "STR_Cop_VaultRepaired", "done"] call SunriseClient_gui_BottomNotification;
