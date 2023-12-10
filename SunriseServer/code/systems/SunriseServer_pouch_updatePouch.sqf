/*

	Filename: 	SunriseServer_pouch_updatePouch.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
    ["_inv",[[],0],[[]]],
	["_unit",objNull,[objNull]]
];
if (isNull _unit) exitWith {};

format ["updatePouch:%1:%2",_inv,getPlayerUID _unit] call SunriseServer_database_fireAndForget;