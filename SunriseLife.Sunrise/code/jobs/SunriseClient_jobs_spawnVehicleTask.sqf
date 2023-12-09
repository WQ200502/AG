/*

	Filename: 	SunriseClient_jobs_spawnVehicleTask.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _spawnPoint = getText(missionConfigFile >> "LifeCfgSettings" >> (format["life_%1_office_spawn",_this]));
if (EQUAL(_spawnPoint,"")) exitWith {};

(_this + " | Spawn vehicle task begin...") call SunriseClient_system_log;

private _spawnPointPos = getMarkerPos _spawnPoint;
private _timer = time + 180;
private _taskName = format["%1_SVT_%2",_this,steamid];
private _vehicle = missionNamespace getVariable [format["life_%1_vehicle",_this],objNull];

[_taskName,player,["Садитесь в машину и покиньте точку выдачи! У вас 3 минуты!","Покинуть офис","walk"],_vehicle,"ASSIGNED",nil,true,false,"",true] call BIS_fnc_setTask;
[_taskName,[_vehicle,true]] call BIS_fnc_taskSetDestination;

(_this + " | Spawn vehicle task waiting...") call SunriseClient_system_log;

waitUntil {uiSleep 1; _vehicle distance _spawnPointPos > 30 OR !alive _vehicle OR isNull _vehicle OR time >= _timer};

switch (true) do {
	case (!alive _vehicle OR time >= _timer) : {[_taskName,"FAILED",true] spawn BIS_fnc_taskSetState; deleteVehicle _vehicle};
	case (isNull _vehicle) : {[_taskName,"FAILED",true] spawn BIS_fnc_taskSetState;};
	case (_vehicle distance _spawnPointPos > 30) : {[_taskName,"SUCCEEDED",true] spawn BIS_fnc_taskSetState};
};

uiSleep 1;

[_taskName] call BIS_fnc_deleteTask;

(_this + " | Spawn vehicle task done") call SunriseClient_system_log;

if (_this isEqualTo "gas") exitWith {
	private _spawnPointPos = getPos oil_zavod_table;
	private _timer = time + 9000;
	private _task = [["GAS_GOTO"],_spawnPointPos,["Отправляйтесь на нефтеперерабатывающий завод и возьмите свой заказ! У вас 1 час 30 минут!","Отправляйтесь на нефтеперерабатывающий завод","meet"]] call SunriseClient_system_createTask;

	waitUntil {uiSleep 1; _vehicle distance _spawnPointPos < 15 OR !alive _vehicle OR isNull _vehicle OR time >= _timer};	
	player removeSimpleTask _task;

	if (_vehicle distance _spawnPointPos < 15) then {
		["Вы добрались до завода!","done"] call SunriseClient_gui_bottomNotification
	} else {
		["Вы не успели добраться до завода!","error"] call SunriseClient_gui_bottomNotification
	};
}; 

if (_this isEqualTo "dlv") exitWith {
	private _spawnPointPos = getMarkerPos "gruz_depo_marker";
	private _timer = time + 900;
	private _task = [["DLV_GOTO"],_spawnPointPos,["Отправляйтесь в депо 'Кавала' и возьмите свой заказ! У вас 15 минут!","Отправляйтесь в депо 'Кавала'","meet"]] call SunriseClient_system_createTask;

	waitUntil {uiSleep 1; _vehicle distance _spawnPointPos < 15 OR !alive _vehicle OR isNull _vehicle OR time >= _timer};	
	player removeSimpleTask _task;

	if (_vehicle distance _spawnPointPos < 15) then {
		["Вы добрались до депо!","done"] call SunriseClient_gui_bottomNotification
	} else {
		["Вы не успели добраться до депо!","error"] call SunriseClient_gui_bottomNotification
	};
};