/*

	Filename: 	SunriseClient_spawn_Confirm.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
closeDialog 0;
private "_text";
if (life_spawn_point isEqualTo []) then {
	private["_sp","_spCfg"];
	private _spCfg = [] call SunriseClient_spawn_PointCfg;
	private _sp = _spCfg select 0;

	if (isNil {(call compile format["%1", _sp select 0])}) then {
		if (["Точка отключения",life_spawn_point select 1] call BIS_fnc_inString) then {
			player setPosATL life_logout_position;
		} else {
			player setPosATL (getMarkerPos (_sp select 0));
		};
	} else {
		private _spawnPos = selectRandom (call compile format["%1", _sp select 0]);
		_spawnPos = _spawnPos buildingPos 0;
		player setPosATL _spawnPos;
	};

	_text = format["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"];
} else {
	if (isNil {(call compile format["%1",life_spawn_point select 0])}) then {
		if (["Точка отключения",life_spawn_point select 1] call BIS_fnc_inString) then {
			player setPosATL life_logout_position;
		} else {
			if (["house",life_spawn_point select 0] call BIS_fnc_inString) then {
				private _house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
				private _bPos = [_house] call SunriseClient_system_getBuildingPositions;

				if (_bPos isEqualTo []) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};

				private _pos = selectRandom _bPos;
				player setPosATL _pos;
			} else {
				player setPos (getMarkerPos (life_spawn_point select 0));
			};
		};
	} else {
		private _spawnPos = selectRandom (call compile format["%1", life_spawn_point select 0]);
		_spawnPos = _spawnPos buildingPos 0;
		player setPosATL _spawnPos;
	};
	_text = format["%2 %1",life_spawn_point select 1,localize "STR_Spawn_Spawned"];
};
{_x hideObject false} forEach allPlayers;

cutText [_text,"BLACK IN",5];
player say3D "welcome2serv";

if (life_firstSpawn) then {
	life_firstSpawn = false;
	[] spawn SunriseClient_system_welcomeNotification;

	if (life_gov) then {
		[0,format["<t color='#74d42b'>Губернатор %1</t> прибыл на остров. All Hail the Governor!",name player]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
	} else {
		if (GVAR_RTITLE(player) isEqualTo "") then {
			[0,format["<t color='#74d42b'>%1</t> прибыл на остров",GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
		} else {
			[0,format["<t color='#74d42b'>%1 %2</t> прибыл на остров",GVAR_RTITLE(player),GVAR_RNAME(player)]] remoteExecCall ["SunriseClient_system_broadcast",RCLIENT];
		};
	};
};
life_connected = true;
[getPlayerUID player,"life_connected",life_connected] remoteExecCall ["SunriseServer_database_updatePartial",2];

[] call SunriseClient_system_updateViewDistance;
setterrainGrid life_grassIndex;
player switchCamera "EXTERNAL";

if !(life_medDuty) then {
	if (life_firstTime) then {
		life_firstTime = false;
		[getPlayerUID player,"life_firstTime",life_firstTime] remoteExecCall ["SunriseServer_database_updatePartial",2];
	};

	//if (life_myserver isEqualTo 0) then {[] spawn SunriseClient_system_serverLock};
};
if (LIFE_HANDLE_HUD isEqualTo -1) then {[] call SunriseClient_hud_init};
if (LIFE_HANDLE_EFFECTS isEqualTo -1) then {LIFE_HANDLE_EFFECTS = [SunriseClient_effects_Init,2] call CBA_fnc_addPerFrameHandler};
	
[player,"lifeState","HEALTHY"] call CBA_fnc_setVarNet;