#define true 1
#define false 0

class LifeCfgSettings {
	life_useFuelTrucks = true; //нефтепродукты только в нефтевозах
	life_fuelStuff[] = {"oilu","oilp","uraniumu","uraniump","uraniumc","petrol","gasu","gasp"};
	life_fuelTrucks[] = {"B_Truck_01_fuel_F","B_Truck_01_fuel_CIV_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F",
	"O_Heli_Transport_04_fuel_F","I_mas_cars_Ural_fuel","next_bocha","truck_01_fuel_f","MA18_UCG_Red","d3s_scania_16_t50"}; //техника для перевозки нефтепродуктов
	life_cantStoreItems[] =  {"O_Truck_03_device_F","Freeman_UralNext"}; //контейнеры где ничего нельзя хранить
	life_gatherTools[] = {"sunrise_Tool_Axe","sunrise_Tool_Shovel","sunrise_Tool_PickAxe","sunrise_Tool_Hoe"}; //предметы для добычи ресурсов
	life_boxPrice = 0.35; //цена за контейнер для машины
	life_servicePrice = 0.05; //цена перекраску машины
	life_nitroPrice = 0.20; //цена нитро для машины
	life_cafe_eat = 100; //цена за прием пищи
	life_jail_done = 2000; //цена за ходку в тюрьме
	life_hunting_pass = 5000; //цена за пропуск на охоту
	life_turtle_pass = 5000; //цена за пропуск на рыбалку
	life_fishing_pass = 5000; //цена за пропуск на рыбалку
	life_hazard_boat = 5000; //цена за катер с зоны
	life_hospital_heal = 250; //цена за лечение в госпитале

	life_gas_litrePrice = 410; //цена за литр топлива доставка
	life_fuel_litrePrice = 100; //цена за литр топлива на заправке
	life_gas_maxLitres = 500; //максимум литров на заправке

	life_exitTimer = 20; //сколько секунд до выхода с сервера (20 дефолт)
	life_pvpTimer = 10; //таймер пвп-режима в минутах (10 дефолт)
	
	life_death_exception = "spawn_kavala"; //маркер, где в радиусе 1600 метров нельзя ставить круг смерти
	life_respawn_timer = 7; //таймер возрождения в секундах (10 дефолт)
	life_revive_cops = true; //могут ли ресать копы
	life_revive_fee = 5000; //Сколько платит за рес игрок

	life_houseLimit = 2; //максимум домов для одного игрока
	life_houseLimitDonat = 4; //максимум домов для одного игрока с випкой
	life_houseCreditPrice = 7500000; //сумма выдаваемого кредита за дом
	life_houseSpawnCondition = "life_firstTime OR life_newLife"; //условие для отображения домов в списке спауна

	life_virtualMax = 1200; //вместивость виртуального хранилища
	life_inventoryMax = 200; //вместивость контейнера для реальных предметов
	life_pouchMax = 20;//вместивость защищенного контейнера

	life_gangPrice = 150000; //цена создание группировки
	life_gangUpgradeBase = 35000; //базовая стоимость апгрейда базы
	life_gangUpgradeMultipler = 1.5;
	life_gangSlotLimit = 15; //макс кол-во членов обычной банды
	life_gangSlotLimitPrem = 25; //макс кол-во членов премиум банды
	life_gangCopCanLeaveCondition = "false"; //условие для копов, чтобы можно было выходить из базовой группы

	life_enableFatigue = true; //усталость у игроков?

	life_paycheck = 5000; 		//пособие по безработице srclient.fsm
	life_paycheckGov = 15000;    //пособие для гос служащих srclient.fsm
	life_paycheckCop = 30000;    //пособие для полицейских srclient.fsm
	life_paycheckMed = 15000;    //пособие для медиков srclient.fsm
	life_paycheckCondition = "(life_coplevel > 0 && life_copDuty) OR (life_medlevel > 0 && life_medDuty)"; //кто получает пособие для гос служащих srclient.fsm
	life_paycheck_period = 15; //выплачивать пособие каждые Х минут	srclient.fsm

	life_impound_car = 5500; //вознаграждение за конфискацию машины
	life_impound_boat = 5500; //вознаграждение за конфискацию лодки
	life_impound_air = 7000; //вознаграждение за конфискацию авиа

