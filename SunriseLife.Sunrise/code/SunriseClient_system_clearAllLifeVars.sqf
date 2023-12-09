/*

	Filename: 	SunriseClient_system_clearAllLifeVars.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {};

_unit SVAR ["tf_sendingDistanceMultiplicator",3.0];

[_unit,"steam64id",steamid] call CBA_fnc_setVarNet;
[_unit,"clientID",clientOwner] call CBA_fnc_setVarNet;

{
	[_unit,_x] call SunriseClient_system_clearGlobalVar;
} forEach ["draggedBy","robbed","surrender","knoked","reviving","medicStatus","realtitle","realname","slave","pvp","lvl","copLevel","medrank","inPBfight","restrained","inDrink","houseRaid","karma","firstAid"];

[] call SunriseClient_system_saveGear;