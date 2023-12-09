/*

	Filename: 	SunriseClient_message_msgToTargetKeyHandler.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
if (isNull (GVAR_UINS ["SunriseRscMouseTarget",displayNull])) exitWith {false};

private _handled = false;
private _targetKey = 20; //T
private _exitKey = 1; //Esc

switch (true) do {
	case (EQUAL(_code,_targetKey)): {
		_handled = true;
		["SunriseRscMouseTarget"] call SunriseClient_gui_DestroyRscLayer;
		life_uiTarget = cursorObject;		
		[] spawn SunriseClient_message_msgToTargetSendMenu;
		"msgToTargetKeyHandler - life_uiTarget is target and close SunriseRscMouseTarget" call SunriseClient_system_log;
	};
	case (EQUAL(_code,_exitKey)): {
		_handled = true;
		["SunriseRscMouseTarget"] call SunriseClient_gui_DestroyRscLayer;
		"msgToTargetKeyHandler - close SunriseRscMouseTarget" call SunriseClient_system_log;
	};
};

_handled