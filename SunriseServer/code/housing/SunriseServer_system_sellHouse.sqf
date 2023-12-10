/*

	Filename: 	SunriseServer_system_sellHouse.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
    ["_house",objNull,[objNull]],
	["_price",0,[0]],
	["_player",objNull,[objNull]],
	["_uid","",[""]]
];

if (isNull _house OR isNull _player OR _uid isEqualTo "") exitWith {};
_house setVariable ["house_sold",true,true];
private _houseID = _house getVariable ["house_id",-1];
if (_houseID in life_sold_houses) exitWith {
	["dupe",format ["|DUPE sellHouse| UID - %1 || PRICE - %2",_uid, _price]] call SunriseServer_system_customLog;
};
life_sold_houses pushBack _houseID;

format ["sellHouse:%1",_houseID] call SunriseServer_database_fireAndForget;
[_house,_price] remoteExecCall ["SunriseClient_system_sellHouseDone",_player];
