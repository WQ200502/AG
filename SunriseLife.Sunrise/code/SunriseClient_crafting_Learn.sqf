/*
	
	Filename: 	SunriseClient_crafting_Learn.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _recipe = param [0,"",[""]];
if (_recipe in life_recipes) exitWith {};

life_recipes pushBackUnique _recipe;
[getPlayerUID player,"life_recipes",life_recipes] remoteExecCall ["SunriseServer_database_updatePartial",2];

[format["Поздравляем! Вы научились создавать %1", localize (M_CONFIG(getText,"LifeCfgRecipes",_recipe,"displayName"))],"done"] call SunriseClient_gui_bottomNotification;