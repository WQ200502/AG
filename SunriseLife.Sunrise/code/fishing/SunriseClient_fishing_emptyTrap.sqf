/*

	Filename: 	SunriseClient_fishing_emptyTrap.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {["error","",format["Вы заняты"]] call SunriseClient_message};
private _vehicle = objectParent player;
if (NOTINVEH(player)) exitWith {["error","",format["Для опустошения ловушки вы должны находиться в технике."]] call SunriseClient_message};
if (EQUAL((driver _vehicle),player)) exitWith {["error","",format[localize "STR_NOTF_PassengerSeat"]] call SunriseClient_message};
if ((typeOf _vehicle) in (LIFE_SETTINGS(getArray,"life_cantStoreItems"))) exitWith {["error","",format["На этом транспортном средстве нельзя добывать рыбу"]] call SunriseClient_message};

params ["_target", "_caller", "_actionId", "_point"];

["Опустошаем ловушку",15,"","",false,{(NOTINVEH(player)) OR (isEngineOn _vehicle) OR (EQUAL((driver _vehicle),player))}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
if (life_interrupted) exitWith {life_interrupted = false; ["error","",format[localize "STR_NOTF_ActionCancel"]] call SunriseClient_message};	
if (NOTINVEH(player)) exitWith {["error","",format["Для опустошения ловушки вы должны находиться в технике."]] call SunriseClient_message};
if (isEngineOn _vehicle) exitWith {["error","",format["Для опустошения ловушки мотор должен быть заглушен."]] call SunriseClient_message};
if (EQUAL((driver _vehicle),player)) exitWith {["error","",format[localize "STR_NOTF_PassengerSeat"]] call SunriseClient_message};

life_fishing_job setTaskState "SUCCEEDED"; 
life_fishing_points = life_fishing_points - [_point];
player removeAction _actionId;
if ([true,"fish",100,_vehicle] call SunriseClient_system_handleVehInv) then {
	if (life_fishing_points isEqualTo []) then {
		["done","",format["Вы успешно забрали 10 туш, вы опустошили все ловушки, направляйтесь на переработку"]] call SunriseClient_message;
		player removeSimpleTask life_fishing_job;
		life_fishing_inProgress = false;
	} else {
		private _closest = [0,0,0];
		private _closestdist = 100000;
		_p_pos = getpos player;
		{
			if (_x distance _p_pos < _closestdist) then {
				_closest = _x;
				_closestdist = _x distance _p_pos;
			};
		} forEach life_fishing_points;
		life_fishing_job setSimpleTaskDestination _closest; 
		life_fishing_job setTaskState "ASSIGNED"; 
		player setCurrentTask life_fishing_job;
	
		player addAction ["Забрать рыбу из ловушки",SunriseClient_fishing_emptyTrap,_closest,0,true,false,"",format["player inArea [%1, 15, 15, 0, false] && !life_action_inUse",_closest]];
		
		["done","",format["Вы успешно забрали 100 туш, осталось %1 ловушек",count life_fishing_points]] call SunriseClient_message;
	};
} else {
	["error","",format["Места в лодке нет"]] call SunriseClient_message;
};
