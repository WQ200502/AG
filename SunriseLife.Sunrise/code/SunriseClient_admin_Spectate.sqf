/*
	
	Filename: 	SunriseClient_admin_Spectate.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {closeDialog 0;};

/*
private _unit = call compile format["%1", CONTROL_DATA(2902)];
if (isNil "_unit") exitwith {};
if (isNull _unit) exitWith {};
if (_unit == player) exitWith {hint localize "STR_ANOTF_Error";};
*/

while {dialog} do {
	closeDialog 0;
	uiSleep 0.01;
};

["Initialize", [player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
waitUntil {!isNull (findDisplay 60492)};
AM_Exit = (findDisplay 60492) displayAddEventHandler ["KeyDown","if ((_this select 1) == 68) then {(findDisplay 60492) displayRemoveEventHandler ['KeyDown',AM_Exit];hint 'Слежение остановлено';[""Terminate""] call BIS_fnc_EGSpectator;};false"];

["Вы перешли в режим наблюдателя. Нажмите F10 чтобы прекратить.", "done"] call SunriseClient_gui_BottomNotification;