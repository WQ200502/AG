/*

	Filename: 	SunriseClient_system_restrain.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params [
	["_cop",Objnull,[Objnull]],
	["_who","",[""]]
];

if (isNull _cop) exitWith {};

[] spawn {
	private["_time"];
	while {true} do {
		_time = time;
		waitUntil {uiSleep 1; (time - _time) > (10 * 60)};

		if !(GVAR_RESTRAINED(player)) exitWith {};
		if (!([getPosATL player,20] call SunriseClient_system_nearPlayers) && (GVAR_RESTRAINED(player)) && !((objectParent player) isKindOf "Air")) exitWith {
			[player,"restrained"] call SunriseClient_system_clearGlobalVar;
			[player,"isBlind"] call SunriseClient_system_clearGlobalVar;
			detach player;
		};
	};
};

private ["_sound","_txt"];
if (_cop getVariable ["copDuty",false]) then {
	_txt = "Вас заковали с помощью наручников!";
	_sound = "cuff";
} else {
	_sound = selectRandom ["action_ducttape_0", "action_ducttape_1", "action_ducttape_2"];
	_txt = "Вас заковали с помощью клейкой ленты!";
};
if !(isNull life_ds_job) then {
	player removeAction AID_DROPDSBOX;
	detach life_ds_box;
	deleteVehicle life_ds_box;
	if (currentWeapon player isEqualTo "") then {player PlayActionNow "FT_Act_Gesture_Reset"};
	life_ds_job setTaskState "FAILED"; 
	player removeSimpleTask life_ds_job;
};
player say3D _sound;
titleText [_txt,"PLAIN"];
//systemChat format ["Вас связал игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_who];

["info","",format["Вас связал игрок с ID %1. Запомните этот ID на случай нарушений правил сервера",_who],true] call SunriseClient_message;
player playActionNow "FT_Act_Arest_pose";

{inGameUISetEventHandler [_x, "true"]} forEach ["PrevAction", "NextAction","Action"];

while {GVAR_RESTRAINED(player)} do {
	if (NOTINVEH(player)) then {
		if (!(EQUAL(CURWEAPON,""))) then {
			player action ["SwitchWeapon", player, player, 100];
		};
		player playAction "FT_Act_Arest_pose";
	} else {
		if (EQUAL((driver objectParent player),player)) then {
			player moveInCargo (objectParent player);
		};
	};

	if (LSNOTALIVE(player)) exitWith {};
	if (LSNOTALIVE(_cop)) exitWith {};

	uiSleep 0.1;
};

{inGameUISetEventHandler [_x, "false"]} forEach ["PrevAction", "NextAction","Action"];

[player,"restrained"] call SunriseClient_system_clearGlobalVar;
[player,"isBlind"] call SunriseClient_system_clearGlobalVar;
detach player;

if !(LSDEAD(player)) then {
	if !(LSINCAP(player)) then {
		player say3D _sound;
		titleText ["Вы свободны","PLAIN"];
		player SVAR ["tf_unable_to_use_radio", false];
	};
	player PlayActionNow "FT_Act_Gesture_Reset";
};