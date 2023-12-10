/*

	Filename: 	SunriseServer_system_clothingShopBuy.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
	["_shop","",[""]],
	["_items",[],[[]]],
	["_unit",ObjNull,[ObjNull]]
];

if (_shop isEqualTo "" OR _items isEqualTo [] OR isNull _unit) exitWith {["购买过程中出现错误，请联系管理员","PLAIN"] remoteExecCall ["titleText",_unit];};


private _count = 0;
{
	if ((count _x) > 0) then {
		_count = _count + 1;
	};
} foreach _items;

private _shop_amount = [false,_shop,_count] call SunriseServer_system_handleShops;
if (_shop_amount < _count) exitWith {["商店的库存已用完，可出售的单位 - " + str _shop_amount,"PLAIN"] remoteExecCall ["titleText",_unit];};

[_items] remoteExecCall ["SunriseClient_system_buyClothesDone",_unit];