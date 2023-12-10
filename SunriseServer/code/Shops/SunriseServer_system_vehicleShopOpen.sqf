/*

	Filename: 	SunriseServer_system_vehicleShopOpen.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
	["_shop_array",[],[[]]],
	["_unit",ObjNull,[ObjNull]]
];

//Error checks
if (_shop_array isEqualTo [] || isNull _unit) exitWith {["开店时出错，请联系管理员"] remoteExecCall ["hint",_unit];};

private _shop_index = [_shop_array select 0,shops_array] call SunriseClient_system_index;
if (_shop_index isEqualTo -1) exitWith {["开店时出错，请联系管理员"] remoteExecCall ["hint",_unit];};
_shop_array pushBack ((shops_array select _shop_index) select 1);
_shop_array remoteExecCall ["SunriseClient_system_vehicleShopMenuOpen",_unit];