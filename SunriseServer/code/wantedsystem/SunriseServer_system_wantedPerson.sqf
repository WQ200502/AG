/*

	Filename: 	SunriseServer_system_wantedPerson.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {[]};

private _queryResult = format ["wantedPerson:%1",getPlayerUID _unit] call SunriseServer_database_selectSingle;
if (_queryResult isEqualTo []) exitWith {[]};
_queryResult