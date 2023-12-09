/*

	Filename: 	SunriseClient_crafting_ShopFilter.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;

private _index = param [1,-1,[0]];
if (EQUAL(_index,-1)) exitWith {systemChat "Bad Data Filter"; closeDialog 0;}; //Bad data passing.

SVAR_UINS ["Craft_Shop_Filter",_index];

private _listbox = CONTROL(1401,669);
lbClear _listbox;

private _itemFilter = CONTROL_DATA(668);

private["_recipeIcon","_itemFinal","_price"];
{	
	_itemFinal = getText(_x >> 'finalItem');
	if (isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _itemFinal)) then {
		_recipeIcon = ITEM_ICON(_itemFinal);
	} else {
		_recipeIcon = ([_itemFinal] call SunriseClient_system_itemDetails) select 2;
	};
	
	_listbox lbAdd format["%1",localize (getText(_x >> 'displayName'))];
	
	if (configName _x in life_recipes) then {
		_listbox lbSetTextRight [(lbSize _listbox)-1, "  [ПРИОБРЕТЕНО]"];
		_listbox lbSetColor [(lbSize _listbox)-1,[0.494,0.494,0.494,1]];
		_listbox lbSetColorRight [(lbSize _listbox)-1,[0.494,0.494,0.494,1]];
	} else {
		if (FETCH_CONST(life_donator) >= getNumber(_x >> 'vip')) then {
			_price = getNumber(_x >> 'price');
			if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
			_listbox lbSetTextRight [(lbSize _listbox)-1, format["  $%1", [_price] call SunriseClient_system_numberText]];
		} else {
			_listbox lbSetTextRight [(lbSize _listbox)-1, format["  [VIP-клуб c %1 уровня]", getNumber(_x >> 'vip')]];
			_listbox lbSetColor [(lbSize _listbox)-1,[0.973,0.047,0.047,1]];
			_listbox lbSetColorRight [(lbSize _listbox)-1,[0.973,0.047,0.047,1]];
		};
	};
	
	_listbox lbSetData[(lbSize _listbox)-1,configName _x];
	_listbox lbSetPicture[(lbSize _listbox)-1,_recipeIcon];

} forEach (format ["getText(_x >> 'category') isEqualTo '%1' && getNumber(_x >> 'buyable') isEqualTo 1",_itemFilter] configClasses (missionConfigFile >> "LifeCfgRecipes"));