/*
	
	Filename: 	SunriseClient_system_demoChargeTimer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
["life_timer","PLAIN"] call SunriseClient_gui_CreateRscLayer;
private _uiDisp = GVAR_UINS "life_timer";
private _timer = _uiDisp displayCtrl 38301;
private _time = time + (15 * 60);

while {true} do {
	if (isNull _uiDisp) then {
		["life_timer","PLAIN"] call SunriseClient_gui_CreateRscLayer;
		_uiDisp = GVAR_UINS "life_timer";
		_timer = _uiDisp displayCtrl 38301;
	};
	if (round(_time - time) < 1) exitWith {};
	if !(fed_bank GVAR ["chargeplaced",false]) exitWith {};
	_timer ctrlSetText format["%1",[(_time - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	uiSleep 0.08;
};
["life_timer"] call SunriseClient_gui_DestroyRscLayer;
["FedExplosion"] spawn SunriseClient_experience_addExp;