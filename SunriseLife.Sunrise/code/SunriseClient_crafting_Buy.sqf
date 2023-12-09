/*
	
	Filename: 	SunriseClient_crafting_Buy.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (EQUAL((lbCurSel 669),-1)) exitWith {};

private _recipe = CONTROL_DATA(669);
if (_recipe in life_recipes) exitWith {["У вас уже есть такой рецепт","error"] call SunriseClient_gui_bottomNotification};

private _vip = M_CONFIG(getNumber,"LifeCfgRecipes",_recipe,"vip");
if (FETCH_CONST(life_donator) < _vip) exitWith {[format ["Данный рецепт доступен с %1 уровня донатора",_vip],"error"] call SunriseClient_gui_bottomNotification};

private _price = M_CONFIG(getNumber,"LifeCfgRecipes",_recipe,"price");
if (FETCH_CONST(life_donator) > 0) then {_price = [_price] call SunriseClient_system_discount};
if (CASH < _price) exitWith {["У вас недостаточно денег на руках","error"] call SunriseClient_gui_bottomNotification};

["cash","take",_price] call SunriseClient_system_myCash;

life_recipes pushBackUnique _recipe;
[getPlayerUID player,"life_recipes",life_recipes] remoteExecCall ["SunriseServer_database_updatePartial",2];

[format["Поздравляем! Вы научились создавать %1", localize (M_CONFIG(getText,"LifeCfgRecipes",_recipe,"displayName"))],"done"] call SunriseClient_gui_bottomNotification;

[nil,(GVAR_UINS["Craft_Shop_Filter",0])] call SunriseClient_crafting_ShopFilter;