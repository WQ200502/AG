/*

	Filename:	SunriseServer_market_takeBack.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_id",0,[0]],
	["_item","",[""]],
	["_amount",0,[0]],
	["_unit",objNull,[objNull]]
];

_found = 0;
{
	if ((_x select 0) == _id) exitWith {_found = (_x select 0)};
}forEach all_ah_items;
if (_found isEqualTo 0) exitWith {["Этот предмет был недавно продан!","error"] remoteExecCall ["SunriseClient_system_hint",_unit];life_market_wait = false;(owner _unit) publicVariableClient "life_market_wait"};

market_loaded = false;
publicVariable "market_loaded";

format["deleteFromMarket:%1",_id] call SunriseServer_database_fireAndForget;
["Market",format ["|Market_takeBack| ID - '%1' || PID - '%2' (%3) || ITEM - '%4' || AMOUNT = '%4' || SELLER ='%5'",_id,getPlayerUID _unit,name _unit,_item,_amount]] call SunriseServer_system_customLog;

[] spawn SunriseServer_market_init;

market_loaded = true;
publicVariable "market_loaded";

[_item,_amount] remoteExecCall ["SunriseClient_market_takeBackDone",_unit];
