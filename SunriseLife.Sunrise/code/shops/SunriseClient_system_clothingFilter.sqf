/*
	
	Filename: 	SunriseClient_system_clothingFilter.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
params [
	["_control",controlNull,[controlNull]],
	["_selection",0,[0]]
];
if (isNull _control) exitWith {hint localize "STR_Shop_NoDisplay"};
if (EQUAL(_selection,-1)) exitWith {hint localize "STR_Shop_NoSelection";};
private _BasketTitle = CONTROL(3100,3107);
private _BasketTotal = CONTROL(3100,602);
private _BasketList = CONTROL(3100,3108);
private _BasketButtonBuy = CONTROL(3100,3109);
private _BasketCount = CONTROL(3100,3110);
private _BasketButtonDelete = CONTROL(3100,3111);
private _BasketBG = CONTROL(3100,3123);
private _clothList = CONTROL(3100,3101);
lbClear _clothList; 

(CONTROL(3100,3102)) ctrlSetStructuredText parseText "";

private _configArray = switch (_selection) do {
    case 0: {M_CONFIG(getArray,"LifeCfgClothShops",VAR(ClothingStore),"uniforms")};
    case 1: {M_CONFIG(getArray,"LifeCfgClothShops",VAR(ClothingStore),"headgear")};
    case 2: {M_CONFIG(getArray,"LifeCfgClothShops",VAR(ClothingStore),"goggles")};
    case 3: {M_CONFIG(getArray,"LifeCfgClothShops",VAR(ClothingStore),"vests")};
    case 4: {M_CONFIG(getArray,"LifeCfgClothShops",VAR(ClothingStore),"backpacks")};
    default {[]};
};

if (EQUAL(_configArray,[])) exitWith {"SunriseClient_system_clothingFilter CFG ПУСТ" call SunriseClient_system_log};

{
    _x params [
		["_class","",[""]],
		["_display","",[""]],
		["_price",0,[0]],
		["_conditions","",[""]],
		["_conditionsMsg","",[""]],
		["_show","",[""]]
	];
	private _details = [_class] call SunriseClient_system_itemDetails;
	if !(EQUAL(_details,[])) then {
	    if ([_show] call SunriseClient_system_conditionsCheck OR [_conditions] call SunriseClient_system_conditionsCheck) then {
		    private _displayName = [_display,_details select 1] select (EQUAL(_display,""));
		    private _index = _clothList lbAdd format["%1",_displayName];
		    _clothList lbSetData [_index,str([_class,[_conditionsMsg,_conditions],_displayName])];
		    if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
		    _clothList lbSetValue [_index,_price];
		    _clothList lbSetPicture [_index,_details select 2];
		    _clothList lbSetTextRight [_index, format["  $%1", [_price] call SunriseClient_system_numberText]];
		    if !([_conditions] call SunriseClient_system_conditionsCheck) then {
			    _clothList lbSetPictureRight [_index, "\sunrise_pack\icons\messages\error.paa"];
		    };
	    };
	} else {
	    format["Нету в аддонах [LifeCfgClothShops select %2] [classname %1]",_class,_selection] call SunriseClient_system_log;
	};
} foreach _configArray;

life_clothing_filter = _selection;
if (VAR(ClothingCat) isEqualTo []) then {
	//Если корзина пуста то закроем её
	_BasketTitle ctrlShow false;
	_BasketTotal ctrlShow false;
	_BasketList ctrlShow false;
	_BasketButtonBuy ctrlShow false;
	_BasketCount ctrlShow false;
	_BasketButtonDelete ctrlShow false;
	_BasketBG ctrlShow false;
};