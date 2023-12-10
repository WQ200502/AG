/*

	Filename: 	SunriseServer_system_wantedRemove.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
private _uid = param [0,"",[""]];
if (_uid isEqualTo "") exitWith {}; //Bad data

format ["wantedRemove:%1",_uid] call SunriseServer_database_fireAndForget;