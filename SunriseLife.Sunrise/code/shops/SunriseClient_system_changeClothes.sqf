/*
	
	Filename: 	SunriseClient_system_changeClothes.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _control = (_this select 0) select 0;
private _selection = (_this select 0) select 1;
if (isNull _control) exitWith {hint localize "STR_Shop_NoDisplay"};
if (EQUAL(_selection,-1)) exitWith {hint localize "STR_Shop_NoSelection";};

if (life_cMenu_lock) exitWith {};
life_cMenu_lock = true;

private _data = _control lbData _selection;
private _price = _control lbValue _selection;

(parseSimpleArray _data) params ["_class","_conditions","_display"];
private _available = (["<t color='#3f6b00'>Есть</t>", format["<t color='#ff0000'>%1</t>",_conditions select 0]] select !([_conditions select 1] call SunriseClient_system_conditionsCheck));

(CONTROL(3100,3102)) ctrlSetStructuredText parseText format ["<t size='1.5' color='%3'>Цена: <t color='#3f6b00'>$%1</t><br/><t size='1' color='%3'>Доступ: <t color='#3f6b00'>%2</t>",[_price] call SunriseClient_system_numberText,_available,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];

switch (life_clothing_filter) do {
	case 0: {removeUniform ShopBoxVehicle; ShopBoxVehicle forceAddUniform _class};
	case 1: {removeHeadGear ShopBoxVehicle; ShopBoxVehicle addHeadgear _class};
	case 2: {removeGoggles ShopBoxVehicle; ShopBoxVehicle addGoggles _class};
	case 3: {removeVest ShopBoxVehicle; ShopBoxVehicle addVest _class};
	case 4: {removeBackpack ShopBoxVehicle; ShopBoxVehicle addBackpack _class};
};
life_cMenu_lock = false;