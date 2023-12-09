/*

	Filename: 	SunriseClient_jobs_spawnVehicle.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
_this = _this select 3;
if !(missionNamespace getVariable [format["life_%1_readyToWork",_this],false]) exitWith {["Я не беру людей с улицы. Сходи сначала на биржу труда","error"] call SunriseClient_gui_bottomNotification};

private _price = getNumber(missionConfigFile >> "LifeCfgSettings" >> (format["life_%1_vehicle_price",_this]));
private _action = [format ["Чтобы получить служебную технику необходимо оставить залог в $%1. Вы сможете получить его обратно в офисе. Деньги будут списаны с вашего банковского счета.",[_price] call SunriseClient_system_numberText],"Получение служебной техники",localize "STR_Global_Yes",localize "STR_Global_No"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};

if !(_this call SunriseClient_jobs_clothCheck) exitWith {["Вы должны быть одеты в комплект униформы, которую можно купить в офисе. А так же никакого оружия в руках или на виду.","error"] call SunriseClient_gui_bottomNotification};
private _className = getText(missionConfigFile >> "LifeCfgSettings" >> (format["life_%1_vehicle_class",_this]));
private _spawnPoint = getText(missionConfigFile >> "LifeCfgSettings" >> (format["life_%1_office_spawn",_this]));
private _spawnPointPos = getMarkerPos _spawnPoint;

if (EQUAL(_className,"")) exitWith {["Не задан класс автомобиля в конфиге","error"] call SunriseClient_gui_bottomNotification};
if (EQUAL(_spawnPoint,"")) exitWith {["Не задана точка спауна в конфиге","error"] call SunriseClient_gui_bottomNotification};
if (life_copDuty OR life_medDuty) exitWith {["Работать на службе нельзя!","error"] call SunriseClient_gui_bottomNotification};
if (count(nearestObjects[_spawnPointPos,["LandVehicle","Ship","Air"],5]) > 0) exitWith {["Точка выдачи техники занята!","error"] call SunriseClient_gui_bottomNotification};
if (!isNull (missionNamespace getVariable [format["life_%1_vehicle",_this],objNull])) exitWith {["У вас уже есть рабочая техника!","error"] call SunriseClient_gui_bottomNotification};

if (_price > BANK) exitWith {[localize "STR_ATM_NotEnoughFunds","error"] call SunriseClient_gui_bottomNotification};
["atm","take",_price] call SunriseClient_system_myCash;

private _vehicle = createVehicle [_className,[0,0,999],[],0,"NONE"];
missionNamespace setVariable [format["life_%1_vehicle",_this],_vehicle];
waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
_vehicle allowDamage false;
_vehicle setVectorUp (surfaceNormal _spawnPointPos);
_vehicle setDir (markerDir _spawnPoint);
_vehicle setPos _spawnPointPos;

player reveal _vehicle;
life_vehicles pushBack _vehicle;
[steamid,_vehicle,1] remoteExecCall ["SunriseServer_system_keyManagement",RSERV];

[_vehicle,"vehicle_info_owners",[[steamid,GVAR_RNAME(player)]]] call CBA_fnc_setVarNet;
[_vehicle,"vehicle_limits",_this] call CBA_fnc_setVarNet;
[_vehicle,"insPrice"] call SunriseClient_system_clearGlobalVar;

[_vehicle] call SunriseClient_system_vehSetupRadio;
[_vehicle] call SunriseClient_system_clearVehicleAmmo;
[_vehicle,_this] call SunriseClient_jobs_rentTimer;

_vehicle lock 2;
_vehicle disableTIEquipment true;
_vehicle enableRopeAttach false;
_vehicle allowDamage true;

["Техника ожидает вас на точке выдачи!","done"] call SunriseClient_gui_bottomNotification;

_this spawn SunriseClient_jobs_spawnVehicleTask;