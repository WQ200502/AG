/*

	Filename: 	SunriseClient_system_weaponShopBuySellDone.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_num",-1,[-1]],
	["_item","",[""]],
	["_itemInfo","",[""]],
	["_price",-1,[-1]],
	["_amount",-1,[-1]]
];
private _buyCount = 0;
private _moneyCount = 0;

for "_x" from 1 to _num do {
	if ([_item] call SunriseClient_system_addItem) then {
		_buyCount = _buyCount + 1;
		_moneyCount = _moneyCount + _price;
		format ["Buy %1 [$%2]",_buyCount,_moneyCount] call SunriseClient_system_log;
	};
};
if (_buyCount > 0) then {
	["cash","take",_moneyCount,"weaponShopBuySell"] call SunriseClient_system_myCash;
	player say3D "caching";
	[format[localize "STR_Shop_Weapon_BoughtItems",_itemInfo,[_moneyCount] call SunriseClient_system_numberText,_buyCount,_num],"done"] call SunriseClient_gui_bottomNotification;
} else {["Не удалось купить","error"] call SunriseClient_gui_bottomNotification};

private _shop_name = uiNamespace getVariable ["Weapon_Shop",""];
CONTROL(38400,384111) ctrlSetStructuredText parseText format["<t size = '1.3' font='PuristaMedium' align='center'>%1</t>",M_CONFIG(getText,"LifeCfgWeaponShops",_shop_name,"displayName")];
CONTROL(38400,38411) ctrlSetStructuredText parseText format["<t size = '1.15' font='PuristaMedium' align='center'>Наличность: <t color='#00ff00'>$%1</t><br/>Банковский счет: <t color='#00ff00'>$%2",[CASH] call SunriseClient_system_numberText,[BANK] call SunriseClient_system_numberText];

life_atm_timer = time;
true