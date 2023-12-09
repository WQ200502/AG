/*
	
	Filename: 	SunriseClient_system_pullOutVeh.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private _source = param [0,objNull,[objNull]];
if (NOTINVEH(player)) exitWith {};

if (LSINCAP(player)) then {
	player setUnconscious false;	
	moveOut player;		
	[{[player] call CBA_fnc_isTurnedOut}, {player setUnconscious true}] call CBA_fnc_waitUntilAndExecute;	
} else {
	moveOut player;	
	titleText [localize "STR_NOTF_PulledOut","PLAIN"];
	if !(isNull _source) then {["info","",format ["Вас высадил человек с PID %1. Сохраните данные, если считаете это нарушением",getPlayerUID _source],true] call SunriseClient_message};
	titleFadeOut 4;
	[{[player] call CBA_fnc_isTurnedOut}, {life_curWep_h = CURWEAPON;player action ["SwitchWeapon",player,player,100]}] call CBA_fnc_waitUntilAndExecute;	
};