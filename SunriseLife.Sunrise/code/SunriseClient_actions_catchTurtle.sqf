/*

	Filename: 	SunriseClient_actions_catchTurtle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private["_obj"];
_obj = cursorObject;
if (isNull _obj OR alive _obj) exitWith {}; //Not valid

if (([true,"turtle",1] call SunriseClient_system_handleInv)) then {
	deleteVehicle _obj;
	[localize "STR_NOTF_CaughtTurtle", "done"] call SunriseClient_gui_BottomNotification;
};