	life_cop_min = 3; //минимум копов на сервере
	life_cop_min_illegal = 3; //минимум копов на сервере для нелегала
	life_med_min = 3; //минимум медиков на сервере

	life_vShop_rentalOnly[] = {
		
		///MED///////
		"Littlebird_EMS",
		"GurneyTabl",
		"d3s_fseries_17_EMS",
		"d3s_f90_18_EMS",
		"d3s_charger_15_EMS",
		"d3s_e400_16_EMS",
		"d3s_durango_18_EMS",
		"d3s_explorer_EMS_13",
		"d3s_vklasse_17_EMS",
		"d3s_focus_17_ems",
		"d3s_HH_65",
		"Arrive_GTR_EMS",
		///COP/////////////
		"platinum_Tigr_hmg", //полтос
		
		
		"d3s_focus_17_cop",
		
		"d3s_f13_13_COP",
		"d3s_300_12_COP",
		"d3s_taurus_FPI_10",
		"d3s_f86_15_COP",
		"d3s_FPIU_13",
		"d3s_vklasse_17_UNM",
		"d3s_300_12_UNM",
		"d3s_f86_15_UNM",
		"d3s_raptor_UNM_17",
		"d3s_gls63amg_17_FSB",
		"d3s_g500_18_FSB",
		"d3s_gl63amg_12_FSB",
		"d3s_e38_98_GRU",
		"d3s_s650_18",
		"av_tanker"
		
	}; //техника которую можно брать только в аренду
	life_vShop_rentalCondition = "life_coplevel in [19]"; //исключение по арендуемой технике

	life_trunkClass = "Metal_Locker_F"; //объект, используемый для хранилища группировки
	life_trunkVirtualWeight = 1000; //базовая вместимость для виртуальных предметов
	life_trunkInventoryWeight = 200; //базовая вместимость для физ предметов

	life_removeLicByJail = true; //анулировать лицензии после посадки в тюрьму?
	life_removeLicByJailList[] = {"slavery","gun"}; //классы лицензий

	life_removeLicByVeh = true; //анулировать лицензии при нарушении правил вождения?
	life_removeLicByVehList[] = {"driver"}; //классы лицензий

	life_vaultBoxClass = "Land_CargoBox_V1_F";
	life_vaultBoxVirtualWeight = 5000;

	life_girlsClothes[] = { "U_BasicBodyFemale","U_Camo_uniform","U_CamoBlue_uniform","U_CamoBrn_uniform","U_CamoRed_uniform","U_GirlSet1_uniform","U_GirlSet2_uniform","U_GirlSet3_uniform","U_GirlSet4_uniform","U_GirlSet_PD_uniform","U_GirlSet_SWAT_uniform","EF_FEM_10A_BK_W","EF_FEM_10A_R_BK","EF_FEM_10A_R_BK","EF_FEM_72","EF_FSG_R","VX_Uniform_NATO"
	};
	
	life_OnlyVipItems[] = { /*"launch_RPG7V","LMG_03_F","srifle_LRR_F_EXT","LMG_mas_m240_F","LMG_mas_M249a_F","LMG_mas_M249_F_d","LMG_mas_M249_F_v",
	"LMG_mas_m60_F","LMG_mas_mg3_F","LMG_Mk200_F","LMG_Mk200_black_F","LMG_mas_mk48_F","LMG_mas_mk48_F_d","LMG_mas_mk48_F_v",
	"LMG_mas_pkm_F","LMG_mas_pech_F","LMG_mas_Mk200_F","arifle_ARX_hex_F","arifle_ARX_ghex_F","arifle_ARX_blk_F",
	"LMG_Mk200_SV","arifle_AK12_RPK_SV","10Rnd_50BW_Mag_F"
	*/}; //вещи которые могут юзать только випы
		
	life_VipItems[] = {
		/*"srl_blastingcharge", //Заряд для подрыва
		"SmokeShell",
		"U_B_FullGhillie_lsh",
		"optic_mas_aim",
		"arifle_CTAR_blk_F",
		"100Rnd_580x42_hex_Mag_F",
		"srl_FlashBang",
		"optic_ACO_grn",
		"DDOPP_X26_b",
		"arifle_MX_SW_Black_F",
		"LMG_Mk200_F",
		"srifle_EBR_F",
		"arifle_AK12_F",
		"arifle_SPAR_02_blk_F",
		"launch_RPG7V",
		"RPG7_PG7VR",
		"arifle_ARX_blk_F",
		"LMG_03_F",
		"SMG_02_F",
		"LMG_mas_M249_F",
		"arifle_Katiba_F"*/
	};//вещи которые могут юзать и випы и грп и копы
	
