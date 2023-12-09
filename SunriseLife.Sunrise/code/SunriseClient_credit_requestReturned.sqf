/*

	Filename: 	SunriseClient_credit_requestReturned.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
params[
	["_mode",-1,[0]],
	["_credit",0,[0]],
	["_haveCredit",[],[[]]]
];
switch(_mode) do
{
	case 1: {
		if ((_haveCredit select 2) == (steamid)) then {
			["atm","add",_credit,"creditDone"] call SunriseClient_system_myCash;
			life_haveCredit = _haveCredit;
			hint format["Вам выдан кредит в размере $%1\n\nС учетом комиссии вам необходимо будет вернуть $%2 через 7 дней!",[_credit] call SunriseClient_system_numberText,[life_haveCredit select 3] call SunriseClient_system_numberText];		
		} else {
			hint "Что-то пошло не так...";
		};
	};
	
	case 0: {		
		["atm","take",_credit,"creditDone"] call SunriseClient_system_myCash;
		life_haveCredit = [];
		hint format["С вашего банковского счета списано $%1 и вы более не имеете кредитную задолженность.",[_credit] call SunriseClient_system_numberText];		
	};
};

life_creditInUse = false;
[] spawn SunriseClient_pad_openStatus;