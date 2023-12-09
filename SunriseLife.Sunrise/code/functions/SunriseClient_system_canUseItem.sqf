/*

	Filename: 	SunriseClient_system_canUseItem.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {false};
private _canUse = true;
private _limited_items = LIFE_SETTINGS(getArray,"life_limitedItems");
private _index = [_item,_limited_items] call SunriseClient_system_index;

if (_item in LIFE_SETTINGS(getArray,"life_VipItems")) then {_canUse = (FETCH_CONST(life_donator) > 0 OR {life_copDuty OR life_medDuty OR life_civlevel > 1})};

if (_item in LIFE_SETTINGS(getArray,"life_OnlyVipItems")) then {_canUse = (FETCH_CONST(life_donator) > 0)};

if (_index != -1) then {_canUse = [_limited_items#_index#1] call SunriseClient_system_conditionsCheck};

if (_item in LIFE_SETTINGS(getArray,"life_girlsClothes")) then {_canUse = life_isGirl};

_canUse;