/*

	Filename: 	SunriseClient_system_openGovMenu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
*/
#include "..\..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 3200)) then {
	if !(createDialog "SunriseDialogGov") exitWith {};
};

private _balance = CONTROL(3200,3202);
private _price_list = CONTROL(3200,3205);
private _bankButton = CONTROL(3200,3203);

if !(life_gov) then {_bankButton ctrlShow false};
private _legal = ["<t color='#ff3600'>Нелегальна</t>","<t color='#72ff00'>Легальна</t>"] select server_mar_legal;
private _slavery = ["<t color='#ff3600'>Нелегальна</t>","<t color='#72ff00'>Легальна</t>"] select server_slavery;

_balance ctrlSetStructuredText parseText format [
"<t size='1.15'>Казна: <t color='#fff000'>$%1</t></t><br/><br/>
Губернатор: %2<br/>
Налог: %3%4<br/>
Статус марихуаны: %5<br/>
Работорговля: %6<br/>
Порог бедности: $%7<br/><br/>

Копов для нелегала: %8<br/>
Копов минимум: %9<br/>
Медиков минимум: %10",
[server_bank] call SunriseClient_system_numberText,server_govinfo select 1,server_tax,"%",_legal,_slavery,[server_poor] call SunriseClient_system_numberText,call SunriseClient_system_copsForIllegal,LIFE_SETTINGS(getNumber,"life_cop_min"),LIFE_SETTINGS(getNumber,"life_med_min")];

lbClear _price_list;
private _legal_array = [];
private _illegal_array = [];

private["_itemWeight","_index"];
{
	if (isClass (missionConfigFile >> "LifeCfgVirtualItems" >> _x select 0)) then {
		_index = [_x select 0,life_illegal_items] call SunriseClient_system_index;	
		_itemWeight = ITEM_WEIGHT(_x select 0);
		if (EQUAL(_index,-1)) then {
			_legal_array pushBack [ITEM_NAME(_x select 0),_x select 1,_itemWeight];
		} else {
			_illegal_array pushBack [ITEM_NAME(_x select 0),_x select 1,_itemWeight];
		};
	};
} foreach sell_array;

{
	_price_list lbAdd format["%1 (Вес: %2)",_x select 0,_x select 2];
	_price_list lbSetTextRight [(lbSize _price_list)-1, format["  $%1", [_x select 1] call SunriseClient_system_numberText]];
	_price_list lbSetColor [(lbSize _price_list)-1,[0.902,0.553,1,1]];	
} foreach _legal_array;

{
	_price_list lbAdd format["%1 (Вес: %2)",_x select 0,_x select 2];
	_price_list lbSetTextRight [(lbSize _price_list)-1, format["  $%1", [_x select 1] call SunriseClient_system_numberText]];
	_price_list lbSetColor [(lbSize _price_list)-1,[0,1,0,1]];	
} foreach _illegal_array;


_display = findDisplay 3200;

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