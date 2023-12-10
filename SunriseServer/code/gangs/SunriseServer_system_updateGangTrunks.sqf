/*

	Filename: 	SunriseServer_system_updateGangTrunks.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
    ["_container",objNull,[objNull]],
	["_user",objNull,[objNull]]
];

if (isNull _container OR isNull _user) exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};
private _varDB = _container getVariable ["VarDB",""];
if (_varDB isEqualTo "") exitWith {["error",format ["|%1| _varDB is EMPTY",_fnc_scriptname]] call SunriseServer_system_customLog};

format ["updateGangTrunk:%1:%2:%3", _container getVariable ["inventory",[[],0]], _container getVariable ["Trunk",[[],0]], _varDB] call SunriseServer_database_fireAndForget;