	life_limitedItems[] = {
		/*{"Girl_Sparta_Avalon", "(getPlayerUID player in ['7656','7656'])"},
		{"Sey_Bandanna_khk", "(getPlayerUID player isEqualTo '765611')"}*/
	};//вещи с условиями
	
	life_cheatItems[] = {"launch_NLAW_F","Laserdesignator","optic_Nightstalker","optic_DMS","optic_LRPS"};
	life_noSaveItems[] = {"srl_prisonKey"};

	life_vehiclesWithLights[] = {"C_Offroad_01_F","EXT_W_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F",
	"I_Heli_light_03_unarmed_F","I_MRAP_03_hmg_F","I_MRAP_03_F","B_APC_Wheeled_01_cannon_F","B_MRAP_01_hmg_F","O_MRAP_02_F","EC635_Unarmed","O_Heli_Light_02_unarmed_F",
	"B_Heli_Transport_03_unarmed_F","dezkit_b206_rescue","dezkit_b206_ems","C_Offroad_01_repair_F","B_mas_UH60M_SF", "B_mas_UH1Y_UNA_F","G65_Med","BMW_X5M_ben",
	"Vandura_med","Uaz_hunter_med","Crown_Cop","Uaz_Hunter_cop","Vandura_cop","MrFreeman_GoldWing_cop","MrFreeman_CSRT8_stock","BMW_I8_cop","G65_cop","Vandura_swat",
	"Cherokee_swat","MrFreeman_crab","Alpha_Ifrit"
	}; //техника со спецсигналом

	life_OnlyVipVehicles[] = {
		"d3s_actros_14_giga_cistern",
		"d3s_actros_14_giga",
		"d3s_C180_14",
		"d3s_C250_14",
		"d3s_fpace_17",
		"d3s_raptor_17",
		"d3s_giulia_quad_16",
		"d3s_e89_12_M",
		"d3s_levante_17",
		"d3s_f86_15_m",
		"d3s_svr_17_e",
		"d3s_f86_15",
		"d3s_rapide_10"
		
	}; //техника которую только вип перебивать может
	
	life_doNotChop[] = {
		//"platinum_Tigr_hmg", //полтос
	}; //техника нельзя перебить
	
	life_killVehicleZon[] = {
//		"I_MRAP_03_F"
	}; //техника для уничтожения в торг зоне
	
	life_benchesForCivHumm = ""; //условие чтобы не убирались скамейки на хэминге при спауне
	life_weaponSearchException = "'taxi' in life_licenses"; //условие чтобы не делать обыск игрока
	
	MFMpictureGesture = "\sunrise_gui\data\progs\gift_x_ca.paa";
    MFMpictureDance = "\sunrise_gui\data\progs\group_x_ca.paa";
    MFMpicturePose = "\sunrise_gui\data\progs\gift_x_ca.paa";

	/******************************** РАБОТЫ **********************************/
	life_jobs_array[] = {
		/*{ "Курьер в DHL (2 ур.)", "[] call SunriseClient_jobs_startDhl; closeDialog 0;", "life_currentExpLevel > 1"},
        { "Водитель автобуса (5 ур.)", "[] call SunriseClient_jobs_startBus; closeDialog 0;", "life_currentExpLevel > 4"},
        { "Пробоотборщик земли (8 ур.)", "'gs' call SunriseClient_jobs_startEcologist; closeDialog 0;", "life_currentExpLevel > 7"},
        { "Электрик (10 ур.)", "[] call SunriseClient_jobs_startElectrician; closeDialog 0;", "life_currentExpLevel > 9"},
        //{ "Пробоотборщик воды (10 ур.)", "'ws' call SunriseClient_jobs_startEcologist; closeDialog 0;", "life_currentExpLevel > 9"},
		{ "Дальнобойщик (15 ур.)", "[] call SunriseClient_jobs_startDelivery; closeDialog 0;", "life_currentExpLevel > 14"},
        { "Развозчик топлива (30 ур.)", "[] call SunriseClient_jobs_startGas; closeDialog 0;", "life_currentExpLevel > 29"}*/
		{ "Курьер в DHL", "[] call SunriseClient_jobs_startDhl; closeDialog 0;", ""},
        { "Водитель автобуса", "[] call SunriseClient_jobs_startBus; closeDialog 0;", ""},
        { "Пробоотборщик земли", "'gs' call SunriseClient_jobs_startEcologist; closeDialog 0;", ""},
        { "Электрик", "[] call SunriseClient_jobs_startElectrician; closeDialog 0;", ""},
        //{ "Пробоотборщик воды (10 ур.)", "'ws' call SunriseClient_jobs_startEcologist; closeDialog 0;", "life_currentExpLevel > 9"},
		{ "Дальнобойщик", "[] call SunriseClient_jobs_startDelivery; closeDialog 0;", ""},
        { "Развозчик топлива", "[] call SunriseClient_jobs_startGas; closeDialog 0;", ""}
		
	}; //работы легальные {название, экшн, условия}
	
