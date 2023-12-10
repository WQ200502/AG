/*

	Filename: 	SunriseServer_system_wantedCheck.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _unit = param [0,objNull,[objNull]];
if (_unit isEqualTo objNull) exitWith {["Errors",format ["|SunriseServer_system_wantedCheck| PARAMS:%1",_this]] call SunriseServer_system_customLog};

private _pid = getPlayerUID _unit;
private _isWanted = format ["isWanted:%1",_pid] call SunriseServer_database_selectSingleField;
if (_isWanted) then {
	["Вы находитесь в базе розыска. За подробностями обратитесь в ближайший полицейский участок","warning"] remoteExecCall ["SunriseClient_gui_BottomNotification",_unit];
} else {
	["Вы не находитесь в базе розыска.","done"] remoteExecCall ["SunriseClient_gui_BottomNotification",_unit];
};