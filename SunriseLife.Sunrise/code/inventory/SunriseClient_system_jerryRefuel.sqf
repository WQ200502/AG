/*
	
	Filename: 	SunriseClient_system_jerryRefuel.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_progressName","_progressDone","_sleep","_newItem","_sound"];
params[
	["_oldItem","",[""]],
	["_vehicle",objNull,[objNull]]
];
if (isNull _vehicle OR _oldItem isEqualTo "") exitWith {};
if (life_action_inUse OR (call SunriseClient_system_isInterrupted)) exitWith {};
if !([_vehicle] call SunriseClient_system_isVehicleKind) exitWith {hint "Данный вид техники нельзя заправить"};
if (player distance _vehicle > 7.5) exitWith {hint "Вы слишком далеко от техники"};


switch(true) do {
	case (_oldItem == "srl_Fuelcan"): {
		_progressName = "Заправляем технику";
		_progressDone = "Вы заправили технику.";
		_sleep = 25;		
		_newItem = "srl_Fuelcan_empty";
		_sound = "action_refuel";
	};
};

if (!(player canAdd _newItem)) exitWith {["Инвентарь переполнен","error"] call SunriseClient_gui_bottomNotification};

[_progressName,_sleep,_sound,"",true,{!(vehicle player isEqualTo player)}] call SunriseClient_system_progressBar;
if (call SunriseClient_system_isInterrupted) exitWith {life_interrupted = false};
["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call SunriseClient_system_animDo;
if (life_interrupted) exitWith {life_interrupted = false; [localize "STR_NOTF_ActionCancel", "error"] call SunriseClient_gui_BottomNotification};
if !(vehicle player isEqualTo player) exitWith {titleText["Вы сели в машину, действие прервано","PLAIN"]};

if !([_oldItem] call SunriseClient_system_removeItem) exitWith {["Не удалось удалить предмет","error"] call SunriseClient_gui_bottomNotification};
if !([_newItem] call SunriseClient_system_addItem) exitWith {["Не удалось добавить предмет","error"] call SunriseClient_gui_bottomNotification};

private _amount = switch (true) do {
	case (_vehicle isKindOF "LandVehicle"): {0.5};	
	case (_vehicle isKindOf "Air"): {0.2};	
	case (_vehicle isKindOf "Ship"): {0.35};
	default {0.5};
};

if (!local _vehicle) then {
	[_vehicle,(Fuel _vehicle) + _amount] remoteExecCall ["SunriseClient_system_setFuel",_vehicle];
} else {
	_vehicle setFuel ((Fuel _vehicle) + _amount);
};

titleText[_progressDone,"PLAIN"];