/*
	
	Filename: 	SunriseClient_system_progressBarSimple.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_title","",[""]],
	["_p_secs",0,[-1]],
	["_customConditions",{false},[{}]]
];

call SunriseClient_actions_inUse;

disableSerialization;
["life_progress","PLAIN"] call SunriseClient_gui_CreateRscLayer;
private _ui = uiNamespace getVariable "life_progress"; 
private _p_bar = _ui displayCtrl 38201; 
private _p_text = _ui displayCtrl 38202; 
_p_text ctrlSetStructuredText parseText format ["<t size='1' align='center' shadow='2'>%1</t>", _title];	
	
private _p_count = 0;
while {true} do {
	uiSleep 0.1;
	_p_count = _p_count + (0.1/_p_secs);
	_p_bar progressSetPosition _p_count;
	if (_p_count >= 1 OR (call SunriseClient_system_isInterrupted)) exitWith {};	
	if (call _customConditions) exitWith {};	
};
["life_progress"] call SunriseClient_gui_DestroyRscLayer;
life_action_inUse = false;