/*

	Filename: 	SunriseClient_credit_openMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if (true) exitWith {closeDialog 0; hint "На данный момент банк закрыт"};
private["_title","_creditStatus"];
disableSerialization;
if (isNull (findDisplay 3400)) then {
	if !(createDialog "SunriseDialogCredit") exitWith {};
};

_title = CONTROL(3400,3401);
_title ctrlSetText format["Банк Алтиса"];

_creditStatus = CONTROL(3400,3402);

if (count(life_haveCredit) !=0) then {
	ctrlEnable [3404,false];
	_creditStatus ctrlSetStructuredText parseText format ["<t size='1.2'><t color='#ff3600'>У вас есть активный кредит!</t></t><br/><br/>Сумма: $%1<br/>Выдан: %2",[life_haveCredit select 3] call SunriseClient_system_numberText,life_haveCredit select 5];
} else {
	ctrlEnable [3405,false];
	_creditStatus ctrlSetStructuredText parseText format ["<t size='1.2'><t color='#72ff00'>У вас нет кредитов</t></t><br/><br/>Домов во владении: %1<br/>Вы можете взять кредит в размере $%2 под %3%4</br>Кредит выдается на 7 дней. Пока вы не погасите свой долг, вы не сможете продавать свои дома!",life_houses_count,[life_houses_count * LIFE_SETTINGS(getNumber,"life_houseCreditPrice")] call SunriseClient_system_numberText,server_creditTax,"%"];
};
