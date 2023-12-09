
/*

	Filename: 	SunriseClient_system_clothingDelTemplates.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogClothingShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogClothingShop isNull" call SunriseClient_system_log};
private _index = (lbCurSel 3114);
if (EQUAL(_index,-1)) exitWith {};
private _templatesList = _display displayCtrl 3114;

//Выдергиваем данные о шаблонах с магазина
private _VAR = format["Clothing_Shop_Templates_%1",VAR(ClothingStore)];
private _templatesData = GVAR_PRNS [_VAR,[]];
private _indexValue = CONTROL_VALUEI(_templatesList,_index);
_templatesData deleteAt _indexValue;//Удалям c профиля
_templatesList lbDelete _index;//Удалям с дисплея

SVAR_PRNS [_VAR,_TemplatesData];//Сейвим
true;