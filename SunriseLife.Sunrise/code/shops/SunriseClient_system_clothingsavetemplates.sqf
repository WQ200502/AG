/*

	Filename: 	SunriseClient_system_weaponSaveTemplates.sqf
	Project: 	Platinum Altis Life RPG
	Author:		Platinum Team
	E-mail:		Platinum Team
	Web:		https://platinumrp.club
	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogClothingShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogClothingShop isNull" call SunriseClient_system_log};
if (VAR(ClothingCat) isEqualTo []) exitWith {titleText ["В корзине нет нечего!","PLAIN"]};

private _templatName = ctrlText 3115;
if (_templatName in [""," "]) exitWith {titleText ["Подпишите название шаблона!","PLAIN"]};

private _templateList = _display displayCtrl 3114;

//перезаписоваем массив Корзины убрав лищние данные
private _newTemplate = VAR(ClothingCat) apply {[_x select 0, _x select 1]};


//Выдергиваем данные о шаблонах с магазина
private _VAR = format["Clothing_Shop_Templates_%1",VAR(ClothingStore)];
private _templatesData = GVAR_PRNS [_VAR,[]];
_indexData = _templatesData pushBack [_templatName,_newTemplate];//Проталкиваем к остальным шаблонам
SVAR_PRNS [_VAR,_templatesData];//Сейвим в профиль

//Доб. сам созданый шаблон в список на дисплее
_index = _templateList lbAdd format["%1",_templatName];
_templateList lbSetData [_index,str(_newTemplate)];
_TemplateList lbSetValue [_index,_indexData];

//Потом надо будет запелить перезапись шалона