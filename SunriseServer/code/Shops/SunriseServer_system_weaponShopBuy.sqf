/*

	Filename: 	SunriseServer_system_weaponShopBuy.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_shop","",[""]],
	["_num",-1,[-1]],
	["_item","",[""]],
	["_itemInfo","",[""]],
	["_price",-1,[-1]],
	["_unit",ObjNull,[ObjNull]]
];

if (_shop isEqualTo "" OR _num isEqualTo -1 OR _item isEqualTo "" OR _price isEqualTo -1 OR isNull _unit) exitWith {["购买过程中出现错误，请联系管理员","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit]};

private _shop_amount = [(isClass (configFile >> "CfgMagazines" >> _item)),_shop,_num] call SunriseServer_system_handleShops;
if (_shop_amount < _num) exitWith {["商店的库存已用完，可出售的单位 - " + str _shop_amount,"error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit]};

[_num,_item,_itemInfo,_price,_shop_amount] remoteExecCall ["SunriseClient_system_weaponShopBuySellDone",_unit];