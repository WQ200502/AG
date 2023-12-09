/*

	Filename: 	SunriseClient_crafting_Menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 666)) then {
	if !(createDialog "SunriseDialogCraft") exitWith {};
};

if (life_is_processing) exitWith{
	closeDialog 2001;
	closeDialog 0;
};


private _filter = CONTROL(666,673);

{
	_filter lbAdd localize (getText(_x >> "displayName"));
	_filter lbSetData[(lbSize _filter)-1,configName _x];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgRecipesCategories"));

_filter lbSetCurSel 0;


_display = findDisplay 666;
private _buttons = [
	[2010,2011], [2012,2013], [2014,2015], [2016,2017], [2018,2019], [2020,2021],

	[2022,2023], [2024,2025], [2026,2027], [2028,2029], [2030,2031], [2032,2033],

	[2034,2035], [2036,2037], [2038,2039], [2040,2041], [2042,2043], [2044,2045]
];

{
	ctrlShow [_x select 0,false];
	ctrlShow [_x select 1,false];
} forEach _buttons;

private ["_imageID","_buttonID"];
private _index = 0;
{	
	if (isNull _display) exitWith {};
	if ([getText(_x >> "conditions")] call SunriseClient_system_conditionsCheck) then {
		_imageID = _display displayCtrl ((_buttons select _index) select 0);
		_buttonID = _display displayCtrl ((_buttons select _index) select 1);
	
		_imageID ctrlSetText getText(_x >> "image");
		_buttonID ctrlSetTooltip localize (getText(_x >> "tooltip"));
		_buttonID buttonSetAction getText(_x >> "action");
	
		_imageID ctrlShow true;
		_buttonID ctrlShow true;

		ADD(_index,1);
	};	
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgPadIcons"));