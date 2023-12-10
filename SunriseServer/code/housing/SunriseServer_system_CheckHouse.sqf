/*

    Filename:   SunriseServer_system_CheckHouse.sqf
    Project:    Sunrise Life
    Author:     Sunrise Team
    Steam:      Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
if !(params [
    ["_house",objNull,[objNull]],
    ["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|SunriseServer_system_CheckHouse| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _housePos = [_house] call SunriseServer_system_getHousePos;

private _isHouseExists = format["isHouseExists:%1:%2",_housePos,typeOf _house] call SunriseServer_database_selectSingleField;
if (_isHouseExists) exitWith {
    _house setVariable ["house_owned",true,true];
    [_house,"Этот дом уже находится в собственности!"] remoteExecCall ["SunriseClient_system_houseMenu",_unit];
  
};
[_house,_housePos] remoteExecCall ["SunriseClient_system_buyHouseDone",_unit];
