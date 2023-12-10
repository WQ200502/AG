/*

	Filename:	SunriseServer_market_delete.sqf
	Project:	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/

_toDel = param [0,[],[[]]];
if (_toDel isEqualTo []) exitWith {};

market_loaded = false;
publicVariable "market_loaded";

{
	format["deleteFromMarket:%1",_x] call SunriseServer_database_fireAndForget;
	["Market",format ["|Market_delete| ID:%1",_x]] call SunriseServer_system_customLog;
} forEach _toDel;
[] spawn SunriseServer_market_init;

market_loaded = true;
publicVariable "market_loaded";
