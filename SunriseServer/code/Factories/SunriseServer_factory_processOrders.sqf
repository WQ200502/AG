/*

	Filename:   SunriseServer_factory_processOrders.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	
	
*/
params ["_fact_type","_fact_stock","_fact_orders"];
_fact_stock sort true;
diag_log format["processing orders _this = %1",_x];
private _fact_config = getArray(missionConfigFile >> "LifeCfgFactories" >> _fact_type >> "order");
if (_fact_config isEqualTo []) exitWith {["error",format ["|processOrders| _fact_config isEqualTo [] PARAMS=%1",_this]] call SunriseServer_system_customLog};
_fact_config sort true;
if !(count _fact_config isEqualTo count _fact_stock) exitWith {["error",format ["|processOrders| Config and stock are different PARAMS=%1",_this]] call SunriseServer_system_customLog};

{
	_x params ["_order_gang_id","_order_amount"];
	diag_log format["processing order _this = %1",_x];
	
	private _inStock = _fact_stock findIf {(_x select 1) < ((_fact_config select _forEachIndex) select 1) * _order_amount};
	if !(_inStock isEqualTo -1) exitWith {diag_log "processing order notInStock"};
	
	{	
		_cfg_price = (_fact_config select _forEachIndex) select 1;
		_fact_stock set [_forEachIndex, [_x select 0,(_x select 1) - (_cfg_price * _order_amount)]];
		diag_log format["processing factory stock set %1, %2",_forEachIndex, [_x select 0,(_x select 1) - (_cfg_price * _order_amount)]];
	} forEach _fact_stock;
	diag_log format["processing order _fact_stock = %1",_fact_stock];
	format ["updateStock:%1:%2",_fact_stock,_fact_type] call SunriseServer_database_fireAndForget;
	
	private _shop = getText(missionConfigFile >> "LifeCfgFactoriesShops" >> (str _order_gang_id + "_" + _fact_type));
	diag_log format["processing order _shop = %1",_shop];
	_fact_orders deleteAt 0;
	format ["ordersUpdate:%1:%2",_fact_orders,_fact_type] call SunriseServer_database_fireAndForget;
	
	if !(_shop isEqualTo "") then {
		private _shop_index = [_shop,shops_array] call SunriseClient_system_index;
		diag_log format["processing order _shop_index = %1",_shop_index];
		private _shop_amount = (shops_array # _shop_index) # 1;
		diag_log format["processing order _shop_amount = %1",_shop_amount];
		shops_array set [_shop_index, [(shops_array # _shop_index) # 0,_shop_amount + _order_amount]];
		diag_log format["processing shops array %1, %2",_shop_index, [(shops_array # _shop_index) # 0,_shop_amount + _order_amount]];
		{
			if (_order_gang_id isEqualTo (_x getVariable ["gang_id", -1])) exitWith {
				_shop_name = switch (_fact_type) do { 
					case "gun" : {"магазин оружия"}; 
					case "car" : {"автосалон"}; 
					default {"магазин"}; 
				};
				[format["%2 个单位已交付给您的 %1",_shop_name,_order_amount],"done"] remoteExecCall ["SunriseClient_system_hint",_x];
			};
		} forEach allGroups;		
	} else {
		["error",format ["|processOrders| shop is empty PARAMS=%1",_this]] call SunriseServer_system_customLog;
	};
} foreach _fact_orders;
