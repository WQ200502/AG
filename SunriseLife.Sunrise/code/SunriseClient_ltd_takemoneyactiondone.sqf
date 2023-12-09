/*

	Filename: 	SunriseClient_ltd_takemoneyactiondone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
private _money = param [0,0,[0]];
life_action_inUse = false;

if (_money <= 0) exitWith {hint "А денег-то нет..."};

private _oldMoney = life_ltdData select 3;
life_ltdData set [3,(_oldMoney - _money)];

["atm","add",_money,"LtdTakeMoney"] call SunriseClient_system_myCash;
hint format["Вы сняли со счета фирмы $%1 и перевели их на свой банковский счет",[_money] call SunriseClient_system_numberText,_plate];

[] spawn SunriseClient_ltd_mainMenu;