	life_darkjobs_array[] = {
		/*{ "Грабитель заправок (9 ур.)", "[] call SunriseClient_rob_orderTake; closeDialog 0;", "life_currentExpLevel > 8"},
		{ "Наркокурьер (11 ур.)", "[] call SunriseClient_dcourrier_orderTake; closeDialog 0;", "life_currentExpLevel > 10"},
		{ "Чистильщик (13 ур.)", "[] call SunriseClient_dcleaner_orderTake; closeDialog 0;", "life_currentExpLevel > 12"},
		{ "Диверсант (15 ур.)", "[] call SunriseClient_terror_orderTake; closeDialog 0;", "life_currentExpLevel > 14"}*/
		{ "Грабитель заправок", "[] call SunriseClient_rob_orderTake; closeDialog 0;", ""},
		{ "Наркокурьер", "[] call SunriseClient_dcourrier_orderTake; closeDialog 0;", ""},
		{ "Чистильщик", "[] call SunriseClient_dcleaner_orderTake; closeDialog 0;", ""},
		{ "Диверсант", "[] call SunriseClient_terror_orderTake; closeDialog 0;", ""}
	}; //работы нелегальные {название, экшн, условия}

	//DHL носильщик Коробки
	life_ds_price = 5000; //сколько платим за выполненное задание +++
	life_ds_box = "Land_dhl_korobka"; //класс коробки, которую надо носить

	//Развозчик топлива
	life_gas_office = "gas_ofice_mark"; // маркер офиса Развозчика
	life_gas_office_spawn = "gas_spawnCar"; // маркер офиса Развозчика, где спаун тачек
	life_gas_vehicle_class = "d3s_maz_6317_cistern"; //класс фургона, который даем на задание
	life_gas_price = 20; ////сколько платим за метр +++
	life_gas_vehicle_price = 25000; //сколько платим за машину

	//Дальнобойщик
	life_dlv_office = "dlv_marker"; // маркер офиса электриков, где спаун тачек
	life_dlv_office_spawn = "dlv_office_car"; // маркер офиса электриков, где спаун тачек
	life_dlv_vehicle_class = "Zil130_dhl"; //класс фургона, который даем на задание электрикам
	life_dlv_price = 10; ////сколько платим за метр +++
	life_dlv_vehicle_price = 15000; //сколько платим за машину

	//Водитель автобуса
	life_bus_office = "bus_marker"; // маркер офиса автобусников, где спаун тачек
	life_bus_office_spawn = "bus_office_car"; // маркер офиса автобусников, где спаун тачек
	life_bus_vehicle_class = "av_bus"; //класс фургона, который даем на задание
	life_bus_price = 100000; //сколько платим за выполненное задание +++
	life_bus_cloth_price = 2500; //сколько платим за форму
	life_bus_vehicle_price = 2500; //сколько платим за машину
	life_bus_points[] = {
		{3608.18,12963.9,0}, 
		{3985.44,12204.5,0}, 
		{4435.42,12465.1,0}, 
		{5165.55,14383.2,0},
		{6016.41,14895.2,0},
		{7165.67,16403.2,0},
		{9167.49,15804.9,0},
		{11133.8,14444.9,0},
		{11650.6,13713.3,0},
		{10935.8,13468.1,0},
		{9046.84,11974.9,0},
		{7141.71,11054.6,0},
		{5164.97,11157,0},
		{4332.81,12048.3,0},
		{3557.57,12785.2,0}
	}; //позиция маркеров для автобуса

