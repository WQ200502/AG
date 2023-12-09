/*

	Filename: 	SunriseClient_message_msgToTargetMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};
call SunriseClient_actions_inUse;
disableSerialization;
["SunriseRscMouseTarget","PLAIN"] call SunriseClient_gui_CreateRscLayer;
private _uiDisp = GVAR_UINS ["SunriseRscMouseTarget",displayNull];
private _mouseText = _uiDisp displayCtrl 666001;
private _infoText = _uiDisp displayCtrl 666002;

_infoText ctrlSetStructuredText parseText format ["<t size='1.15' align='center' valign='middle'><br/>Выберите цель и нажмите <t color='#ffd200'>T</t><br/>Нажмите <t color='#f30404'>Esc</t> чтобы выйти</t>"];
_mouseText ctrlSetStructuredText parseText "";
life_uiTarget = objNull;
CTTM_EHId = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call SunriseClient_message_msgToTargetKeyHandler"];

waitUntil {
	if ([cursorObject] call SunriseClient_system_isVehicleKind) then {
		_mouseText ctrlSetStructuredText parseText format ["<t align='center' size='1.5'>%1</t>",getText(configFile >> "CfgVehicles" >> (typeOf cursorObject) >> "displayName")];
	} else {_mouseText ctrlSetStructuredText parseText ""};
	uiSleep 0.1;
	isNull (GVAR_UINS ["SunriseRscMouseTarget",displayNull]) OR call SunriseClient_system_isInterrupted OR life_interrupted
};

life_action_inUse = false;

if (call SunriseClient_system_isInterrupted OR life_interrupted) then {
	life_interrupted = false;
	["SunriseRscMouseTarget"] call SunriseClient_gui_DestroyRscLayer;
};

(findDisplay 46) displayRemoveEventHandler ["KeyDown", CTTM_EHId];