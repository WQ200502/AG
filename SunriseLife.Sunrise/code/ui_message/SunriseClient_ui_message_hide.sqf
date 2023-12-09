/*

	Filename: 	SunriseClient_ui_message_hide.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF

	Web:		http://sunriserp.ru

*/
#include "..\..\script_macros.hpp"
disableSerialization;

//Отключаем сообщения
_display = GVAR_UINS ["RscNewUiMessageArea",displayNull];
if !(isNull _display) then {
	["RscNewUiMessageArea"] call SunriseClient_gui_DestroyRscLayer;
};
ui_message_visible = false;
