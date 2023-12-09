/*
	
	Filename: 	SunriseClient_gangs_Created.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
life_action_gangInUse = false;
private _gangPrice = LIFE_SETTINGS(getNumber,"life_gangPrice");
["atm","take",_gangPrice] call SunriseClient_system_myCash;
[format[localize "STR_GNOTF_CreateSuccess",GANG_NAME,[_gangPrice] call SunriseClient_system_numberText],"done"] call SunriseClient_gui_bottomNotification;