/*

	Filename: 	SunriseServer_system_insurancePayRequest.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "\SunriseServer\script_macros.hpp"
params [
	["_vid",-1,[0]],
	["_pid","",[""]],
	["_unit",ObjNull,[ObjNull]],
	["_type","",[""]],
	["_vehicle","",[""]]
];

if (_vehicle isEqualTo "" ||  isNull _unit || _pid isEqualTo "" || _vid isEqualTo -1) exitWith {
	["error",format ["|insurancePayRequest| PARAMS=%1",_this]] call SunriseServer_system_customLog;
	{life_action_inUse = false} remoteExecCall ["call",_unit];
	["Что то пошло не так при получении страховки, обратитесь к администрации","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit];
};

format ["insuranceDelete:%1:%2:%3",_pid,_vid,_type] call SunriseServer_database_fireAndForget;
private _price = format["insuranceGetPrice:%1:%2:%3",_pid,_vid,_type] call SunriseServer_database_selectSingleField;

if (_price isEqualTo 0) exitWith {
	{life_action_inUse = false} remoteExecCall ["call",_unit];
	["У техники не указана цена, обратитесь к администрации за компенсацией","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_unit];
};

[_vehicle,_price] remoteExecCall ["SunriseClient_system_insurancePayDone",_unit];