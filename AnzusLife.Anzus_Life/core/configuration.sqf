#include "..\script_macros.hpp"
/*
    File: configuration.sqf
    Author:

    Description:
    Master Life Configuration File
    This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/

_gameSettings = MAIN_SETTINGS("GameSettings","Player");

life_query_time = time;
life_action_delay = time;
life_request_delay = time;
life_trunk_vehicle = objNull;
life_session_completed = false;
life_last_robWarning = 0;
life_last_jclq = 0;
life_drink = 0;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_environment = 0;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_cocaine_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_siren_active = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = objNull;
life_knockout = false;
life_nos = false;
life_interrupted = false;
life_respawned = false;
life_action_gathering = false;
life_action_harvesting = false;
tawvd_addon_disable = true;
life_save_gear = [];
life_container_activeObj = objNull;
life_disable_getIn = false;
life_disable_getOut = false;
life_pos_exist = false;
life_pos_attach = [];
life_civ_position = [];
life_canpay_bail = false;
life_fadeSound = false;
life_growweed = false;
life_storagePlacing = scriptNull;
life_combatTime = 0;
life_callBackup = 0;
life_open_notifications = [];
life_antispam = 0;
camrunning = false;
life_lastvehiclepurchase = 60;
AnzusLife_AddonVerify = false;
life_actionThread = scriptNull;
life_trunkTimer = time;
life_atmTimer = time;
anzus_antispam = false;
AnzusLife_CartelDrugSell = 0;
player setVariable ["taskStartMedic",false,true];
doug_artgalleractive = false;
decryptingData = false;

if (isNil "truckMissionVeh") then {
    truckMissionVeh = objNull;
};

CB = false;
MT = false;

life_computer1CannotBeHacked = false;
life_computer2CannotBeHacked = false;
life_computer3CannotBeHacked = false;
life_computer4CannotBeHacked = false;
life_resetMainFrameAccessDeny = false;
life_computer1HackInProgress = false;
life_computer2HackInProgress = false;
life_computer3HackInProgress = false;
life_computer4HackInProgress = false;
life_mainFrameHackInProgress = false;
life_stopHacking = false;
//Settings
life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_enableNewsBroadcast",true];
life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
life_settings_tagson = profileNamespace getVariable ["life_settings_tagson",true];
life_settings_revealObjects = profileNamespace getVariable ["life_settings_revealObjects",true];
life_settings_viewDistanceFoot = profileNamespace getVariable ["life_viewDistanceFoot",1250];
life_settings_viewDistanceCar = profileNamespace getVariable ["life_viewDistanceCar",1250];
life_settings_viewDistanceAir = profileNamespace getVariable ["life_viewDistanceAir",1250];

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/

life_maxWeight = getNumber(_gameSettings >> "nobag_maxWeight");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_arrest_time = 0;
life_delivery_in_progress = false;
life_thirst = 100;
life_hunger = 100;
CASH = 0;

life_istazed = false;
life_isknocked = false;
life_vehicles = [];
life_itemPickUpArray = [];

AnzusLife_BannedWords = getArray(missionConfigFile >> "AnzusLife_Core_Settings" >> "BannedWords");

//PHONE
life_phone_channel = -1;
life_phone_status = 0;

//maverick
mav_ttm_var_stamina = 0;
mav_ttm_var_silencer = 0;
mav_ttm_var_lawless = 0;

_vipcolor = profileNamespace getVariable ["AnzusLife_NametagColor",[1,1,1,1]];
player setVariable ["AnzusLife_NametagColor",_vipcolor,true];

/*
    Master Array of items?
*/
//Setup variable inv vars.
{
    missionNamespace setVariable [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "VirtualItems"));

/* Setup the BLAH! */
{
    _varName = getText(_x >> "variable");
    _sideFlag = getText(_x >> "side");

    missionNamespace setVariable [LICENSE_VARNAME(_varName,_sideFlag),false];
} forEach ("true" configClasses (missionConfigFile >> "Licenses"));
