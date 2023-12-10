/*

	Filename:	SunriseServer_market_buy.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_id",0,[0]],
	["_item","",[""]],
	["_value",0,[0]],
	["_amount",0,[0]],
	["_seller","",[""]],
	["_unit",objNull,[objNull]]
];

private "_status";
{
	if ((_x select 0) == _id) exitWith {
		_status = _x select 7;
	};
} forEach all_ah_items;

if (_status != 0) exitWith {["Этот предмет был недавно продан!","error"] remoteExecCall ["SunriseClient_system_hint",_unit];life_market_wait = false;(owner _unit) publicVariableClient "life_market_wait"}; //NOT FOR SALE ANYMORE

market_loaded = false;
publicVariable "market_loaded";

format["updateMarketStatus:%1",_id] call SunriseServer_database_fireAndForget;
["Market",format ["|Market_buy| ID - '%1' || PID - '%2' (%6) || PRICE - '%3' || AMOUNT = '%4' || SELLER ='%5",_id,getPlayerUID _unit,_value,_amount,_seller,name _unit]] call SunriseServer_system_customLog;

[] spawn SunriseServer_market_init;

market_loaded = true;
publicVariable "market_loaded";

_sellerUnit = objNull;
{if (getPlayerUID _x == _seller) then {_sellerUnit = _x};} foreach allPlayers;
if !(isNull _sellerUnit) then {
	["Ваш лот был выкуплен! Зайдите на склад черного рынка чтобы забрать свои деньги.","done"] remoteExecCall ["SunriseClient_system_hint",_sellerUnit];
};

[_item,_amount,_value] remoteExecCall ["SunriseClient_market_buyDone",_unit];