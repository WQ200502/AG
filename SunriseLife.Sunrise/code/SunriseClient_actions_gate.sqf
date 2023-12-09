/*

	Filename: 	SunriseClient_actions_gate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_target", "_caller", "_actionId", "_gateType"];
private _conditions = M_CONFIG(getText,"LifeCfgGates",_gateType,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {["Вы не можете пользоваться этими воротами!","error"] call SunriseClient_gui_bottomNotification};
if (_target animationPhase 'GateDoor_3' isEqualTo 0) then {_target animate ['GateDoor_3', 5]} else {_target animate ['GateDoor_3', 0]};