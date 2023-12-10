/*
	
	Filename: 	fn_initDB.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"

/* Prepare extDB before starting the initialization process for the server */
if (isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = compileFinal str (round(random(9999)));
	life_sql_log = compileFinal str (call life_sql_id + 1);
	uiNamespace setVariable ["life_sql_id",life_sql_id];
	uiNamespace setVariable ["life_sql_log",life_sql_log];
	try {
		_result = EXTDB "9:ADD_DATABASE:sunrise_games";
		if !(_result isEqualTo "[1]") throw format ["Could not add database: %1", _result];
		"Connected to database!" call SunriseServer_system_log;

		_result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:sunrise_games:SQL_CUSTOM:%1:sunrise_games.ini",FETCH_CONST(life_sql_id)];
		if !(_result isEqualTo "[1]") throw format ["Failed to initialize database protocol: %1", _result];
		"Database protocol initialized!" call SunriseServer_system_log;

		_result = EXTDB "9:ADD_DATABASE:sunrise_logs";
		if !(_result isEqualTo "[1]") throw format ["[LOGS] Could not add database: %1", _result];
		"[LOGS] Connected to database!" call SunriseServer_system_log;

		_result = EXTDB format ["9:ADD_DATABASE_PROTOCOL:sunrise_logs:SQL_CUSTOM:%1:sunrise_logs.ini",FETCH_CONST(life_sql_log)];
		if !(_result isEqualTo "[1]") throw format ["[LOGS] Failed to initialize database protocol: %1", _result];
		"[LOGS] Database protocol initialized!" call SunriseServer_system_log;

		if (serverName isEqualTo "test") then {EXTDB "9:LOCK:development"} else {EXTDB "9:LOCK"};
		life_server_extDB_notLoaded = false;
		publicVariable "life_server_extDB_notLoaded";
	} catch {
		life_server_extDB_notLoaded = true;
		publicVariable "life_server_extDB_notLoaded";
		_exception call SunriseServer_system_log;
	};
} else {
	life_sql_id = compileFinal str (uiNamespace getVariable "life_sql_id");
	life_sql_log = compileFinal str (uiNamespace getVariable "life_sql_log");
	"Still Connected to Database" call SunriseServer_system_log;
};
