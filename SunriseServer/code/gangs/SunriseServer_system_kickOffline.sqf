/*

	Filename: 	SunriseServer_system_kickOffline.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
params [
    ["_unit",objNull,[objNull]],
	["_group",grpNull,[grpNull]],
	["_uid","",[""]],
	["_updateGang",false,[false]]
];
if (isNull _unit OR isNull _group OR _uid isEqualTo "") exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};

if (_updateGang) then {[4,_group,_uid] call SunriseServer_system_updateGang};
if (_group in [life_copGroup,life_medGroup]) then {format ["kickOffline:%1",_uid] call SunriseServer_database_fireAndForget};

[5,_group,_uid] call SunriseServer_system_updateGang;