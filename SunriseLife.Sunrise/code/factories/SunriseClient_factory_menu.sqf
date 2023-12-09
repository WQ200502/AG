/*
	
	Filename: 	SunriseClient_factory_menu.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _fact_type = param [3,"",[""]];
if !(isClass(missionConfigFile >> "LifeCfgFactories" >> _fact_type)) exitWith {};
life_fact_type = _fact_type;

if !(createDialog "SunriseDialogFactoryOrder") exitWith {};
private _index = [life_fact_type,fact_array] call SunriseClient_system_index;
if (EQUAL(_index,-1)) exitWith {};
private _price = ((fact_array select _index) select 1);

ctrlSetText [7901,format["%1", (M_CONFIG(getText,"LifeCfgFactories",_fact_type,"displayName"))]];
ctrlSetText [7903,format[(M_CONFIG(getText,"LifeCfgFactories",_fact_type,"orderDescription")), [_price] call SunriseClient_system_numberText]];