/*

	Filename: 	SunriseServer_system_changePlayerServerMap.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
    ["_uid","",[""]],
    ["_newMap","",[""]],
	["_unit",objNull,[objNull]]
];

if (isNull _unit || _newMap isEqualTo "" || _uid isEqualTo "") exitWith {
    {life_playerTrasnferDone = false} remoteExecCall ["call",_unit];
};

format ["changeMap:%1:%2",_newMap,_uid] call SunriseServer_database_fireAndForget;
{life_playerTrasnferDone = true} remoteExecCall ["call",_unit];