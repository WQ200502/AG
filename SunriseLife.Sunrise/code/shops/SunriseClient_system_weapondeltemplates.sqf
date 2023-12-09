
/*

	Filename: 	SunriseClient_system_weaponDelTemplates.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogWeaponShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogWeaponShop isNull" call SunriseClient_system_log};
private _index = (lbCurSel 38418);
if (EQUAL(_index,-1)) exitWith {};
private _templatesList = _display displayCtrl 38418;

//Выдергиваем данные о шаблонах с магазина
private _shop = GVAR_UINS ["Weapon_Shop",""];
private _VAR = format["Weapon_Shop_Templates_%1",_shop];
private _templatesData = GVAR_PRNS [_VAR,[]];
private _indexValue = CONTROL_VALUEI(_templatesList,_index);
_templatesData deleteAt _indexValue;//Удалям c профиля
_templatesList lbDelete _index;//Удалям с дисплея

SVAR_PRNS [_VAR,_TemplatesData];//Сейвим
true;