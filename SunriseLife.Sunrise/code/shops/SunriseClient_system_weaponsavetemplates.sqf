/*

	Filename: 	SunriseClient_system_weaponSaveTemplates.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogWeaponShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogWeaponShop isNull" call SunriseClient_system_log};
private _cat = GVAR_UINS ["Weapon_Shop_Cat",[]];
if (_cat isEqualTo []) exitWith {titleText ["В корзине нет нечего!","PLAIN"]};

private _templatName = ctrlText 38419;
if (_templatName in [""," "]) exitWith {titleText ["Подпишите название шаблона!","PLAIN"]};

private _templateList = _display displayCtrl 38418;
//перезаписоваем массив Корзины убрав лищние данные
private _newTemplate = _cat apply {[_x select 0, _x select 1,_x select 4]};
//Выдергиваем данные о шаблонах с магазина
private _shop = GVAR_UINS ["Weapon_Shop",""];
private _VAR = format["Weapon_Shop_Templates_%1",_shop];
private _templatesData = GVAR_PRNS [_VAR,[]];
private _indexData = _templatesData pushBack [_templatName,_newTemplate];//Проталкиваем к остальным шаблонам
SVAR_PRNS [_VAR,_templatesData];//Сейвим в профиль

//Доб. сам созданый шаблон в список на дисплее
private _index = _templateList lbAdd format["%1",_templatName];
_templateList lbSetData [_index,str(_newTemplate)];
_TemplateList lbSetValue [_index,_indexData];
//Потом надо будет запелить перезапись шалона