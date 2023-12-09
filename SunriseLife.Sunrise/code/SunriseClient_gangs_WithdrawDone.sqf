/*

	Filename: 	SunriseClient_gangs_WithdrawDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _val = param [0,0,[0]];
["atm","add",_val,"TakeMoneyFromGang"] call SunriseClient_system_myCash;
[format ["Вы сняли со счета банды $%1",[_val] call SunriseClient_system_numberText], "done"] call SunriseClient_gui_BottomNotification;
[] call SunriseClient_gangs_Menu;
life_action_inUse = false;