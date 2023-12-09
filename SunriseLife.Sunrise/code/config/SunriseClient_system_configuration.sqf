/*

	Filename: 	SunriseClient_system_configuration.sqf
	Project: 	Sunrise Life
	Author:		Sunrise Team
	Steam:		Sunrise Team


*/
#include "..\..\script_macros.hpp"
life_service_vehicle = objNull;
life_service_updateNitro = false;
life_service_nitro = false;

life_hazard_detectorOn = false;
life_hazard_detectorCool = 0;
life_hazard_guided = false;
anomalies_holder = [];
active_anomalies = [];
life_hazard_fogTime = -time;

life_gps_agent = objNull;
life_gps_markers = [];

life_exam_points = [];
life_exam_hit = false;
life_damage = 0;
life_endjob_timer = time;
life_duty_timer = time;
life_lastSync = time;
life_lastKnock = time;
life_messages = [];
life_notifications = [];
life_recipes = [];
life_licenses = [];
life_corpse = objNull;

life_fishing_job = taskNull;
life_fishing_points = [];
life_fishing_inProgress = false;
life_fishing_pass = false;

life_hunting_pass = false;
life_turtle_pass = false;

life_timerArray = [displayNull,displayNull,displayNull,displayNull,displayNull];
life_curWep_h = "";

life_suppr_mainArray = [];
life_suppr_suppressed = false;
life_suppr_Threshold = 0;
life_suppr_lastShotAt = 0;// The time the player got shot at last time (Just creates the variable)
life_suppr_intensity = 1;//Overall intensity of the suppression effect
life_suppr_buildupFactor = 1;//How fast the player will get suppressed
life_suppr_flybyIntensity = 1;//Overall intensity of the flyby effect
life_suppr_recoverFactor = 1;//How slow or quick you recover from being suppressed. Lower value = longer lasting effects
life_suppr_haltRecovery = true;//When turned on, recovery of suppression effects stagnates for a while when being shot at again.

life_jail_truck = objNull;

life_fct_vehAct = false;
life_newbie = true;
life_spawn_lastSel = -1;
life_cs_locsCache = [];
life_cs_posSelected = [0,0];
life_cs_lastSelected = "";
life_cs_start = 0;
life_cs_timer = -300;
life_cs_vehicle = objNull;
life_cs_renting = false;

life_fact_type = "";
life_medDuty = false;
life_copDuty = false;
life_curHouseSel = objNull;
life_wanted_cache = [];
life_earplugs = 0;
life_currentExpPerks = (0 call SunriseClient_experience_generateBasePerks);
life_currentExpLevel = 0;
life_currentExp = 0;
life_currentPerkPoints = 0;
life_lastSearch = "";
life_wait = false;
life_market_wait = false;
life_weaponPreset = [];
life_searched = "";
life_warzone_snapScreenThreshold = 0.04;
life_warzone_markerName = "war_zone";
life_warzone_markerName2 = "war_zone_warning";
life_warzone_markerNameRadius = "war_zone_radius";
life_warzone_minRadius = 500;
life_warzone_maxRadius = 1500;
life_warzone_radiusStep = 100;
sunrise_warZone = [[0,0],"",0,false];
life_inwarzone = false;
marker_countLocal = 0;
marker_IndexLocal = 0;

life_admin_mode = false;
life_admin_wh = false;
life_admin_actions = [];
life_admin_uniform = [];
life_jumping = false;
life_actions = [];
life_tfWarn = 0;
life_myserver = 0;
life_query_time = time;
life_action_delay = time;
life_santa_delay = time;
life_trunk_vehicle = Objnull;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_siren_active = false;
life_clothing_filter = 0;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_connected = false;
life_action_gathering = false;
life_drink = 0;
life_logout_position = [];
life_jail_time = 0;
life_expoints = 0;
life_meth_bb = 0;
life_fadeSound = false;
life_prisonkey = false;
life_action_gangInUse = false;
life_slave = false;
life_veh_trunk_sync = [];
life_hint_timer = time;
life_atm_timer = time;
life_check_timer = time;
life_garage_timer = time;
life_vshop_timer = time;
life_save_timer = time - 300;
life_garage_sp_name = "none";
life_playerTrasnferDone = false;
life_ids = [];
life_tempHouses = [];
life_speedTicket = 0;
life_speedCaught = 0;
life_artpoint = "";
life_medic_wantedList = [];
life_medicstatus = -1;
life_medicstatusby = "";
life_smartphoneCash = [];
life_hit_by_car = false;
SetGangLicense = "";
life_gov = false; //губернатор ли я
life_tmp_tax = 0; //налоги на отправку
life_tmp_selled = []; //проданное говно
life_tmp_fact_sold = []; //проданное говно
life_fractionInUse = false;
life_creditInUse = false;
life_haveCredit = [];
life_ltdData = [];
life_deathScreen_canRespawn = false;
life_lastVehicle = vehicle player;

