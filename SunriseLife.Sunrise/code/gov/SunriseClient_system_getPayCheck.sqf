/*
	
	Filename: 	SunriseClient_system_getPayCheck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _amount = param [0,0,[0]];
if (_amount isEqualTo 0) exitWith {systemChat "Вам пришел пустой платеж...Какая досада"};
private _text = localize "STR_FSM_ReceivedPay";
if (life_coplevel > 0 AND life_copDuty) then {
	_amount = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_paycheckCop");
	_amount = _amount + ((_amount * 0.05) * life_coplevel);
	_text = "Вы получили зарплату в размере $%1";
	["Paycheck"] spawn SunriseClient_experience_addExp;
};
if (life_medlevel > 0 AND life_medDuty) then {
	_amount = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_paycheckMed");
	_amount = _amount + ((_amount * 0.05) * life_medlevel);
	_text = "Вы получили зарплату в размере $%1";
	["Paycheck"] spawn SunriseClient_experience_addExp;
};

["done","",format["Вы получили зарплату в размере $%1",[_amount] call SunriseClient_system_numberText],true] call SunriseClient_message;
["atm","add",_amount,"paycheck"] call SunriseClient_system_myCash;