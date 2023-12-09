/*
	
	Filename: 	SunriseClient_admin_info.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
params ["_atmMoney","_cashMoney","_donatorLvl","_licenses","_unit","_radio"];
private _playerLicenses = CONTROL(2900,2904);
private _playerInfo = CONTROL(2900,2903);
private _radio = (missionNamespace getvariable [format ["%1_settings",_radio],[0,nil,["Рации нет"]]]);
private _radio_active = _radio#2 select (_radio#0);

_playerInfo ctrlSetStructuredText parseText format["<t size='0.85'>
Имя: %1<br/>
Банк: $%2 | Налик: $%3<br/>
VIP: %4<br/>
UID: %5<br/>
Отдача: %6<br/>
Настроенная КВ: %7<br/>
Все КВ: %8<br/>",
GVAR_RNAME(_unit),[_atmMoney] call SunriseClient_system_numberText,[_cashMoney] call SunriseClient_system_numberText,_donatorLvl,getPlayerUID _unit,unitRecoilCoefficient _unit,_radio_active, _radio#2];

lbClear _playerLicenses;
{
	_playerLicenses lbAdd (localize (M_CONFIG(getText,"LifeCfgLicenses",_x,"displayName")));
} foreach _licenses;