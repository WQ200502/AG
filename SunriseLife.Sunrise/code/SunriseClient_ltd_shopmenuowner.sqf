/*

	Filename: 	SunriseClient_ltd_shopmenuowner.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};

life_shop_npc = param [0,objNull,[objNull]];
if ([life_shop_npc] call SunriseClient_ltd_isShopInUse) exitWith {hint "Магазин уже используется другим игроком"};

private _owner = life_shop_npc GVAR ["ltdOwner",""];
if (EQUAL(_owner,"")) exitWith {hint "Не удалось определить владелеца фирмы и магазина"};

if !(EQUAL(_owner,steamid) && ISPSIDE(civilian)) exitWith {hint "Вы должны быть в гражданском слоте"};

createDialog "SunriseDialogLTDShopOwner";
waitUntil {!isnull (findDisplay 7800)};

[life_shop_npc,"shop_inUseBy",steamid] call CBA_fnc_setVarNet;
ctrlSetText [7801,format["%1", life_shop_npc GVAR ["shopTitle",""]]];

[7800,7802,7803] call SunriseClient_ltd_shopUpdate;

life_shop_npc spawn {
	while {true} do {
		if !(_this GVAR ["shop_inUseBy",""] isEqualTo steamid) exitWith {
			[_this,"shop_inUseBy"] call SunriseClient_system_clearGlobalVar;
			hint "Магазин уже используется другим игроком.";
			closeDialog 0;
		};

		if (isNull (findDisplay 7800)) exitWith {
			[_this,"shop_inUseBy"] call SunriseClient_system_clearGlobalVar;
			[] call SunriseClient_system_saveGear;
		};

		uiSleep 0.03;
	};
};