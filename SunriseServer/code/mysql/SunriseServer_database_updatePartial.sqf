/*

	Filename:   SunriseServer_database_updatePartial.sqf
	Project:    Sunrise Life
	Author:     Sunrise Team
	Steam:      Sunrise Team
	

*/
if !(params [
	["_pid","",[""]],
	["_type","",[""]],
	["_data",-1,[[],false,-1]]
]) exitWith {["error",format ["|updatePartial| PARAMS=%1",_this]] call SunriseServer_system_customLog};

if (_type isEqualTo "life_is_arrested") then {_data = _data joinString ":"};
format["updatePartial_%1:%2:%3",_type,_data,_pid] call SunriseServer_database_fireAndForget;