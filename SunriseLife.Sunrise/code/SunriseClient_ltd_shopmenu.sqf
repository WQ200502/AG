/*

	Filename: 	SunriseClient_ltd_shopmenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	
	

*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};

life_shop_npc = param [0,objNull,[objNull]];
if ([life_shop_npc] call SunriseClient_ltd_isShopInUse) exitWith {hint "Магазин уже используется другим игроком"};

createDialog "SunriseDialogLTDShop";
waitUntil {!isnull (findDisplay 7400)};

[life_shop_npc,"shop_inUseBy",steamid] call CBA_fnc_setVarNet;
ctrlSetText [7401,format["%1", life_shop_npc GVAR ["shopTitle",""]]];

[7400,7402] call SunriseClient_ltd_shopUpdate;

life_shop_npc spawn {
	while {true} do {
		if !(_this GVAR ["shop_inUseBy",""] isEqualTo steamid) exitWith {
			[_this,"shop_inUseBy"] call SunriseClient_system_clearGlobalVar;
			hint "Магазин уже используется другим игроком.";
			closeDialog 0;
		};

		if (isNull (findDisplay 7400)) exitWith {
			[_this,"shop_inUseBy"] call SunriseClient_system_clearGlobalVar;
			[] call SunriseClient_system_saveGear;
		};

		uiSleep 0.03;
	};
};