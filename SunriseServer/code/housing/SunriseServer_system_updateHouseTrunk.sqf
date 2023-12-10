/*

	Filename: 	SunriseServer_system_updateHouseTrunk.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
if !(params [
    ["_box",objNull,[objNull]],
	["_unit",objNull,[objNull]]
]) exitWith {["error",format ["|SunriseServer_system_updateHouseTrunk| PARAMS=%1",_this]] call SunriseServer_system_customLog};

private _house = _box getVariable ["house_box_inHouse",objNull];
if (isNull _house) exitWith {};

private _trunkData = _box getVariable ["Trunk",[[],0]];
format ["updateHouseTrunk:%1:%2",_trunkData,_house getVariable ["house_id",-1]] call SunriseServer_database_fireAndForget;