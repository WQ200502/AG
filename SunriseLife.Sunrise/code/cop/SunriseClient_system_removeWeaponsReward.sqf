/*
	
	Filename: 	SunriseClient_system_removeWeaponsReward.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_unit",ObjNull,[ObjNull]],
	["_value",0,[0]]
];

if (isNull _unit OR EQUAL(_value,0)) exitWith {};

if (life_copDuty) then {
	_value = _value call SunriseClient_system_increase;
};

private _gangID = grpPlayer GVAR ["gang_id",-1];
if (grpPlayer isEqualTo life_copGroup) then {
	private _gFund = grpPlayer GVAR ["gang_bank",-1];
	if (EQUAL(_gFund,-1)) then {
		["atm","add",_value] call SunriseClient_system_myCash;
		hint "Не удалось определить баланс группы. Начислено на банковский счет. Сообщите админу!";
	} else {			
		grpPlayer SVAR ["gang_bank",(_gFund + _value),true];
		[[1,grpPlayer,steamid],"updateGang"] call SunriseClient_system_hcExec;
	};
} else {
	["atm","add",_value,"removeWeaponsReward"] call SunriseClient_system_myCash;
};	


hint format["Вы конфисковали у %1 нелегальных предметов на сумму в $%2, эти средства переведены на счет группы",GVAR_RNAME(_unit),[_value] call SunriseClient_system_numberText];