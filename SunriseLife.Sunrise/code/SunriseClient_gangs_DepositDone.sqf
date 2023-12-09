/*

	Filename: 	SunriseClient_gangs_DepositDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _val = param [0,0,[0]];
["atm","take",_val,"gangDeposit"] call SunriseClient_system_myCash;
[format ["Вы перевели $%1 на счёт банды (комиссия 5%)",[_val] call SunriseClient_system_numberText], "done"] call SunriseClient_gui_BottomNotification;
(CONTROL(2700,2705)) ctrlEnable true;
[] call SunriseClient_atm_updateMenu;
life_action_inUse = false;