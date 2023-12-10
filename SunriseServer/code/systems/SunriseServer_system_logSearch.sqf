/*

	Filename: 	SunriseServer_system_logSearch.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(params [
	["_cop",objNull,[objNull]],
	["_civ",objNull,[objNull,[]]],
	["_item","",[""]],
	["_amount",-1,[-1]]
]) exitWith {["error",format ["|logSearch| PARAMS=%1",_this]] call SunriseServer_system_customLog};
if (_civ isEqualType []) then {
	["search",getPlayerUID _cop,_cop getVariable ["realname","нет имени"],_civ#0,_civ#1,_item,_amount] call SunriseServer_system_customlog;
} else {
	["search",getPlayerUID _cop,_cop getVariable ["realname","нет имени"],getPlayerUID _civ,_civ getVariable ["realname","нет имени"],_item,_amount] call SunriseServer_system_customlog;
};
