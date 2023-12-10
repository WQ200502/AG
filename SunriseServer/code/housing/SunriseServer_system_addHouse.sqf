/*

	Filename: 	SunriseServer_system_addHouse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
if !(params [
    ["_uid","",[""]],
    ["_house",objNull,[objNull]],
	["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|SunriseServer_system_addHouse| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _queryResult = format["insertHouse:%1:%2:%3:%4",_uid,[_house] call SunriseServer_system_getHousePos,typeOf _house,WorldName] call SunriseServer_database_insertSingle;
_house setVariable ["house_id",_queryResult,true];
[{
	_date = format["getHouseRent:%1",_this#1] call SunriseServer_database_selectSingleField;
	(_this#0) setVariable ["house_expires",_date,true];
},[_house,_queryResult],5] call CBA_fnc_waitAndExecute;
