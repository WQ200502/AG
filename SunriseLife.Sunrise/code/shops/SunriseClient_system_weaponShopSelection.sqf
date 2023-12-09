/*

	Filename: 	SunriseClient_system_weaponShopSelection.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_control",controlNull,[controlNull]],
	["_index",-1,[0]]
];
if (isNull _control OR EQUAL(_index,-1)) exitWith {closeDialog 0;}; //Bad data

//Патроны
private _priceTag = CONTROL(38400,38404);
private _itemButtonAddCat = CONTROL(38400,38405);
private _magsButtonAddCat = CONTROL(38400,38409);
private _magsList = CONTROL(38400,38407);
private _magsCount = CONTROL(38400,38408);
private _magsBG = CONTROL(38400,38410);

private _lbData = CONTROL_DATAI(_control,_index);
(parseSimpleArray _lbData) params ["_item","_conditions","_conditionsMsg"];
private _itemInfo = [_item] call SunriseClient_system_itemDetails;

[_item,_itemInfo select 4] spawn SunriseClient_system_shopBoxWeaponRotate;

private _infoDesc = if !(EQUAL((_itemInfo select 3),"")) then {
	format["%1",_itemInfo select 3];
} else {""};

private _Filter = GVAR_UINS["Weapon_Shop_Filter",0];
if (EQUAL(_Filter,1)) then {
	_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%3'>Цена продажи: <t color='#3f6b00'>$%1</t><br/><br/><t size='0.85' color='%3'>%2</t>",0,_infoDesc,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];
} else {
	private _priceMulti = CONTROL_VALUEI(_control,_index);
	private _price = round (M_CONFIG(getNumber,"LifeCfgItems",_item,"price") / _priceMulti);
	if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
	private _available = (["<t color='#3f6b00'>Есть</t>", format["<t color='#ff0000'>%1</t>",_conditionsMsg]] select !([_conditions] call SunriseClient_system_conditionsCheck));

	if (_price > CASH) then {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%5'>Цена: <t color='#3f6b00'>$%1</t><br/><t size='0.85' color='%5'>Не хватает: <t color='#ff0000'>$%2</t><br/><t size='0.85' color='%5'>Доступ: %3<br/><br/><t size='0.85' color='%5'>%4</t>",[_price] call SunriseClient_system_numberText,[_price - CASH] call SunriseClient_system_numberText,_available,_infoDesc,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];
	} else {
		_priceTag ctrlSetStructuredText parseText format ["<t size='0.85' color='%4'>Цена: <t color='#3f6b00'>$%1</t><br/><t size='0.85' color='%4'>Доступ: <t color='#3f6b00'>%2</t><br/><br/><t size='0.85' color='%4'>%3</t>",[_price] call SunriseClient_system_numberText,_available,_infoDesc,GVAR_PRNS ['GUI_V3_TXT_HTML','#000000']];
	};

	if (count (_itemInfo select 7) > 0 && !(_item in LIFE_SETTINGS(getArray,"life_gatherTools"))) then {
		lbClear _magsList;
		private ["_magPrice","_magInfo"];
		{
			if (isClass(missionConfigFile >> "LifeCfgItems" >> _x)) then {
				if !([M_CONFIG(getText,"LifeCfgItems",_x,"conditions")] call SunriseClient_system_conditionsCheck) exitWith {};
				_magPrice = round (M_CONFIG(getNumber,"LifeCfgItems",_x,"price") / _priceMulti);
				if (_magPrice > 0) then {
					if (FETCH_CONST(life_donator) > 0) then {_magPrice = [_magPrice] call SunriseClient_system_discount};
					_magInfo = [_x] call SunriseClient_system_itemDetails;
					_indexMags = _magsList lbAdd format["%1",_magInfo select 1];
					_magsList lbSetTextRight [_indexMags, format["  $%1", [_magPrice] call SunriseClient_system_numberText]];
					_magsList lbSetData[_indexMags,_magInfo select 0];
					_magsList lbSetValue[_indexMags,_priceMulti];
					_magsList lbSetPicture[_indexMags,_magInfo select 2];
				};
			};
		} forEach (_itemInfo select 7);
		
		if !(ctrlshown _magsBG) then {
		    _magsList ctrlShow true;
		    _magsCount ctrlShow true;
		    _magsButtonAddCat ctrlShow true;
		    _magsBG ctrlShow true;
		    FADEANIM(_magsList,0.3)
			FADEANIM(_magsCount,0.3)
			FADEANIM(_magsButton,0.3)
			FADEANIM(_magsBG,0.3)
		};
		_magsList lbSetCurSel -1;
	} else {
	    if (ctrlshown _magsBG) then {
		    _magsList ctrlShow false;
		    _magsCount ctrlShow false;
		    _magsButtonAddCat ctrlShow false;
		    _magsBG ctrlShow false;
		};
	};
	
};