	//Электрик
	life_eln_office = "eln_marker"; // маркер офиса электриков, где спаун тачек
	life_eln_office_spawn = "eln_office_car"; // маркер офиса электриков, где спаун тачек
	life_eln_vehicle_class = "d3s_focus_14"; //класс фургона, который даем на задание электрикам
	life_eln_price = 40000; //сколько платим за выполненное задание +++
	life_eln_cloth_price = 2500; //сколько платим за форму
	life_eln_vehicle_price = 2500; //сколько платим за машину

	//DHL авто
	life_dhl_office = "dhl_marker"; //маркер офиса DHL, где спаун тачек делаем
	life_dhl_office_spawn = "dhl_office_car"; //маркер офиса DHL, где спаун тачек делаем
	life_dhl_vehicle_class = "C_Van_01_box_F_EXT_DHL"; //класс фургона, который даем на задание
	life_dhl_box = "Land_dhl_package"; //класс коробки, которую надо носить
	life_dhl_price = 3.5; //сколько платим за метр +++
	life_dhl_cloth_price = 2500; //сколько платим за форму
	life_dhl_vehicle_price = 2500; //сколько платим за машину

	//Эколог земля
	life_eco_office = "ecolog_marker"; //маркер офиса эколога, где берется задание

	life_eco_gs_office_spawn = "ecolog_office_car"; //маркер офиса эколога, где спаун тачек делаем
	life_eco_gs_vehicle_class = "d3s_focus_14"; //класс фургона, который даем на задание
	life_eco_gs_price = 15000; //сколько платим за работу +++
	life_eco_gs_cloth_price = 2500; //сколько платим за форму
	life_eco_gs_vehicle_price = 2500; //сколько платим за машину
	life_eco_gs_car_points[] = {
		{9462,13850,0},
		{6667,11542,0},
		{11715,13366,0},
		{12232,15611,0}
	}; //позиция маркеров для пробоотборщика

	//Эколог вода
	life_eco_ws_office_spawn = "ecolog_office_boat"; //маркер офиса эколога, где спаун лодки делаем
	life_eco_ws_vehicle_class = "B_Lifeboat"; //класс лодки, которую даем на задание
	life_eco_ws_price = 50000; //сколько платим за работу
	life_eco_ws_cloth_price = 2500; //сколько платим за форму
	life_eco_ws_vehicle_price = 2500; //сколько платим за машину
	life_eco_ws_vehicle_points[] = {
		{995,23319,0},
		{958,19632,0},
		{1986,15958,0},
		{1572,11872,0},
		{2888,7534,0},
		{3866,5403,0},
		{6370,15982,0},
		{7983,18740,0},
		{6956,10451,0},
		{3210,11300,0},
		{9409,10244,0},
		{6095,3383,0},
		{3663,2092,0},
		{719,6501,0},
		{1708,15917,0}
	}; //позиция маркеров для пробоотборщика

	//darkjobs 
	life_rob_price = 25000; //сколько платим за ограбление заправки гарантированная часть, бонусом идет рандомное из этого же
	life_dcourrier_price = 60000; //сколько платим за выполненное задание
	life_terror_price = 15000; //сколько платим за выполненное задание
	life_dcleaner_price = 100000; //сколько платим за выполненное задание

	//каршеринг
	life_cs_price = 250; //цена за минуту
	life_cs_car = "d3s_focus_14"; //класс выдаваемой тачки для каршеринга
	life_cs_fine_distance = 5000; //штраф за то что бросил в поле
	life_cs_fine_damage = 10000; //штраф за урон автомобилю x10 за уничтожение
	life_cs_fine_notRoad = 5000; //штраф за парковку не на дороге

	//Экзамены по вождению
	life_exam_vehicle_driver = "d3s_focus_14"; //класснейм для экзамена наземной техники
	life_exam_vehicle_boat = "I_G_Boat_Transport_01_F"; //класснейм для экзамена водной техники
	life_exam_vehicle_air = "C_Heli_Light_01_civil_F"; //класснейм для экзамена воздушной техники

	life_exam_time_driver = 180; //таймер для экзамена наземной техники в секундах
	life_exam_time_boat = 420; //таймер для экзамена водной техники в секундах 
	life_exam_time_air = 240; //таймер для экзамена воздушной техники в секундах 
	
