/*

	Filename: 	SunriseClient_system_chopShopSelection.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
    ["_control",controlNull,[controlNull]],
    ["_selection",-1,[0]]
];

//Error checks
if (isNull _control OR _selection isEqualTo -1) exitWith {};

private _vehicle = _control lbData _selection;
_vehicle = call compile format["%1", _vehicle];

private _BtnOwn = CONTROL(39400,39404);
private _BtnSell = CONTROL(39400,39405);
private _priceCtrl = CONTROL(39400,39401);

private _basePrice = M_CONFIG(getNumber,"LifeCfgVehicles",typeOf _vehicle,"price");
if (_basePrice < 1) exitWith {
	["У техники нет стоимости и серийного номера. Ее нельзя перебить или продать","error"] call SunriseClient_gui_bottomNotification; 
	_BtnOwn ctrlEnable false;
	_BtnSell ctrlEnable false;
	_priceCtrl ctrlSetStructuredText parseText format["<t color='%1'>У техники нет стоимости и серийного номера. Ее нельзя перебить или продать</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];
};

_BtnOwn ctrlEnable true;
_BtnSell ctrlEnable true;

private _price = round (_basePrice * 0.30); //цена продажи
private _price2 = [round (_basePrice * 1.15),round (_basePrice * 2.5)] select ((_vehicle GVAR ["tf_side",sideUnknown]) isEqualTo west);
if (IS_VIP) then {_price2 = [_price2] call SunriseClient_system_discount};


_priceCtrl ctrlSetStructuredText parseText format ["<t color='%1'>Стоимость продажи: <t color='#3f6b00'>$%2</t><br/>Стоимость перебивки: <t color='#3f6b00'>$%3</t>",GVAR_PRNS ['GUI_V3_TXT_HTML','#000000'],[(_price)] call SunriseClient_system_numberText,[_price2] call SunriseClient_system_numberText];	