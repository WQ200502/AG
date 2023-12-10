/*

	Filename: 	SunriseServer_factory_updateFactories.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _getFactories = "factoryGetPrices" call SunriseServer_database_selectFull;
private _fact_array = [];

{
	_x call SunriseServer_factory_processOrders;
	diag_log format["setting prices _forEachIndex = %1 | _x = %2",_forEachIndex,_x];
	_fact_array pushBack [_x#0,_x#3];
} forEach _getFactories;

diag_log format["setting prices _fact_array = %1",_fact_array];
missionNamespace setVariable ["fact_array",_fact_array,true];	
/*****************************************************************************************/
private _getFactoriesItems = "factoryGetItemPrices" call SunriseServer_database_selectFull;
private _fact_items = [];

{
	_x params ["_fact_type","_fact_item","_item_price"];
	diag_log format["setting prices _forEachIndex = %1 | _x = %2",_forEachIndex,_x];
	_fact_items pushBack [(_fact_type + "_" + _fact_item),_item_price];
} forEach _getFactoriesItems;

diag_log format["setting prices _fact_items = %1",_fact_items];
missionNamespace setVariable ["fact_items",_fact_items,true];	