/*

	Filename: 	SunriseClient_init_loadIn.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
waitUntil {!(isNull (findDisplay 46))};
	
player addRating 9999999;

switch (true) do { 
	case life_copDuty : {
		["duty",getPlayerUID player,name player,"1"] remoteExecCall ["SunriseServer_system_customLog",2];
		[player,"copLevel",life_coplevel] call CBA_fnc_setVarNet;
		if (life_coplevel < 1) then {life_copDuty = false;[getPlayerUID player,"life_copDuty",life_copDuty] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2]};
	}; 
	case life_medDuty : {
		["duty",getPlayerUID player,name player,"1"] remoteExecCall ["SunriseServer_system_customLog",2];
		[player,"medrank",life_medlevel] call CBA_fnc_setVarNet;
		if (life_medlevel < 1) then {life_medDuty = false;[getPlayerUID player,"life_medDuty",life_medDuty] remoteExecCall ["SunriseServer_database_updatePlayerIndCfg",2]};
	}; 
	default {[player,"lvl",life_civlevel] call CBA_fnc_setVarNet;}; 
};

if (life_damage >= 0.89) exitWith {
	if (life_logout_position distance (getMarkerPos "players_spawn_zone") <= 750) then {
		life_logout_position = getMarkerPos "spawn_kavala";
	};
	closeDialog 0;
	life_connected = true;
	[getPlayerUID player,"life_connected",life_connected] remoteExecCall ["SunriseServer_database_updatePartial",2];
	if (LIFE_HANDLE_EFFECTS isEqualTo -1) then {LIFE_HANDLE_EFFECTS = [SunriseClient_effects_Init,2] call CBA_fnc_addPerFrameHandler};
	{_x hideObject false} forEach allPlayers;
	playMusic "";
	player setPos life_logout_position;
	[player,player] call SunriseClient_dmg_Agony;
	player setDamage life_damage;
	if (life_is_arrested) then {[player,true,life_jail_time] call SunriseClient_system_jail;};
};

[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;
[player,"karma",life_karma] call CBA_fnc_setVarNet;
[player,"newbie",life_newbie] call CBA_fnc_setVarNet;

if (life_is_arrested) exitWith {	
	closeDialog 0;
	life_is_arrested = false;
	[player,true,life_jail_time] call SunriseClient_system_jail;
	life_connected = true;
	[getPlayerUID player,"life_connected",life_connected] remoteExecCall ["SunriseServer_database_updatePartial",2];
	if (LIFE_HANDLE_EFFECTS isEqualTo -1) then {LIFE_HANDLE_EFFECTS = [SunriseClient_effects_Init,2] call CBA_fnc_addPerFrameHandler};
	{_x hideObject false} forEach allPlayers;
	playMusic "";
};
if (life_slave) exitWith {
	closeDialog 0;
	life_connected = true;
	[getPlayerUID player,"life_connected",life_connected] remoteExecCall ["SunriseServer_database_updatePartial",2];
	if (LIFE_HANDLE_EFFECTS isEqualTo -1) then {LIFE_HANDLE_EFFECTS = [SunriseClient_effects_Init,2] call CBA_fnc_addPerFrameHandler};
	[player,"slave"] call SunriseClient_system_clearGlobalVar;
	[] call SunriseClient_system_sellSlaveAction;
	{_x hideObject false} forEach allPlayers;
	playMusic "";
};

[] call SunriseClient_spawn_Menu;