	life_exam_price_driver = 5000; //цена для экзамена наземной техники
	life_exam_price_boat = 7500; //цена для экзамена водной техники
	life_exam_price_air = 10000; //цена для экзамена воздушной техники
	//Исправительные работы
	life_jail_office[] = {"life_jail_office","life_jail_office_1","life_jail_office_2"}; // маркер в тюрьме, где спаун тачек
	life_jail_truck = "av_HaulTruck"; //класс фургона, который даем на тюрьме

	life_exam_points_driver[] = { 
		{3355.52,12973.2,0},
		{3393.43,12939.4,0},
		{3426.43,12877.8,0},
		{3480.02,12834.2,0},
		{3533.79,12844.7,0},
		{3600.23,12923.9,0},
		{3614.55,12963.1,0},
		{3585.55,13005.5,0},
		{3487.7,13100,0},
		{3415.88,13173.6,0},
		{3391.51,13167.9,0},
		{3360.99,13124,0},
		{3344.7,13103.4,0},
		{3270.06,13073.2,0},
		{3341.87,12982.7,0}
	}; //позиция маркеров, автошкола, наземные. Отсчет с верхнего до нижнего.
	
	life_exam_points_boat[] = {
		{3334.12,14052.5,0},
		{3512.94,13729.9,0},
		{3499,13570.1,0},
		{3235.5,13093.2,0},
		{3193.76,12991.6,0},
		{2707.23,13025,0},
		{2762.07,13415.1,0},
		{3347.01,14067.3,0}
	}; //позиция маркеров, автошкола, водные. Отсчет с верхнего до нижнего.
	
	life_exam_points_air[] = {
		{14763.868,16464.797,0},
		{14650.1,16350,20},
		{14463.9,16242.3,10},
		{14220,16243.5,2.49999},
		{14218.7,15857.9,30},
		{15151,16710.6,7.99998},
		{15180.4,17341.8,160.001},
		{14920.2,17117.5,50},
		{14980.2,16807.8,0},
		{14884.7,16589.8,5}
	}; //позиция маркеров, автошкола, авиа. Отсчет с верхнего до нижнего.

	life_ltd_maxRowsInShop = 150; //макс кол-во позиций в магазине
	life_ltd_maxStacksToAdd = 30; //макс кол-во стаков на одновременное добавление
	
	//Доступные классы магазинов в меню хоткеев
	array_magazine_hotKey[] = {
	"srl_grinder",
	"srl_blastingcharge",
	"srl_canteen_clean_3",
	"srl_canteen_clean_2",
	"srl_canteen_clean_1",
	"srl_bottleclean_100",
	"srl_bottleclean_50",
	"srl_Spirit",
	"srl_franta",
	"srl_canteen_dirty",
	"srl_bottle_dirty",
	"srl_CarltonDraught",
	"srl_Coopers",
	"srl_Corona",
	"srl_Jimbeam",
	"srl_cereal",
	"srl_cereal_50",
	"srl_TacticalBacon_100",
	"srl_TacticalBacon_75",
	"srl_TacticalBacon_50",
	"srl_TacticalBacon_25",
	"srl_BakedBeans_100",
	"srl_BakedBeans_75",
	"srl_BakedBeans_50",
	"srl_BakedBeans_25",
	"srl_MeatC",
	"srl_SmithsChips",
	"srl_Steak",
	"srl_Ration_A",
	"srl_Ration_B",
	"srl_Sardine_100",
	"srl_Sardine_50",
	"srl_canFruits_100",
	"srl_canFruits_75",
	"srl_canFruits_50",
	"srl_canFruits_25",
	"srl_HamCheeseSanga",
	"srl_MaggiiNoodle",
	"srl_Sausages",
	"srl_Bread",
	"srl_Orange",
	"srl_TacticalBacon",
	"srl_BakedBeans",
	"srl_Sardine",
	"srl_canFruits",
	"srl_woodenLog",
	"srl_canteen_empty",
	"srl_bottle_empty",
	"srl_redgull",
	"srl_Buffout",
	"srl_ItemJet",
	"srl_ItemPsycho",
	"srl_ItemRadX",
	"srl_ItemTurbo",
	"srl_ItemDetoxin",
	"srl_vitaminbottle",
	"srl_bandage",
	"srl_antibiotic",
	"srl_painkillers",
	"srl_ItemMorphine",
	"srl_ItemSurgeryKit",
	"srl_ItemAdrenaline",
	"srl_Meat",
	"srl_Fuelcan",
	"srl_CanisterOil",
	"srl_Waterpure",
	"srl_MetalWire",
	"srl_lockpick",
	"srl_alert_new",
	"srl_MeatB",
	"srl_tire_new",
	"srl_Flare_new",
	"srl_TacticalBacon_heat",
	"srl_BakedBeans_heat",
	"srl_HamCheeseSanga_heat",
	"srl_MaggiiNoodle_heat",
	"srl_Sausages_heat",
	"srl_Bread_heat",
	"srl_bottleclean_ice",
	"srl_Spirit_ice",
	"srl_franta_ice",
	"srl_CarltonDraught_ice",
	"srl_Corona_ice",
	"srl_Coopers_ice",
	"srl_Jimbeam_ice",
	"srl_BakedBeans_100_heat",
	"srl_BakedBeans_75_heat",
	"srl_BakedBeans_50_heat",
	"srl_BakedBeans_25_heat",
	"srl_TacticalBacon_100_heat",
	"srl_TacticalBacon_75_heat",
	"srl_TacticalBacon_50_heat",
	"srl_TacticalBacon_25_heat"
  };

