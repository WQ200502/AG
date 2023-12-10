/*
	
	Filename: 	fn_initServer.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team

*/
#include "..\script_macros.hpp"
if (!isDedicated) exitWith {diag_log "<INIT> fn_initServer !isDedicated"};
diag_log "------------------------------------- Starting Sunrise Life Server Init -----------------------------";
diag_log "------------------------------------------------ Version 3 -----------------------------------------";
private _timeStamp = diag_tickTime;

life_server_isReady = false;
publicVariable "life_server_isReady";
//asct_instanceID = "AVA"; 

{
	missionNamespace setVariable [_x select 0,_x select 1,true];
} forEach [
	//Restart
	["server_ddos_air", false],
	["server_ddos_ts", false],
	["server_restartsoon", false],
	//gangs
	["life_copGroup", grpNull],
	["life_medGroup", grpNull],
	//TASKFORCE
	["tf_radio_server_name", "SunriseLife"],
	["tf_radio_channel_name", "SunriseLifeRadio"],
	["tf_radio_channel_password", "Xyi288VamANe856Parol291Naxoi444"],
	//Gov
	["server_donat_vehicles",["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_APC_Wheeled_02_rcws_F","B_APC_Wheeled_01_cannon_F","I_APC_Wheeled_03_cannon_F","O_APC_Tracked_02_cannon_F","B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_AA_F","O_APC_Tracked_02_AA_F","O_mas_ZSU_OPF_01","B_APC_Tracked_01_CRV_F","I_APC_tracked_03_cannon_F","B_MBT_01_cannon_F","B_MBT_01_TUSK_F","I_mas_BMP1P_AAF_01","I_mas_BMP1_AAF_01","I_mas_BMP2_HQ_AAF_01","I_mas_BMP2_AAF_01","O_MBT_02_cannon_F","I_MBT_03_cannon_F","B_Heli_Light_01_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F","I_Heli_light_03_dynamicLoadout_F","O_Heli_Attack_02_dynamicLoadout_F","B_Heli_Attack_01_dynamicLoadout_F"]],
	["server_tax",0],
	["server_bank",0],
	["server_poor",0],
	["server_mar_legal",false],
	["server_slavery",false],
	["server_govinfo",[]],
	["gas_array",[]],
	["server_warzones",[]],
	//Economy
	["fact_array", []],
	["fact_items", []],
	
	["sell_array", []],
	["buy_array", []],
	["life_illegal_items", []],
	//---
	["enabledCaptures", []],
	["BattleIndex", -1],
	["life_JailSmallPoints", [[2691.13,9900.09,0.586845],[2688.99,9899.8,0.680534]]],
	["life_JailBigPoints", [[2691.13,9900.09,0.586845],[2688.99,9899.8,0.680534]]]
];

[] call compile PreProcessFileLineNumbers "\SunriseServer\functions.sqf";
missionNamespace setVariable ["server_timeText",(call SunriseServer_system_getRealTime),true];
/* Prepare the headless client */
life_HC_isActive = false;
publicVariable "life_HC_isActive";
HC_Life = false;
publicVariable "HC_Life";

/* Prepare extDB before starting the initialization process for the server */
call SunriseServer_fnc_initDB;

/* Run stored procedures for SQL side cleanup */
"ServerInitialize" call SunriseServer_database_fireAndForget;

life_medlevel = 0;
life_copLevel = 0;
CONST(JxMxE_PublishVehicle,"false");

[] spawn SunriseServer_system_loadPrices;

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call SunriseServer_system_clientDisconnect; false;}];
addMissionEventHandler ["PlayerConnected",{_this call SunriseServer_system_clientConnect; false;}];

/* Miscellaneous mission-required stuff */
serv_sv_use = [];
life_wanted_list = [];
life_sold_cars = [];
life_sold_usedcars = [];
life_sold_houses = [];

/* The server_govinfo array was also meant to host data regarding what the "laws" currently are, however that's going to be up to you */
server_govinfo = "getServerGovInfo" call SunriseServer_database_selectSingle;
publicVariable "server_govinfo";

gas_array = "getGasArray" call SunriseServer_database_selectFull;
publicVariable "gas_array";
shops_array = "getShopsArray" call SunriseServer_database_selectFull;

[] call SunriseServer_factory_updateFactories;

/* Loading market items */
life_duty_list_med = [];
life_duty_list_cop = [];
life_cop_disp = objNull;
publicVariable "life_cop_disp";

/* Loading market items */
all_ah_items = [];
publicVariable "all_ah_items";
[] spawn SunriseServer_market_init;


[8,true,120] execFSM "\SunriseServer\FSM\timeModule.fsm";
//server_monitorFSM = [] execFSM "\SunriseServer\FSM\server_monitor.fsm";
[] spawn SunriseServer_system_restart;
[] spawn SunriseServer_system_cleanup;
[] spawn SunriseServer_system_monitor;


/* Initialize houses, gangs, captures, fraction gangs */
[] call SunriseServer_system_initHouses;
[] call SunriseServer_system_initGang;
[] call SunriseServer_system_initFractionGangs;
[] spawn SunriseServer_system_hazardZone;
//test
[] call SunriseServer_system_initCaptures;
[] call SunriseServer_system_loadEnabledCaptures;

/* Initialize hunting zone(s) */
animalSpawn = ["hunt_zone",20] spawn SunriseServer_system_huntingZone;
turtleSpawn = ["turtle_1",20] spawn SunriseServer_system_turtleZone;

{
    if (!isPlayer _x) then {
        _npc = _x;
        {
            if (_x != "") then {
                _npc removeWeapon _x;
            };
        } forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
    };
} forEach allUnits;

{
	_marker = createMarker [format["%1_atm",_forEachIndex],_x];
	_marker setMarkerColor "ColorGreen";
	_marker setMarkerType "loc_Tourism";
} foreach LIFE_SETTINGSWORLD(getArray,worldName,"life_atm_positions");

SYSTEM_PASS serverCommand "#monitords 60";
/* Tell clients that the server is ready and is accepting queries */
life_server_isReady = true;
publicVariable "life_server_isReady";
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Life Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";