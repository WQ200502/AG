/*

	Filename: 	SunriseClient_exam_startAir.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

	
	types = driver, boat, air
*/
#include "..\..\script_macros.hpp"
// if ("air" in life_licenses) exitWith {["У вас уже есть права этой категории","error"] call SunriseClient_gui_bottomNotification;};
private _price = getNumber(missionConfigFile >> "LifeCfgSettings" >> ("life_exam_price_air"));
private _action = [format ["Для сдачи экзамена вам необходимо заплатить $%1. Деньги будут списаны с вашего банковского счета",[_price] call SunriseClient_system_numberText],"Сдача на права",localize "STR_Global_Yes",localize "STR_Global_No"] call BIS_fnc_guiMessage;
if !(_action) exitWith {};
if (_price > BANK) exitWith {[localize "STR_ATM_NotEnoughFunds","error"] call SunriseClient_gui_bottomNotification};

private _object_pos = getPos (_this#0);
life_exam_points = getArray(missionConfigFile >> "LifeCfgSettings" >> ("life_exam_points_air"));
private _spawnPointPos = life_exam_points select 0;
if !(nearestObjects[_spawnPointPos,["LandVehicle","Ship","Air"],5] isEqualTo []) exitWith {["Точка выдачи занята!","error"] call SunriseClient_gui_bottomNotification};
life_exam_points deleteAt 0;

["atm","take",_price] call SunriseClient_system_myCash;

private _exam_car = createVehicle [getText(missionConfigFile >> "LifeCfgSettings" >> ("life_exam_vehicle_air")),_spawnPointPos,[],0,"NONE"];
waitUntil {!isNil "_exam_car" && {!isNull _exam_car}};
player reveal _exam_car;
[_exam_car] call SunriseClient_system_clearVehicleAmmo;
_exam_car setDir (_spawnPointPos getDir (life_exam_points select 0));
_exam_car disableTIEquipment true;
_exam_car enableRopeAttach false;
player moveindriver _exam_car;
life_vehicles pushBack _exam_car;
_exam_car allowDamage false;

life_exam_task = [["EXAM_AIR"],(life_exam_points select 0),["Экзамен по пилотированию начался! Соблюдайте правила движения воздушных судов","Экзамен по пилотированию","heli"]] call SunriseClient_system_createTask;
disableSerialization;
private _timer = ["exam_air"] call SunriseClient_system_createTimer;
private _exam_time = getNumber(missionConfigFile >> "LifeCfgSettings" >> ("life_exam_time_air"));


[{_this remoteExecCall ["SunriseServer_system_handleVehicle",2];}, [_exam_car,player,_exam_time], 3] call CBA_fnc_waitAndExecute;
[{(getpos _this)#2 > 1}, {_this addEventHandler ["EpeContactStart", "life_exam_hit = true"]}, _exam_car] call CBA_fnc_waitUntilAndExecute;

private _sign = "Sign_Circle_F" createVehicleLocal (life_exam_points select 0);
_sign setDir (_sign getDir (life_exam_points select 1));
[{
	(_this#0) params ["_timer","_exam_time","_object_pos","_exam_car","_sign"];
	_timer ctrlSetText format ["Оставшееся время: %1",[_exam_time - time,"MM:SS"] call BIS_fnc_secondsToString];

	if (life_exam_points#0 distance player < 17.5) then {
		life_exam_points deleteAt 0;
		life_exam_task setSimpleTaskDestination life_exam_points#0;
		_sign setPos life_exam_points#0;
		_sign setDir (_sign getDir (life_exam_points select 1));
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
		player setVelocity [0,0,0];
		player setPos _object_pos;
		player removeSimpleTask life_exam_task;
		deletevehicle _exam_car;
		deletevehicle _sign;
		life_exam_hit = false;
		["exam_air"] call SunriseClient_gui_DestroyRscLayer;
	};

	if (life_exam_points isEqualTo []) exitWith {
		[_this#1] call CBA_fnc_removePerFrameHandler;
		["Вы сдали экзамен","done"] call SunriseClient_gui_bottomNotification;
		life_exam_task setTaskState "SUCCEEDED"; 
		life_licenses pushBackUnique "air";
		[getPlayerUID player,"life_licenses",life_licenses] remoteExecCall ["SunriseServer_database_updatePartial",2];

		_exam_car setVelocity[0, 0, 0];
		player action["Eject", _exam_car];
		titleText ["","BLACK IN"];
		player setVelocity [0,0,0];
		player setPos _object_pos;
		player removeSimpleTask life_exam_task;
		deletevehicle _exam_car;
		deletevehicle _sign;
		life_exam_hit = false;
		["exam_air"] call SunriseClient_gui_DestroyRscLayer;
	};
}, 0.25, [_timer,_exam_time + time,_object_pos,_exam_car,_sign]] call CBA_fnc_addPerFrameHandler;
/*
while {!(life_exam_points isEqualTo [])} do {
		_timer ctrlSetText format ["Оставшееся время: %1",[_exam_time,"MM:SS"] call BIS_fnc_secondsToString];
		_exam_time = _exam_time - 0.5;
		if ((life_exam_points select 0) distance player < 17.5) then {
			life_exam_points deleteAt 0;
			life_exam_task setSimpleTaskDestination (life_exam_points select 0);
			_sign setPos (life_exam_points select 0);
			_sign setDir (_sign getDir (life_exam_points select 1));
		};
		sleep 0.5;
		if (exam_points > 5) exitWith {};
		if (_exam_time < 0) exitWith {};
		if !(alive _exam_car) exitWith {};
		if (isNull _exam_car) exitWith {};	
};
_exam_car setVelocity[0, 0, 0];
player action["Eject", _exam_car];
if (exam_points > 5 OR _exam_time < 0 OR !(alive _exam_car) OR isNull _exam_car) then {
	["Вы провалили экзамен","error"] call SunriseClient_gui_bottomNotification;
	life_exam_task setTaskState "FAILED"; 
} else {
	["Вы сдали экзамен","done"] call SunriseClient_gui_bottomNotification;
	life_exam_task setTaskState "SUCCEEDED"; 
	life_licenses pushBackUnique "air";
	[getPlayerUID player,"life_licenses",life_licenses] remoteExecCall ["SunriseServer_database_updatePartial",2];
};
titleText ["","BLACK IN"];


 