//life_hud_change = true;
life_save_effects_inAction = false;
ui_buff_array = +[];
life_array_problem = [];

adac_vehicleToUpgrade = ObjNull;
life_DraggedBody = ObjNull;

life_job_inProgress = false;
/*            JOBS            */
life_gas_readyToWork = false;
life_gas_job = taskNull;
life_gas_vehicle = ObjNull;

life_dlv_readyToWork = false;
life_dlv_job = taskNull;
life_dlv_vehicle = ObjNull;

life_dhl_readyToWork = false;
life_dhl_vehicle = ObjNull;
life_dhl_box = ObjNull;
life_dhl_job = taskNull;

life_eln_readyToWork = false;
life_eln_vehicle = ObjNull;
life_eln_task = taskNull;
life_eln_job = taskNull;
life_eln_lamps = [];

life_bus_readyToWork = false;
life_bus_vehicle = ObjNull;
life_bus_task = taskNull;
life_bus_job = taskNull;
life_bus_points = [];

life_eco_gs_readyToWork = false;
life_eco_gs_vehicle = ObjNull;
life_eco_gs_task = taskNull;
life_eco_gs_job = taskNull;
life_eco_gs_points = [];

life_eco_ws_readyToWork = false;
life_eco_ws_vehicle = ObjNull;
life_eco_ws_task = taskNull;
life_eco_ws_job = taskNull;
life_eco_ws_points = [];

life_dcourrier_digs = [];
life_dcourrier_job = taskNull;
life_dcourrier_task = taskNull;

life_dcleaner_houses = [];
life_dcleaner_corpse = objNull;
life_dcleaner_job = taskNull;
life_dcleaner_task = taskNull;

life_ds_box = ObjNull;
life_ds_job = taskNull;

life_terror_box = ObjNull;
life_terror_job = taskNull;
/*            JOBS            */
life_arc_currentZones = [];
life_arc_currentZone = "";
life_arc_currentPoint = [];

life_firstTime = true;
life_newLife = false;
life_teargas = false;

life_dance = false;

["all"] call SunriseClient_removeBuff;

//buff
life_speed_buff = false;
life_turbo_used = false;
life_jet_used = false;
life_morphine_used = false;
life_stepHeal_buff = false;
life_radx_used = false;
life_adrenalin_used = false;
life_psyho_used = false;
life_depsyho_used = false;
//DeBuff
life_bleeding = false;
life_pain_shock = false;
life_blood_legs = false;
life_drink_buff = false;

life_debuff1 = false;
life_debuff2 = false;
life_debuff3 = false;
life_debuff4 = false;
life_debuff5 = false;

life_buff1 = false;
life_buff2 = false;
life_buff3 = false;
life_buff4 = false;
life_buff5 = false;

life_pvp = false;
life_pvp_start = 0;

life_currentContainer = objNull;
life_ContainerOpened = false;

life_surrended = false;
life_inwarzone = false;

life_karma = 0;
life_tree_chop = [objNull,0];

life_process_info = [];

//spawn func handlers
LIFE_HANDLE_EFFECTS = -1;
LIFE_HANDLE_HUD = -1;
LIFE_HANDLE_DRUGS = -1;
LIFE_HANDLE_TEMPVARS = -1;
LIFE_HANDLE_DMG = -1;
LIFE_HANDLE_SICK = -1;
LIFE_HANDLE_DRUNK = -1;
LIFE_HANDLE_FOODWATER = -1;
LIFE_HANDLE_WEIGHT = -1;
LIFE_HANDLE_PVP = -1;
LIFE_HANDLE_WARZONES = -1;
LIFE_HANDLE_TEAMSPEAK = -1;
LIFE_HANDLE_CIRRHOSIS = -1;
LIFE_HANDLE_REGEN = -1;

