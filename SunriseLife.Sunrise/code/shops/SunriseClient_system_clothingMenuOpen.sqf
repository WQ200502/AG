/*
	
	Filename: 	SunriseClient_system_clothingMenuOpen.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_shop","",[""]],
	["_amount",-1,[-1]]
];
if (_amount < 0) exitWith {hint "В магазине закончился ассортимент, зайдите позже"}; 

disableSerialization;
createDialog "SunriseDialogClothingShop";
waitUntil {!isNull (findDisplay 3100)};

ctrlSetText [3103,M_CONFIG(getText,"LifeCfgClothShops",_shop,"displayName")];
ctrlSetText[601,format["Наличность: $%1",[CASH] call SunriseClient_system_numberText]];

VAR(ClothingStore) = _shop;
VAR(ClothingCat) = [];
VAR(ClothingTotal) = 0;
VAR(ClothingTemplates) = false;
VAR(ClothingBackPackCount) = false;

life_oldClothes = PUNIFORM;
life_olduniformItems = PUNIFORM_ITEMS;
life_oldBackpack = PBACKPACK;
life_oldBackpackItems = PBACKPACK_ITEMS;
life_oldVest = PVEST;
life_oldVestItems = PVEST_ITEMS;
life_oldGlasses = PGOOGLES;
life_oldHat = PHEADGEAR;

call SunriseClient_system_shopBoxClothesCreate;

(findDisplay 3100) displayAddEventHandler ["MouseButtonDown","if ((_this select 1) == 1) then {life_rbm = true}"];
(findDisplay 3100) displayAddEventHandler ["MouseButtonUp","if ((_this select 1) == 1) then {life_rbm = false}"];
(findDisplay 3100) displayAddEventHandler ["MouseMoving", "_this call SunriseClient_system_shopBoxCameraRotate"];
(findDisplay 3100) displayAddEventHandler ["MouseZChanged", "_this call SunriseClient_system_shopBoxCameraZoom"];

life_cMenu_lock = false;
//Фильтр
private _filter = CONTROL(3100,3105);
//Корзина
private _BasketTitle = CONTROL(3100,3107);
private _BasketTotal = CONTROL(3100,602);
private _BasketList = CONTROL(3100,3108);
private _BasketButtonBuy = CONTROL(3100,3109);
private _BasketCount = CONTROL(3100,3110);
private _BasketButtonDelete = CONTROL(3100,3111);
private _BasketBG = CONTROL(3100,3123);
//Шаблоны
private _TitleTemplate = CONTROL(3100,3113);
private _TemplateList = CONTROL(3100,3114);
private _TemplateEditName = CONTROL(3100,3115);
private _TemplateButtonSave = CONTROL(3100,3116);
private _TemplateButtonLoad = CONTROL(3100,3117);
private _TemplateButtonDelete = CONTROL(3100,3118);
private _TemplateCloseImage = CONTROL(3100,3119);
private _TemplateButtonClose = CONTROL(3100,3120);
private _TemplateBG = CONTROL(3100,3121);

lbClear _filter;
_filter lbAdd localize "STR_Shop_UI_Clothing";
_filter lbAdd localize "STR_Shop_UI_Hats";
_filter lbAdd localize "STR_Shop_UI_Glasses";
_filter lbAdd localize "STR_Shop_UI_Vests";
_filter lbAdd localize "STR_Shop_UI_Backpack";

_filter lbSetCurSel 0;

_TitleTemplate ctrlShow false;
_TemplateList ctrlShow false;
_TemplateEditName ctrlShow false;
_TemplateButtonLoad ctrlShow false;
_TemplateButtonDelete ctrlShow false;
_TemplateButtonSave ctrlShow false;
_TemplateCloseImage ctrlShow false;
_TemplateButtonClose ctrlShow false;
_TemplateBG ctrlShow false;

_BasketTitle ctrlShow false;
_BasketTotal ctrlShow false;
_BasketList ctrlShow false;
_BasketButtonBuy ctrlShow false;
_BasketCount ctrlShow false;
_BasketButtonDelete ctrlShow false;
_BasketBG ctrlShow false;

[] spawn {
	while {true} do {
		if (isNull (findDisplay 3100)) exitWith {
			call SunriseClient_system_shopBoxDestroy;
			VAR(ClothingStore) = nil;
			VAR(ClothingCat) = nil;
			VAR(ClothingTotal) = nil;
			VAR(ClothingTemplates) = nil;
			VAR(ClothingBackPackCount) = nil;
		};
		(CONTROL(3100,601)) ctrlSetText (format ["Наличность: $%1            ",[CASH] call SunriseClient_system_numberText]);
		(CONTROL(3100,602)) ctrlSetText (format ["Общая сумма: $%1",[VAR(ClothingTotal)] call SunriseClient_system_numberText]);
		(CONTROL(3100,3106)) ctrlEnable (CASH >= VAR(ClothingTotal));
        (CONTROL(3100,3109)) ctrlEnable (CASH >= VAR(ClothingTotal));
		uiSleep 0.3;
	};
};

[{isNull (findDisplay 3100)}, {call SunriseClient_system_shopBoxDestroy}] call CBA_fnc_waitUntilAndExecute;