/*

	Filename: 	SunriseServer_system_handleShops.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_unlimited",false,[false]],//reserved for any case
	["_shop","",[""]],
	["_amount",-1,[-1]]
];

private _shop_index = [_shop,shops_array] call SunriseClient_system_index;
if (_shop_index isEqualTo -1) exitWith {["error",format ["|handleShops| _shop_index isEqualTo -1 PARAMS=%1",_this]] call SunriseServer_system_customLog};

(shops_array#_shop_index) params ["","_shop_amount","_shop_limited"];

if !(_shop_limited) exitWith {_shop_amount};
if (_unlimited) exitWith {_shop_amount};
if (_shop_amount < _amount) exitWith {_shop_amount};

private _shop_amount_left = _shop_amount - _amount;
shops_array set [_shop_index, [(shops_array select _shop_index) select 0,_shop_amount_left,_shop_limited]];

_shop_amount_left