/*
	
	Filename: 	SunriseClient_system_blinded.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
private["_strippedItems","_hg","_gg"];
params[
	["_unit",objNull,[objNull]],
	["_who","",[""]]
];
if (player GVAR ["isBlind",false]) exitWith {};

player say3D "blind";
player SVAR ["isBlind",true,true];

titleText ["Вам надели мешок на голову!","PLAIN"];
//systemChat format ["Игрок с ID %1 надел вам мешок на голову. Запомните этот ID на случай нарушений правил сервера",_who];	

["info","",format["Игрок с ID %1 надел вам мешок на голову. Запомните этот ID на случай нарушений правил сервера",_who],true] call SunriseClient_message;

titleCut ["", "BLACK FADED", 9999999];

_hg = PHEADGEAR;
_gg = PGOOGLES;
_strippedItems = [];
removeHeadgear player;
removeGoggles player;
player addHeadgear "srl_headBag";

_playerItems = items player;
{
	switch (_x) do {
		case "ItemMap": {
			player unassignItem _x;
			player removeItem _x;
			_strippedItems set [(count _strippedItems), _x];
		};
		case "ItemCompass": {
			player unassignItem _x;
			player removeItem _x;
			_strippedItems set [(count _strippedItems), _x];
		}; 
		case "ItemGPS": {
			player unassignItem _x;
			player removeItem _x;
			_strippedItems set [(count _strippedItems), _x];
		}; 
	};
} forEach _playerItems;

while {player GVAR ["isBlind",false]} do {	
	if (LSDEAD(player) OR !(GVAR_RESTRAINED(player))) exitWith {};
	uiSleep 1;
};

[player,"isBlind"] call SunriseClient_system_clearGlobalVar;

{
	player addItem _x;
	player assignItem _x;
} forEach (_strippedItems);

removeHeadgear player;
player addHeadgear _hg;
player addGoggles _gg;

titleCut ["", "BLACK IN", 8];
player say3D "blind";