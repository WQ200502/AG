/*

	Filename: 	SunriseServer_system_updateHouseContainers.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(params [
    ["_box",objNull,[objNull]],
	["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|SunriseServer_system_updateHouseContainers| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _house = _box getVariable ["house_box_inHouse",objNull];
if (isNull _house) exitWith {};

format ["updateHouseCont:%1:%2:%3",_box getVariable ["house_box_inventory",[[],0]],_box getVariable ["Trunk",[[],0]],_house getVariable ["house_id",-1]] call SunriseServer_database_fireAndForget;