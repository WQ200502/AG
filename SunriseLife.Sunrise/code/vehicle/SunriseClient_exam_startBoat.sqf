/*

	Filename: 	SunriseClient_exam_startBoat.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
	types = driver, boat, air
*/
#include "..\..\script_macros.hpp"
// if ("boat" in life_licenses) exitWith {["У вас уже есть права этой категории","error"] call SunriseClient_gui_bottomNotification;};
private _price = getNumber(missionConfigFile >> "LifeCfgSettings" >> ("life_exam_price_boat"));
private _action = [format ["Для сдачи экзамена вам необходимо заплатить $%1. Деньги будут списаны с вашего банковского счета",[_price] call SunriseClient_system_numberText],"Сдача на права",localize "STR_Global_Yes",localize "STR_Global_No"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};
if (_price > BANK) exitWith {[localize "STR_ATM_NotEnoughFunds","error"] call SunriseClient_gui_bottomNotification};

private _object_pos = getPosATL (_this#0);
life_exam_points = getArray(missionConfigFile >> "LifeCfgSettings" >> ("life_exam_points_boat"));
private _spawnPointPos = life_exam_points select 0;
if !(nearestObjects[_spawnPointPos,["LandVehicle","Ship","Air"],5] isEqualTo []) exitWith {["Точка выдачи занята!","error"] call SunriseClient_gui_bottomNotification};
life_exam_points deleteAt 0;

["atm","take",_price] call SunriseClient_system_myCash;
_exam_car = createVehicle [getText(missionConfigFile >> "LifeCfgSettings" >> ("life_exam_vehicle_boat")),_spawnPointPos,[],0,"NONE"];
waitUntil {!isNil "_exam_car" && {!isNull _exam_car}};
player reveal _exam_car;
[_exam_car] call SunriseClient_system_clearVehicleAmmo;
_exam_car setDir (_spawnPointPos getDir (life_exam_points select 0));
_exam_car setPos _spawnPointPos;
_exam_car disableTIEquipment true;
_exam_car enableRopeAttach false;
life_vehicles pushBack _exam_car;
player moveindriver _exam_car;

life_exam_task = [["EXAM_BOAT"],(life_exam_points select 0),["Экзамен по судовождению начался! Соблюдайте правила движения морских судов","Экзамен по судовождению","boat"]] call SunriseClient_system_createTask;

disableSerialization;
private _timer = ["exam_boat"] call SunriseClient_system_createTimer;
private _exam_time = getNumber(missionConfigFile >> "LifeCfgSettings" >> "life_exam_time_boat");

_exam_car addEventHandler ["EpeContactStart", "life_exam_hit = true"];
[{_this remoteExecCall ["SunriseServer_system_handleVehicle",2]}, [_exam_car,player,_exam_time], 3] call CBA_fnc_waitAndExecute;

[{
	(_this#0) params ["_timer","_exam_time","_object_pos","_exam_car"];
	_timer ctrlSetText format ["Оставшееся время: %1",[_exam_time - time,"MM:SS"] call BIS_fnc_secondsToString];

	if ((life_exam_points#0) distance player < 15) then {
		life_exam_points deleteAt 0;
		life_exam_task setSimpleTaskDestination (life_exam_points select 0);
	};
	private _exam_fail = switch (true) do { 
		case (isNull _exam_car) : {"вы вышли из машины"}; 
		case (_exam_time < time) : {"время истекло"}; 
		case life_exam_hit : {"вы врезались"}; 
		default {""}; 
	};
	if !(_exam_fail isEqualTo "") exitWith {
		[_this#1] call CBA_fnc_removePerFrameHandler;
		["Вы провалили экзамен: " + _exam_fail,"error"] call SunriseClient_gui_bottomNotification;

		_exam_car setVelocity[0, 0, 0];
		player action["Eject", _exam_car];
		titleText ["","BLACK IN"];
		player setPosATL _object_pos;
		player removeSimpleTask life_exam_task;
		deletevehicle _exam_car;
		life_exam_hit = false;
		["exam_boat"] call SunriseClient_gui_DestroyRscLayer;
	};

	if (life_exam_points isEqualTo []) exitWith {
		[_this#1] call CBA_fnc_removePerFrameHandler;
		["Вы сдали экзамен","done"] call SunriseClient_gui_bottomNotification;
		life_exam_task setTaskState "SUCCEEDED"; 
		life_licenses pushBackUnique "boat";
		[getPlayerUID player,"life_licenses",life_licenses] remoteExecCall ["SunriseServer_database_updatePartial",2];

		_exam_car setVelocity[0, 0, 0];
		player action["Eject", _exam_car];
		titleText ["","BLACK IN"];
		player setPosATL _object_pos;
		player removeSimpleTask life_exam_task;
		deletevehicle _exam_car;
		life_exam_hit = false;
		["exam_boat"] call SunriseClient_gui_DestroyRscLayer;
	};
}, 0.25, [_timer,_exam_time + time,_object_pos,_exam_car]] call CBA_fnc_addPerFrameHandler;