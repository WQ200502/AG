/*

	Filename: 	SunriseServer_system_removeGang.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_group",grpNull,[grpNull]]
];
if (isNull _group) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};

private _groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

format ["deleteGang:%1",_groupID] call SunriseServer_database_fireAndForget;
[_group] remoteExecCall ["SunriseClient_gangs_Disbanded",_group];

[{deleteGroup _this}, _group, 3] call CBA_fnc_waitAndExecute;