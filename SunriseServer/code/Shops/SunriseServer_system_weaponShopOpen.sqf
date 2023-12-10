/*

	Filename: 	SunriseServer_system_weaponShopOpen.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
	["_shop","",[""]],
	["_unit",ObjNull,[ObjNull]]
];

//Error checks
if (_shop isEqualTo "" || isNull _unit) exitWith {["开店时出错，请联系管理员"] remoteExecCall ["hint",_unit];};

private _shop_index = [_shop,shops_array] call SunriseClient_system_index;
if (_shop_index isEqualTo -1) exitWith {["开店时出错，请联系管理员"] remoteExecCall ["hint",_unit];};

[_shop, (shops_array select _shop_index) select 1] remoteExecCall ["SunriseClient_system_weaponShopMenuOpen",_unit];