LIFE_HANDLE_HAZARD = objNull;

LIFE_HANDLE_HEROINE = objNull;
LIFE_HANDLE_COCAINE = objNull;
LIFE_HANDLE_MARJ = objNull;
LIFE_HANDLE_LSD = objNull;

//Post process effects
LIFE_PPE_DAMAGE05 = -1;
LIFE_PPE_DRUNK = -1;
LIFE_PPE_DRUGS_DB = -1;
LIFE_PPE_DRUGS_CA = -1;
LIFE_PPE_ANOMALY_COLOR = -1;
LIFE_PPE_ANOMALY_FILMGRAIN = -1;
LIFE_PPE_ANOMALY_COLORINVERSION = -1;

life_message1 = false;
life_message2 = false;
life_message3 = false;
life_message4 = false;
life_message5 = false;

life_mapFirstTimeOpen = true;

life_indicators_array = [
	"life_hunger",
	"life_thirst",
	"life_cs_warn",
	"TF_speak_volume_meters",
	"life_grassIndex",
	"life_death_endtime",
	"life_death_markers",
	"life_myPassportID",
	"life_myIdentity",
	"life_myTagID",
	"life_myPadSkinID",
	"life_myTitleID"
];
life_cs_warn = 0;
life_myIdentity = "";
life_inDeadZone = false;
life_death_markers = [];
life_death_endtime = 0;
life_thirst = 100;
life_hunger = 100;
TF_speak_volume_meters = 20;
life_grassIndex = 50;
life_myPassportID = "";
life_deaths = 0;
life_deaths_max = 3;
life_myTagID = "";
life_myPadSkinID = "default";
life_myTitleID = "default";

life_gui_theme = "white";

life_viewDistanceFoot = GVAR_PRNS ["life_viewDistanceFoot",1200];
life_viewDistanceCar = GVAR_PRNS ["life_viewDistanceCar",1200];
life_viewDistanceAir = GVAR_PRNS ["life_viewDistanceAir",1200];
life_myThemeID = GVAR_PRNS ["life_myThemeID","default"];

//параметры домов
life_houses = [];
life_houses_count = 0;
life_house_box = ObjNull;

//параметры группировок
life_gangData = [];

life_clothing_purchase = [[],[],[],[],[]];

life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

life_bank_fail = false;
life_rob_time = time;
life_is_arrested = false;
life_action_in_use = false;
life_smartphoneTarget = ObjNull;

ui_message_visible = false;
ui_message_array = [];
ui_message_last_time = diag_tickTime;

ui_message_chat_visible = false;
ui_message_chat_array = [];

life_vehicles = [];
bank_robber = [];

DCASH = 0; //грязные деньги
CASH = 0;
BANK = 0;
life_cashX = round (random(30));
life_dcashX = round (random(20));
life_atmX = round (random(10));
life_moneyCache = life_cashX;
life_dmoneyCache = life_dcashX;
life_atmmoneyCache = life_atmX;

//эффекты наркотиков, болезни, переломы, кровотечения и т.п.
life_config_array =
[
	"life_drug_light",
	"life_drug_hard",
	"life_sickness",
	"life_diarrhea",
	"life_slave",
	"life_tagson",
	"life_canUseWarZone",
	"life_isGirl",
	"life_showCam",
	"life_showCompass",
	"life_copDuty",
	"life_medDuty",
	"life_showFPS",
	"bind_number_array",
	"bind_f_number_array",
	"life_showWeaponHud",
	"life_saveBind"
];
//обнуляем эффекты
{
	SVAR_MNS [_x,false];
} foreach life_config_array;
life_tagson = true;
life_showHUD = true;
life_showWeaponHud = true;
life_saveBind = false;
array_settings = [
	"bind_number_array",
	"bind_f_number_array"
];
bind_number_array = [["",""],["",""],["",""],["",""],["",""],["",""]];
bind_f_number_array = [["gesture","am_hello"],["gesture","am_dunno"],["gesture","am_think"],["gesture","am_pointOn"],["gesture","am_yes"],["gesture","am_no"],["gesture","am_thumbUp"],["gesture","am_thumbDown"]];


//Setup variable inv vars.
{
	SVAR_MNS [ITEM_VARNAME(configName _x),0];
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVirtualItems"));

call SunriseClient_config_loadFromProfile;