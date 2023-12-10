/*
	
	Filename: 	SunriseServer_factory_vehicleProcess.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team	
	Steam:		Sunrise Team

	
*/
params [
	["_resource", "", [""]],
	["_resourceProcessed", "", [""]],
	["_vehicle", objNull, [objNull]],
	["_object", objNull, [objNull]],
	["_player", objNull, [objNull]],
	["_perk_level", -1, [-1]],
	["_sleep_time", -1, [-1]]
];
diag_log ["_this",_this];
if (isNull _vehicle) exitWith {};
if (_resource isEqualTo "") exitWith {["error",format ["|SunriseServer_factory_vehicleProcess| PARAMS=%1",_this]] call SunriseServer_system_customLog;["Ошибка в действии, обратитесь к администрации","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
if (_vehicle getVariable ["factory_use",false]) exitWith {["На одной технике можно начать переработку только один раз","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
if ([_vehicle] call SunriseClient_system_isTrunkInUse) exitWith {[localize "STR_MISC_VehInvUse","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};

[_vehicle,"factory_use",true] call CBA_fnc_setVarNet;

private _adding_amount = 4;
private _adding_toAdd = 0;
//сколько всего мы можем добавить
(_vehicle getVariable ["Trunk",[[],0]]) params ["_items","_space"];
private _resource_index = [_resource,_items] call SunriseClient_system_index;
if (_resource_index isEqualTo -1) exitWith {[_vehicle,"factory_use"] call SunriseClient_system_clearGlobalVar;["В технике нет перерабатываемого ресурса","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
private _adding_max = _items # _resource_index # 1;//количество в технике//если перерабатываемый ресурс по весу меньше - переделать
	diag_log ["adding max",_adding_max];
//if (getNumber(missionConfigFile >> "LifeCfgVirtualItems" >> _resource >> "weight") != getNumber(missionConfigFile >> "LifeCfgVirtualItems" >> _resourceProcessed >> "weight")) then {};
while {true} do {
	uiSleep _sleep_time;

	if (!alive _vehicle OR isNull _vehicle) exitWith {["Техника уничтожена!","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
	if (_vehicle distance _object > 50) exitWith {["Техника находится не на точке переработи, подъедьте ближе","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
	if (_adding_toAdd > _adding_max) exitWith {_adding_toAdd = _adding_max;["Ресурс в технике переработан!","done"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player]};
	if (isNull _player) exitWith {};

	_adding_toAdd = _adding_toAdd + _adding_amount;
	(_adding_toAdd/_adding_max) remoteExecCall ["SunriseClient_system_progressBarUpdate",_player];
		//diag_log ["_adding_toAdd",_adding_toAdd];
};
private _adding_proc_toAdd = _adding_toAdd;
if (random 1 > _perk_level) then {_adding_proc_toAdd = round (_adding_proc_toAdd * 0.7)};

if !([false,_resource,_adding_toAdd,_vehicle] call SunriseClient_system_handleVehInv) exitWith {
	["error",format ["|SunriseServer_factory_vehicleProcess| resource=%1, _adding_toAdd=%2",_resource,_adding_toAdd]] call SunriseServer_system_customLog;
	["Не удалось удалить предметы из инвентаря техники. Попробуйте снова или обратитесь к администрации!","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player];
	[_vehicle,"factory_use"] call SunriseClient_system_clearGlobalVar;
};
if !([true,_resourceProcessed,_adding_proc_toAdd,_vehicle] call SunriseClient_system_handleVehInv) then {
	["error",format ["|SunriseServer_factory_vehicleProcess| _resourceProcessed=%1, _adding_proc_toAdd=%2",_resourceProcessed,_adding_proc_toAdd]] call SunriseServer_system_customLog;
	["Не удалось добавить предметы в технику. Попробуйте снова или обратитесь к администрации!","error"] remoteExecCall ["SunriseClient_gui_bottomNotification",_player];
};
[_vehicle,"factory_use"] call SunriseClient_system_clearGlobalVar;