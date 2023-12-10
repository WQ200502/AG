/*

	Filename:   SunriseServer_database_updatePlayerIndCfg.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
if !(params [
	["_pid","",[""]],
	["_type","",[""]],
	["_data",false,[false,[]]]
]) exitWith {["error",format ["|updatePlayerIndCfg| PARAMS=%1",_this]] call SunriseServer_system_customLog};

if (_type isEqualTo "life_death_markers") then {_data = _data joinString ":"};
format["updatePlayerIndCfg_%1:%2:%3",_type,_data,_pid] call SunriseServer_database_fireAndForget;