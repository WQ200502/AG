/*

	Filename: 	SunriseServer_system_updateExp.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
	["_which", -1, [0]],
	["_upd", [], [[]]],
	["_pid", "", [""]]
];

if (_upd isEqualTo [] || {_pid isEqualTo ""} || {_which isEqualTo -1}) exitWith {};

switch (_which) do {
	case 0: {
		_upd params ["_expLevel","_exp","_perkPoints","_action"];
		format ["expUpd0:%1:%2:%3:%4", _expLevel, _exp, _perkPoints, _pid] call SunriseServer_database_fireAndForget;
		["experience",_pid,_action,_exp,_expLevel,_perkPoints] call SunriseServer_system_customLog;
	};

	case 1: {
		_upd params ["_perkPoints","_perks"];
		format ["expUpd1:%1:%2:%3", _perkPoints, _perks, _pid] call SunriseServer_database_fireAndForget;
	};
};