	//world settings
	class Sunrise {
		life_sz[] = {
			{ "s_z_kavala", 120 },
			{ "gz_pd", 38 },
			{ "players_spawn_zone", 100 }
		};
		life_dp_points[] = {"dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"};
		life_gangResources = "[mari_processor,coke_processor,heroin_processor,meth_processor,uran_processor,uran_processor_clean]";
		life_platformZlevel = 193;
		life_atm_positions[] = {{3505.47,13153.4,0.176364},{3281.82,12963.6,0.179143},{7081.41,16402.8,0.166931},{9187.64,15841.3,0},{12415.6,15561.5,0.165489},{12589.4,14374.5,0.165322},{14065.4,18694,0},{13996.4,18814.9,0},{16453.2,17220.9,0.175751},{17431.5,13948.2,0.165309},{18137.4,15266.5,0.108999},{20936.4,16846,0.154366},{20236.1,11616.4,0.167133},{20475.5,8885.9,0.168007},{21700.6,7540.35,0},{20778.8,6802.24,0.156685}}; //позиции банкоматов
	};
	class Tanoa {
		life_sz[] = {
			{ "players_spawn_zone", 100 }
		};
		life_dp_points[] = {};
		life_posWhite[] = {};
		life_gangResources = "[]";
		life_platformZlevel = 69;
	};
};
class Experience {
	class Actions {
		#include "Config_Actions.hpp"
	};
	class Levels {
		#include "Config_Levels.hpp"
	};
	class Perks {
		#include "Config_Perks.hpp"
	};
};

#include "Config_traders.hpp"
#include "Config_RemoteExec.hpp"
#include "Config_Spyglass.hpp"
#include "Config_Licenses.hpp"
#include "Config_Clothing.hpp"
#include "Config_VirtualItems.hpp"
#include "Config_VirtShops.hpp"
#include "Config_Passports.hpp"
#include "Config_Housing.hpp"
#include "Config_Crafting.hpp"
#include "Config_Tags.hpp"
#include "Config_Skins.hpp"
#include "Config_Trunks.hpp"
#include "Config_Spawn.hpp"
#include "Config_Vehicles.hpp"
#include "Config_VehShops.hpp"
#include "Config_vehcolors.hpp"
#include "Config_Adac.hpp"
#include "Config_Garages.hpp"
#include "Config_Items.hpp"
#include "Config_Weapons.hpp"
#include "Config_Crimes.hpp"
#include "Config_Titles.hpp"
#include "Config_Gather.hpp"
#include "Config_Markers.hpp"
#include "Config_BattleVehicle.hpp"
#include "Config_Themes.hpp"
#include "Config_Archeology.hpp"
#include "Config_WarZones.hpp"
#include "Config_Factories.hpp"
#include "Config_Gates.hpp"
#include "Config_Jobs.hpp"
#include "Config_Hazard.hpp"
#include "Config_dance.hpp"
#include "Config_gestureplayer.hpp"
#include "config_pose.hpp"