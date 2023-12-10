/*

	Filename: 	SunriseServer_system_unlockHouseContainer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(params [
    ["_house",objNull,[objNull]],
	["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|SunriseServer_system_unlockHouseContainer| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _housePos = [_house] call SunriseServer_system_getHousePos;
private _houseClass = typeOf _house;

private _containers = format["unlockHouseCont:%1",_house getVariable ["house_id",-1]] call SunriseServer_database_selectSingle;
if (_containers isEqualTo []) exitWith {diag_log format ["ERROR fn_unlockHouseContainer:_containers = %1",_containers]};

[_containers select 0,_containers select 1,_containers select 2,_house,_housePos,_houseClass] remoteExecCall ["SunriseClient_system_houseContainer",_unit];
diag_log format ["OK fn_unlockHouseContainer:_containers = %1",[_containers select 0,_containers select 1,_containers select 2,_house,_housePos,_houseClass]];