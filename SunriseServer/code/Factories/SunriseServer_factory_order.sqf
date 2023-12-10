/*

	Filename:   SunriseServer_factory_order.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	
	
*/
params [
	["_fact_type","",[""]],
	["_amount",-1,[0]],
	["_price",-1,[0]],
	["_gang_id",-1,[0]],
	["_player",objNull,[objNull]]
];
if (_fact_type isEqualTo "" || _amount isEqualTo "" || _gang_id isEqualTo -1) exitWith {};

private _orders = format ["ordersGet:%1",_fact_type] call SunriseServer_database_selectSingleField; 
if !(_orders findIf {_x#0 isEqualTo _gang_id} isEqualTo -1) exitWith {["每组不能下超过一个订单!","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
[_amount, _price, _player] remoteExecCall ["SunriseClient_factory_orderDone",_player];

_orders pushBack [_gang_id,_amount];
format ["ordersUpdate:%1:%2",_orders,_fact_type] call SunriseServer_database_fireAndForget;