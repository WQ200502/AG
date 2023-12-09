/*

	Filename: 	SunriseClient_system_weaponInitTemplates.sqf
	Project: 	Sunrise Altis Life RPG
	Author:		Sunrise Team
	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _display = GVAR_UINS ["SunriseDialogWeaponShop",displayNull];
if (isNull _display) exitWith {"SunriseDialogWeaponShop isNull" call SunriseClient_system_log};

//Переменые дисплея
private _TemplateTitle = CONTROL(38400,38417);
private _TemplateList = CONTROL(38400,38418);
private _TemplateEditName = CONTROL(38400,38419);
private _TemplateButtonSave = CONTROL(38400,38420);
private _TemplateButtonLoad = CONTROL(38400,38421);
private _TemplateButtonDelete = CONTROL(38400,38422);
private _TemplateCloseImage = CONTROL(38400,38423);
private _TemplateButtonClose = CONTROL(38400,38424);
private _TemplateBG = CONTROL(38400,38425);

//Выдергиваем данные о шаблонах с магазина
private _shop = GVAR_UINS ["Weapon_Shop",""];
private _VAR = format["Weapon_Shop_Templates_%1",_shop];
private _templatesData = GVAR_PRNS [_VAR,[]];

//Чекаем если шаблон не отображается то отобразить и наоборот
if !(GVAR_UINS ["Weapon_Shop_Templates",false]) then {
    SVAR_UINS ["Weapon_Shop_Templates",true];
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
	_TemplateTitle ctrlShow true;
	_TemplateList ctrlShow true;
	_TemplateEditName ctrlShow true;
	_TemplateButtonSave ctrlShow true;
	_TemplateButtonLoad ctrlShow true;
	_TemplateButtonDelete ctrlShow true;
	_TemplateCloseImage ctrlShow true;
	_TemplateButtonClose ctrlShow true;
	_TemplateBG ctrlShow true;
	//Анимация
	FADEANIM(_TemplateTitle,0.3)
	FADEANIM(_TemplateList,0.3)
	FADEANIM(_TemplateEditName,0.3)
	FADEANIM(_TemplateButtonSave,0.3)
	FADEANIM(_TemplateButtonLoad,0.3)
	FADEANIM(_TemplateButtonDelete,0.3)
	FADEANIM(_TemplateCloseImage,0.3)
	FADEANIM(_TemplateButtonClose,0.3)
	FADEANIM(_TemplateBG,0.3)
} else {
    SVAR_UINS ["Weapon_Shop_Templates",false];
	//Скрываем
	lbClear _TemplateList;
	_TemplateTitle ctrlShow false;
	_TemplateList ctrlShow false;
	_TemplateEditName ctrlShow false;
	_TemplateButtonSave ctrlShow false;
	_TemplateButtonLoad ctrlShow false;
	_TemplateButtonDelete ctrlShow false;
	_TemplateCloseImage ctrlShow false;
	_TemplateButtonClose ctrlShow false;
	_TemplateBG ctrlShow false;
};