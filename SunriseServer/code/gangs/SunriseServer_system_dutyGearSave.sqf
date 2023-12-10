/*

	Filename:   SunriseServer_system_dutyGearSave.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
params [
	["_uid","",[""]],
	["_gear",[],[[]]]
];
if (_uid isEqualTo "") exitWith {["error",format ["|%1| PARAMS=%2",_fnc_scriptname,_this]] call SunriseServer_system_customLog};
format ["saveDutyGear:%1:%2",_uid,_gear] call SunriseServer_database_fireAndForget;