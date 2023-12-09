/*
	
	Filename: 	SunriseClient_admin_TpHere.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(call life_isAdmin) exitWith {closeDialog 0;};

private _unit = call compile format["%1", CONTROL_DATA(2902)];
if (isNil "_unit" OR {isNull _unit}) exitwith {};
if (_unit isEqualTo player) exitWith {hint localize "STR_ANOTF_Error"};

_unit setPosATL (getPosATL player);
player reveal _unit;
 
[format["Вы телепортировали %1 к себе",GVAR_RNAME(_unit)], "done"] call SunriseClient_gui_BottomNotification;