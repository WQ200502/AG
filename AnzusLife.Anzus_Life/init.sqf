StartProgress = false;
ASY_UsingHeadless = !(isNil "HC1");
X_Server = false;

if (isServer) then
{
	diag_log format["isServer %1", isServer];
	if (ASY_UsingHeadless) then { waitUntil { (owner HC1) > 0 }; };
	//[] call compile PreprocessFileLineNumbers "\life_server\server_init.sqf";
	//[] call TON_fnc_server_init;
};

tf_no_auto_long_range_radio = true;
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;
tf_sendingDistanceMultiplicator = 2;
tf_receivingDistanceMultiplicator = 2;
enableRadio false;
0 setRain 0;
0 setFog 0;
0 setOvercast 0;
forceWeatherChange;
999999 setRain 0;
999999 setFog 0;
999999 setOvercast 0;
iQsPRLpNqsHxF8hA4Mmng = 1; 
7Ye56RtEMtXgC5n8C5dbG9PX = 1;

StartProgress = true;

/*if(isDedicated && isNil("life_market_prices")) then
{
[] call anzus_fnc_marketconfiguration;
diag_log "Market prices generated!";
 
"life_market_prices" addPublicVariableEventHandler
{
diag_log format["Market prices updated! %1", _this select 1];
};﻿

[] execFSM "core\fsm\server.fsm";
diag_log "Server FSM executed";
};
*/


[] call ANZUS_fnc_startIngameGUI;
