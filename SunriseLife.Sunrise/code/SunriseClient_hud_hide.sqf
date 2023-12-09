/*

	Filename: 	SunriseClient_hud_hide.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
private _ui = GVAR_UINS ["playerHUD",displayNull];
if (isNull _ui) exitWith {};

["playerHUD"] call SunriseClient_gui_DestroyRscLayer;
if !(LIFE_HANDLE_HUD isEqualTo -1) then {
	[LIFE_HANDLE_HUD] call CBA_fnc_removePerFrameHandler;
	LIFE_HANDLE_HUD = -1;
};