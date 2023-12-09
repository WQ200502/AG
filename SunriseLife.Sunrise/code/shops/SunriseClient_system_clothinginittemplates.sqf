/*

	Filename: 	SunriseClient_system_clothingInitTemplates.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogClothingShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogClothingShop isNull" call SunriseClient_system_log};

//Переменые дисплея шаблоны
private _TitleTemplate = CONTROL(3100,3113);
private _TemplateList = CONTROL(3100,3114);
private _TemplateEditName = CONTROL(3100,3115);
private _TemplateButtonSave = CONTROL(3100,3116);
private _TemplateButtonLoad = CONTROL(3100,3117);
private _TemplateButtonDelete = CONTROL(3100,3118);
private _TemplateCloseImage = CONTROL(3100,3119);
private _TemplateButtonClose = CONTROL(3100,3120);
private _TemplateBG = CONTROL(3100,3121);

//Выдергиваем данные о шаблонах с магазина
private _shop = VAR(ClothingStore);
private _VAR = format["Clothing_Shop_Templates_%1",_shop];
private _templatesData = GVAR_PRNS [_VAR,[]];

//Чекаем если шаблон не отображается то отобразить и наоборот
if !(VAR(ClothingTemplates)) then {
    VAR(ClothingTemplates) = true;
	if (count _templatesData > 0) then {
		{
		    //заполнить список сохраненных шаблонов
			_x params ["_name","_arrayData"];// способ хронения [["Template Name",["CLASSNAME",COUNT]]
			_index = _TemplateList lbAdd format["%1",_name];
			_TemplateList lbSetData [_index,str(_arrayData)];
			_TemplateList lbSetValue [_index,_forEachIndex];
		} forEach _templatesData;
	};

	//Показываем
	_TitleTemplate ctrlShow true;
	_TemplateList ctrlShow true;
	_TemplateEditName ctrlShow true;
	_TemplateButtonSave ctrlShow true;
	_TemplateButtonLoad ctrlShow true;
	_TemplateButtonDelete ctrlShow true;
	_TemplateCloseImage ctrlShow true;
	_TemplateButtonClose ctrlShow true;
	_TemplateBG ctrlShow true;
	//Анимация
	FADEANIM(_TitleTemplate,0.3)
	FADEANIM(_TemplateList,0.3)
	FADEANIM(_TemplateEditName,0.3)
	FADEANIM(_TemplateButtonSave,0.3)
	FADEANIM(_TemplateButtonLoad,0.3)
	FADEANIM(_TemplateButtonDelete,0.3)
	FADEANIM(_TemplateCloseImage,0.3)
	FADEANIM(_TemplateButtonClose,0.3)
	FADEANIM(_TemplateBG,0.3)
} else {
    VAR(ClothingTemplates) = false;
	//Скрываем
	lbClear _TemplateList;
	_TitleTemplate ctrlShow false;
	_TemplateList ctrlShow false;
	_TemplateEditName ctrlShow false;
	_TemplateButtonSave ctrlShow false;
	_TemplateButtonLoad ctrlShow false;
	_TemplateButtonDelete ctrlShow false;
	_TemplateCloseImage ctrlShow false;
	_TemplateButtonClose ctrlShow false;
	_TemplateBG ctrlShow false;
};