/*

	Filename: 	SunriseClient_system_weaponShopFilter.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _Filter = param [1,-1,[0]];
private _shop = GVAR_UINS ["Weapon_Shop",""];
if (EQUAL(_Filter,-1) OR (EQUAL(_shop,""))) exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.
if !(isClass(missionConfigFile >> "LifeCfgWeaponShops" >> _shop)) exitWith {systemChat "Bad Data Filter"; closeDialog 0;};

SVAR_UINS ["Weapon_Shop_Filter",_Filter];

(CONTROL(38400,38407)) ctrlShow false;
(CONTROL(38400,38408)) ctrlShow false;
(CONTROL(38400,38409)) ctrlShow false;
(CONTROL(38400,38410)) ctrlShow false;
(CONTROL(38400,38404)) ctrlSetStructuredText parseText "";

private _itemList = CONTROL(38400,38403);
lbClear _itemList;

private ["_price","_itemInfo"];
switch (_Filter) do {
	case 0: {
		{
			_x params ["_class","_del","_conditions","_conditionsMsg","_show"];
			if ([_class] call SunriseClient_system_isAddonsConfigCheck) then {
				_price = M_CONFIG(getNumber,"LifeCfgItems",_x select 0,"price");
				if (_price > 0 && ([_show] call SunriseClient_system_conditionsCheck OR [_conditions] call SunriseClient_system_conditionsCheck)) then {
					_itemInfo = [_class] call SunriseClient_system_itemDetails;
					_price = round (_price / _del);
					if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
					_index = _itemList lbAdd format["%1",_itemInfo select 1];
					_itemList lbSetTextRight [_index, format["  $%1", [_price] call SunriseClient_system_numberText]];
					_itemList lbSetValue[_index,_del];
					_itemList lbSetData[_index,str([_class,_conditions,_conditionsMsg])];
					_itemList lbSetPicture[_index,_itemInfo select 2];
					if !([_conditions] call SunriseClient_system_conditionsCheck) then {
					    _itemList lbSetPictureRight [_index, "\sunrise_pack\icons\messages\error.paa"];
				    };
				};
			};
		} foreach (M_CONFIG(getArray,"LifeCfgWeaponShops",_shop,"items"));

		(CONTROL(38400,38413)) ctrlSetText ((localize "STR_Global_Buy") + " содержимое корзины");
		
        private _cat = GVAR_UINS ["Weapon_Shop_Cat",[]];
		if (_cat isEqualTo []) then {
	        //Если корзина пуста то закроем её
	       _BasketTitle ctrlShow false;
	       _BasketList ctrlShow false;
	       _BasketButtonBuy ctrlShow false;
	       _BasketCount ctrlShow false;
	       _BasketButtonTemplates ctrlShow false;
	       _BasketButtonDelete ctrlShow false;
	       _BasketBG ctrlShow false;
		};
	};

	case 1: {
		private _config = [];
		private _listedItems = [];

		if (primaryWeapon player != "") then {_config pushBack primaryWeapon player};
		if (secondaryWeapon player != "") then {_config pushBack secondaryWeapon player};
		if (handgunWeapon player != "") then {_config pushBack handgunWeapon player};

		_config = _config + primaryWeaponItems player;
		_config = _config + (assignedItems player);
		_config = _config + (uniformItems player);
		_config = _config + (vestItems player);
		_config = _config + (backPackItems player);

		(CONTROL(38400,38413)) ctrlSetText ((localize"STR_Global_Sell") + " содержимое корзины");
		{
			if (!(_x in _listedItems) && !(EQUAL(_x,""))) then
			{
				_itemInfo = [_x] call SunriseClient_system_itemDetails;
				_listedItems pushBack _x;

				_itemCount = {_x isEqualTo (_itemInfo select 0)} count _config;
				if (_itemCount > 1) then {
					_itemList lbAdd format["[x%2] %1",_itemInfo select 1,_itemCount];
				} else {
					_itemList lbAdd format["%1",_itemInfo select 1];
				};
				_itemList lbSetData[(lbSize _itemList)-1,str([_itemInfo select 0,"",""])];
				_itemList lbSetPicture[(lbSize _itemList)-1,_itemInfo select 2];
			};
		} foreach _config;
		
		private _catSell = GVAR_UINS ["Weapon_Shop_CatSell",[]];
		if (_catSell isEqualTo []) then {
	        //Если корзина пуста то закроем её
	       _BasketTitle ctrlShow false;
	       _BasketList ctrlShow false;
	       _BasketButtonBuy ctrlShow false;
	       _BasketCount ctrlShow false;
	       _BasketButtonTemplates ctrlShow false;
	       _BasketButtonDelete ctrlShow false;
	       _BasketBG ctrlShow false;
		};
	};
};

if (isNil {_this select 0}) then {_itemList lbSetCurSel 0};