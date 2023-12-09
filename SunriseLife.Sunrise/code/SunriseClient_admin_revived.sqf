/*
	
	Filename: 	SunriseClient_admin_revived.sqf
    Project: 	Sunrise Altis Life
	Author:		MakaroFF

*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};
private["_unit"];
_unit = call compile format["%1", CONTROL_DATA(2902)];
if(isNil "_unit" OR isNull _unit) exitwith {closeDialog 0;};

[player] remoteExec ["SunriseClient_admin_revivedPlayer",_unit];