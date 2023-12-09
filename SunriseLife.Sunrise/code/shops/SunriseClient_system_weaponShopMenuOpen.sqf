/*

	Filename: 	SunriseClient_system_weaponShopMenuOpen.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_shop","",[""]],
	["_amount",-1,[-1]]
];
if (server_restartSoon) exitWith {["Надвигается буря. Все магазины закрыты.","error"] call SunriseClient_gui_bottomNotification};
//if (life_inwarzone) exitWith {hint "Вы в зоне боевых действий, магазин закрыт"};
if !(isClass(missionConfigFile >> "LifeCfgWeaponShops" >> _shop)) exitWith {};

private _conditions = M_CONFIG(getText,"LifeCfgWeaponShops",_shop,"conditions");
if !([_conditions] call SunriseClient_system_conditionsCheck) exitWith {hint M_CONFIG(getText,"LifeCfgWeaponShops",_shop,"conditionMessage")};

SVAR_UINS ["Weapon_Shop",_shop];
SVAR_UINS ["Weapon_Shop_Cat",[]];
SVAR_UINS ["Weapon_Shop_Total",0];
SVAR_UINS ["Weapon_Shop_CatSell",[]];
SVAR_UINS ["Weapon_Shop_TotalSell",0];
SVAR_UINS ["Weapon_Shop_Templates",false];

disableSerialization;
if !(createDialog "SunriseDialogWeaponShop") exitwith {};

ctrlSetText[601,format["Наличность: $%1            ",[CASH] call SunriseClient_system_numberText]];
ctrlSetText[38401,M_CONFIG(getText,"LifeCfgWeaponShops",_shop,"displayName")];

//Потроны
private _magsButtonAddCat = CONTROL(38400,38409);
private _magsList = CONTROL(38400,38407);
private _magsCount = CONTROL(38400,38408);
private _magsBG = CONTROL(38400,38410);

//Корзина
private _BasketTitle = CONTROL(38400,38411);
private _BasketTotal = CONTROL(38400,602);
private _BasketList = CONTROL(38400,38412);
private _BasketButtonBuy = CONTROL(38400,38413);
private _BasketCount = CONTROL(38400,38414);
private _BasketButtonDelete = CONTROL(38400,38415);
private _BasketBG = CONTROL(38400,38426);

//Шаблоны
private _TitleTemplate = CONTROL(38400,38417);
private _TemplateList = CONTROL(38400,38418);
private _TemplateEditName = CONTROL(38400,38419);
private _TemplateButtonSave = CONTROL(38400,38420);
private _TemplateButtonLoad = CONTROL(38400,38421);
private _TemplateButtonDelete = CONTROL(38400,38422);
private _TemplateCloseImage = CONTROL(38400,38423);
private _TemplateButtonClose = CONTROL(38400,38424);
private _TemplateBG = CONTROL(38400,38425);

private _filters = CONTROL(38400,38402);
lbClear _filters;
_filters lbAdd localize "STR_Shop_Weapon_ShopInv";
_filters lbAdd localize "STR_Shop_Weapon_YourInv";
_filters lbSetCurSel 0;

_magsButtonAddCat ctrlShow false;
_magsList ctrlShow false;
_magsCount ctrlShow false;
_magsBG ctrlShow false;

_TitleTemplate ctrlShow false;
_TemplateList ctrlShow false;
_TemplateEditName ctrlShow false;
_TemplateButtonSave ctrlShow false;
_TemplateButtonLoad ctrlShow false;
_TemplateButtonDelete ctrlShow false;
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

call SunriseClient_system_shopBoxWeaponCreate;

[] spawn {
	while {true} do {
		if (isNull (findDisplay 38400)) exitWith {
			[] call SunriseClient_system_saveGear;
			call SunriseClient_system_shopBoxDestroy;
			SVAR_UINS ["Weapon_Shop",nil];
			SVAR_UINS ["Weapon_Shop_Cat",nil];
			SVAR_UINS ["Weapon_Shop_Total",nil];
			SVAR_UINS ["Weapon_Shop_CatSell",nil];
            SVAR_UINS ["Weapon_Shop_TotalSell",nil];
			SVAR_UINS ["Weapon_Shop_Templates",nil];
		};
		_totalPrice = GVAR_UINS ["Weapon_Shop_Total",0];
		(CONTROL(38400,601)) ctrlSetText (format ["Наличность: $%1            ",[CASH] call SunriseClient_system_numberText]);
		(CONTROL(38400,602)) ctrlSetText (format ["Общая сумма: $%1",[_totalPrice] call SunriseClient_system_numberText]);
		(CONTROL(38400,38405)) ctrlEnable (_totalPrice <= CASH);;
        (CONTROL(38400,38409)) ctrlEnable (_totalPrice <= CASH);;
		(CONTROL(38400,38413)) ctrlEnable (_totalPrice <= CASH);;
		uiSleep 0.3;
	};
};