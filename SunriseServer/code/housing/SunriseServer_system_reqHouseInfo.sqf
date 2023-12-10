/*

	Filename: 	SunriseServer_system_reqHouseInfo.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if !(params [
    ["_house",objNull,[objNull]],
    ["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptName,_this]] call SunriseServer_system_customLog};

private _isHouseExists = format["isHouseExists:%1:%2",[_house] call SunriseServer_system_getHousePos, typeOf _house] call SunriseServer_database_selectSingleField;
if (!_isHouseExists) exitWith {
    [_house] remoteExecCall ["SunriseClient_system_houseMenu",_unit];
    _house setVariable ["house_forSell",true,true];
};

_house setVariable ["house_owned",true,true];
[_house,"Этот дом уже находится в собственности!"] remoteExecCall ["SunriseClient_system_houseMenu",_unit];