/*
	
	Filename: 	fn_initHeadless.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\script_macros.hpp"
if !(!hasInterface && !isDedicated) exitWith {diag_log "<INIT> fn_initServer !hasInterface && !isDedicated"};
private _timeStamp = diag_tickTime;
diag_log "------------------------------------- Starting Sunrise Life Headless Init -----------------------------";
diag_log "------------------------------------------------ Version 3 -----------------------------------------";

/* Miscellaneous mission-required stuff */
serv_sv_use = [];
life_wanted_list = [];
life_sold_cars = [];
life_sold_usedcars = [];
life_sold_houses = [];

/* Prepare extDB before starting the initialization process for the server */
call SunriseServer_fnc_initDB;

life_HC_isActive = true;
publicVariable "life_HC_isActive";
HC_Life = clientOwner;
publicVariable "HC_Life";
"HC is active and owner translated" call SunriseServer_system_log;

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Life Headless Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";