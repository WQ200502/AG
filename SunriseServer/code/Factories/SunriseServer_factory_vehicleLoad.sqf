/*
	
	Filename: 	SunriseServer_factory_vehicleLoad.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team	
	Steam:		Sunrise Team

	
*/
params [
	["_resource", "", [""]],
	["_vehicle", objNull, [objNull]],
	["_object", objNull, [objNull]],
	["_player", objNull, [objNull]],
	["_sleep_time", -1, [-1]]
];
diag_log ["_this",_this];
if (isNull _vehicle) exitWith {};
if (_resource isEqualTo "") exitWith {["error",format ["|SunriseServer_factory_vehicleLoad| PARAMS=%1",_this]] call SunriseServer_system_customLog;["操作错误，联系管理员","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
if (_vehicle getVariable ["factory_use",false]) exitWith {["您只能在一辆车辆上开始装载一次","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
if ([_vehicle] call SunriseClient_system_isTrunkInUse) exitWith {[localize "STR_MISC_VehInvUse","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};

[_vehicle,"factory_use",true] call CBA_fnc_setVarNet;

private _adding_amount = 4;
private _adding_toAdd = 0;
//сколько всего мы можем добавить
[_vehicle] call SunriseClient_system_vehicleWeight params ["_weight","_weightUsed"];
	diag_log ["_weight, _weightUsed",_weight,_weightUsed];
private _adding_max = floor ((_weight - _weightUsed) / getNumber(missionConfigFile >> "LifeCfgVirtualItems" >> _resource >> "weight"));
if (_adding_max < 1) exitWith {[_vehicle,"factory_use"] call SunriseClient_system_clearGlobalVar;["Техника заполнена!","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
	diag_log ["adding max",_adding_max];

while {true} do {
	uiSleep _sleep_time;
	
	if (!alive _vehicle OR isNull _vehicle) exitWith {["Техника уничтожена!","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
	if (_vehicle distance _object > 50) exitWith {["Техника находится не на точке погрузки, подъедьте ближе","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
	if (_adding_toAdd > _adding_max) exitWith {_adding_toAdd = _adding_max;["Техника загружена!","done"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player];};
	if (isNull _player) exitWith {};

	_adding_toAdd = _adding_toAdd + _adding_amount;
	(_adding_toAdd/_adding_max) remoteExecCall ["SunriseClient_system_progressBarUpdate",_player];
		//diag_log ["_adding_toAdd",_adding_toAdd];
};
diag_log ["_adding_toAdd finish",_adding_toAdd];
_adding_toAdd = floor _adding_toAdd;// мега костыль
if !([true,_resource,_adding_toAdd,_vehicle] call SunriseClient_system_handleVehInv) then {
	["error",format ["|SunriseServer_factory_vehicleLoad| resource=%1, _adding_toAdd=%2",_resource,_adding_toAdd]] call SunriseServer_system_customLog;
	["Не удалось добавить предметы в технику. Попробуйте снова или обратитесь к администрации!","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player];
};
[_vehicle,"factory_use"] call SunriseClient_system_clearGlobalVar;