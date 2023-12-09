/*

	Filename: 	SunriseClient_crafting_Shop.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 1401)) then {
	if !(createDialog "SunriseDialogCraftShop") exitWith {};
};
 
private _filter = CONTROL(1401,668);

{
	_filter lbAdd localize (getText(_x >> "displayName"));
	_filter lbSetData[(lbSize _filter)-1,configName _x];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgRecipesCategories"));

_filter lbSetCurSel 0;