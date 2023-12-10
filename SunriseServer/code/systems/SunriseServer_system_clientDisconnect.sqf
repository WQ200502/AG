/*

	Filename: 	SunriseServer_system_clientDisconnect.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
params ["_player","_id","_player_uid","_player_name"];
if (isNull _player) exitWith {};
if (_player isEqualTo HC_1) exitWith {
	life_HC_isActive = false;
	publicVariable "life_HC_isActive";
	HC_Life = false;
	publicVariable "HC_Life";
	
	format ["HeadlessClient disconnected %1", server_timetext] call SunriseServer_system_log;
};

private _player_position = getPosATL _player;
private _player_damage = damage _player;
private _player_time = (serverTime - (missionNamespace getVariable [("JT_" + _player_uid),serverTime])) / 60;
private _player_gear = missionNamespace getVariable [format["%1_loot",_player_uid],""];

if (_player_damage > 0.89) then {_player_damage = 0.89};


switch (true) do {
	case (_player getVariable["lifeState", ""] isEqualTo "INCAPACITATED"): {
		["relog",_player_uid,_player_name, "Релог в агонии"] call SunriseServer_system_customLog;
		[0, format["%1 (%2) покинул остров в агонии! Сделайте снимок, если хотите подать жалобу", _player_name, _player_uid]] remoteExecCall ["SunriseClient_system_broadcast", -2];
		_player_gear = [];
	};
	case (_player getVariable["lifeState", ""] isEqualTo "DEAD"): {
		["relog",_player_uid,_player_name, "Релог в смерти"] call SunriseServer_system_customLog;
		[0, format["%1 (%2) покинул остров мертвым! Сделайте снимок, если хотите подать жалобу", _player_name, _player_uid]] remoteExecCall ["SunriseClient_system_broadcast", -2];
		_player_damage = 1;
		_player_gear = [];
	};
	case (_player getVariable["lifeState", ""] isEqualTo "RESPAWN"): {
		["relog",_player_uid,_player_name, "Релог в возрождении"] call SunriseServer_system_customLog;
		[0, format["%1 (%2) покинул остров во время возрождения! Сделайте снимок, если хотите подать жалобу", _player_name, _player_uid]] remoteExecCall ["SunriseClient_system_broadcast", -2];
		_player_damage = 0;
		_player_gear = [];
	};
	case (_player getVariable["restrained", false]): {
		["relog",_player_uid,_player_name, "Релог с наручниками"] call SunriseServer_system_customLog;
		if (server_restartSoon) exitWith {};
		_player_damage = 0.89;
		[0, format["%1 (%2) покинул остров со связанными руками! Сделайте снимок, если хотите подать жалобу", _player_name, _player_uid]] remoteExecCall ["SunriseClient_system_broadcast", -2];
	};
	case (_player getVariable["houseRaid", false]): {
		["relog",_player_uid,_player_name, "Релог при взломе дома"] call SunriseServer_system_customLog;
	};
	default {};
};
private _keyArr = missionNamespace getVariable [(_player_uid + "_KEYS"),[]];
{
	if !(_x getVariable ["vehicle_limits",""] isEqualTo "") then {
		_x setOwner 2;
		if (local _x) then {
			[_x,2] call SunriseClient_system_lockVehicle;
			_x setVelocity [0,0,0];
		} else {
			[_x,2] remoteExecCall ["SunriseClient_system_lockVehicle",_x];
			[0,0,0] remoteExecCall ["setVelocity",_x];
		};
		[{speed _this < 1}, {_veh_crew = crew _this; if !(_veh_crew isEqualTo []) then {[] remoteExecCall ["SunriseClient_system_pulloutVeh",_veh_crew]}}, _x] call CBA_fnc_waitUntilAndExecute;	
	};
} forEach _keyArr;

private _player_fact = missionNamespace getVariable [format["%1_fact",_player_uid],[]];
if !(_player_fact isEqualTo []) then {
	for "_i" from 0 to count(_player_fact)-1 do {
		_curr_fact = (_player_fact select _i);
		diag_log _curr_fact;
		_fact_stock = format["getStock:%1",_curr_fact select 0] call SunriseServer_database_selectSingleField;
		diag_log _fact_stock;//[[["iron",700],["wood",250]]]
		_fact_stock sort true;
		_sold = (_curr_fact select 1);
		diag_log _sold;//[["iron",123]]
		_sold sort true;
		{
			_index = [_x select 0, _sold] call SunriseClient_system_index;
			diag_log _index;
			if !(_index isEqualTo -1) then {
				_fact_stock set[_forEachIndex,[_x select 0,(_x select 1) + ((_sold select _index) select 1)]];
			};
		} forEach _fact_stock;
		diag_log _fact_stock;//[[["iron",700],["wood",250]]]
		format ["updateStock:%1:%2",_fact_stock,_curr_fact select 0] call SunriseServer_database_fireAndForget;
	};
};

if (_player_gear isEqualTo "") then {
	format ["clientDisconnectNoGear:%1:%2:%3:%4",_player_position,_player_damage,_player_time,_player_uid] call SunriseServer_database_fireAndForget;
} else {
	format ["clientDisconnect:%1:%2:%3:%4:%5",_player_position,_player_damage,_player_time,_player_gear,_player_uid] call SunriseServer_database_fireAndForget;
};
format ["Player (%1) disconnected %2 | played %3",_player_uid, server_timetext, _player_time] call SunriseServer_system_log;
if ((_player getVariable ["copDuty",false]) OR (_player getVariable ["medDuty",false])) then {["duty",_player_uid,name _player,"0"] call SunriseServer_system_customLog};

detach _player;
{detach _x; deleteVehicle _x} forEach (attachedObjects _player);
deleteVehicle _player;