/*
	
	Filename: 	SunriseClient_factory_update.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _vehicle_gear = life_fact_vehicle getVariable ["Trunk",[[],0]] select 0;

private _gear_list = CONTROL(2400,2402);
lbClear _gear_list;

ctrlSetText [2401,format["%1", (M_CONFIG(getText,"LifeCfgFactories",life_fact_type,"displayName"))]];

{	
	_item = _x;
	_amount = {if (_x#0 isEqualTo _item) exitWith {_x#1}} foreach _vehicle_gear;
	if !(isNil "_amount") then {
		_gear_list lbAdd format["%1x %2",_amount,ITEM_NAME(_item)];
		_gear_list lbSetData [(lbSize _gear_list)-1,_item];
		_gear_list lbSetValue [(lbSize _gear_list)-1,_amount];
		_gear_list lbSetPicture [(lbSize _gear_list)-1,ITEM_ICON(_item)]; 
	};
} foreach (M_CONFIG(getArray,"LifeCfgFactories",life_fact_type,"items"));

if (EQUAL((lbSize _gear_list),0)) then {
	_gear_list lbAdd "Нет предметов для продажи";
};
