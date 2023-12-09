/*
	
	Filename: initPlayerLocal.sqf
	Project: Sunrise Life
	Author:Sunrise Team
	Steam:Sunrise Team
	
	
*/
#include "script_macros.hpp"
if (!isServer && !hasInterface) exitWith {};

"InitPlayerLocal begin..." call SunriseClient_system_log;
"InitPlayerLocal - All mods are fine..." call SunriseClient_system_log;
CONST(BIS_fnc_endMission, BIS_fnc_endMission);

// --- Disable sound and hide scene
0 fadeSound 0;
0 fadeMusic 0;
0 fadeRadio 0;
enableRadio false;
enableSentences false;
enableEnvironment false;
["SplashNoise", "BLACK"] call SunriseClient_gui_CreateRscLayer;
showHUD false;
showChat false;
showCommandingMenu "";

if (GVAR_PRNS ["PRNS_simpleTrader", false]) then {
	{
		[configName _x] call SunriseClient_shops_traderCreateSimple;
	} forEach ("true" configClasses (missionConfigFile >> "LifeCfgTraders" >> worldName));
} else {
	{
		[configName _x] call SunriseClient_shops_traderCreate;
	} forEach ("true" configClasses (missionConfigFile >> "LifeCfgTraders" >> worldName));
};

[] spawn SunriseClient_spyglass_initSpy;

[] spawn SunriseClient_init_begin;

"InitPlayerLocal done!" call SunriseClient_system_log;