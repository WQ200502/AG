/*
	class {
		vItemSpace = вместительность багажника для виртуальных предметов (0 = нету)
		conditions = условия в формате "true" (пока что не используется)
		price = базовая цена
		textures[] = {
			{"класс из LifeCfgVehTextures", {"флаг маназина техники"}, "conditions для использования этого цвета" }
		};
		materials[] = {классы из LifeCfgVehMaterials};
	};
*/
class LifeCfgVehicles {
	// CARS
	class BaseCar {
		vItemSpace = 50;
		maxContainers = 0;
		nitro = 1;
		conditions = "";
		price = 15000;
		textures[] = {
			{"custom", {"civ"}, "" },
			{"c_black", {"civ"}, "" },
			{"c_white", {"civ"}, "" },
			{"c_grey", {"civ"}, "" },
			{"c_red", {"civ"}, "" },
			{"c_east", {"civ"}, "" },
			{"c_brown", {"civ"}, "" },
			{"c_orange", {"civ"}, "" },
			{"c_yellow", {"civ"}, "" },
			{"c_khaki", {"civ"}, "" },
			{"c_green", {"civ"}, "" },
			{"c_guer", {"civ"}, "" },
			{"c_blue", {"civ"}, "" },
			{"c_west", {"civ"}, "" },
			{"c_pink", {"civ"}, "" },
			{"c_carbon", {"civ"}, "" },
			{"c_civ", {"civ"}, "" }
		};
		materials[] = {"glossy","metallic","matte","chrome"};
	};
	class B_Quadbike_01_F: BaseCar {
		vItemSpace = 25;
		conditions = "(call life_donator) > 0";
		conditionsMsg = "c VIP ур. 1";
		price = 6100;
		textures[] = {
			{"qdbk_reb", {"civ"}, "" },
			{"qdbk_b", {"civ"}, "" },
			{"qdbk_bl", {"civ"}, "" },
			{"qdbk_r", {"civ"}, "" },
			{"qdbk_w", {"civ"}, "" },
			{"qdbk_g", {"civ"}, "" },
			{"qdbk_cm", {"civ"}, "" }			
		};
		materials[] = {};
	};
	class UAZ_Rebels {
		vItemSpace = 80; 
		conditions = "";
		price = 300000; 
		textures[] = {};
		materials[] = {};
	};
	class UAZ_Unarmed: UAZ_Rebels {};
	class UAZ_green: UAZ_Rebels {};
	class UAZ_Hunter_s: UAZ_Rebels {};
	class UAZ_Hunter_g: UAZ_Rebels {};
	class B_mas_cars_LR_Unarmed {
		vItemSpace = 80; 
		conditions = "";
		price = 300000;
		textures[] = {};
		materials[] = {};
	};
	class C_SUV_01_F: BaseCar {
		vItemSpace = 50; 
		price = 14800; 
		textures[] = {
			{"suv_br", {"civ"}, "" },
			{"suv_b", {"civ"}, "" },
			{"suv_s", {"civ"}, "" },
			{"suv_o", {"civ"}, "" },
			{"suv_cop", {"cop"}, "" },
			{"suv_vx6", {"civ"}, "(call life_donator) > 0" },
			{"suv_vd", {"civ"}, "(call life_donator) > 0" },
			{"suv_vnc", {"civ"}, "(call life_donator) > 0" },
			{"suv_vo", {"civ"}, "(call life_donator) > 0" },
			{"suv_vs", {"civ"}, "(call life_donator) > 0" },
			{"suv_vpm", {"civ"}, "(call life_donator) > 0" },
			{"suv_vme", {"civ"}, "(call life_donator) > 0" },
			{"suv_vgr", {"civ"}, "(call life_donator) > 0" },
			{"suv_vsw", {"civ"}, "(call life_donator) > 0" },
			{"suv_vcx", {"civ"}, "(call life_donator) > 0" },
			{"suv_vfs", {"civ"}, "(call life_donator) > 0" },
			{"suv_vme2", {"civ"}, "(call life_donator) > 0" }
		};
	};
	class C_Offroad_01_F {
		vItemSpace = 65; 
		conditions = "";
		price = 25000; 
		textures[] = {
			{"ffrd_r", {"civ"}, "" }, 
			{"ffrd_y", {"civ"}, "" },
			{"ffrd_w", {"civ"}, "" },
			{"ffrd_b", {"civ"}, "" },
			{"ffrd_br", {"civ"}, "" },
			{"ffrd_bw", {"civ"}, "" },
			{"ffrd_sb", {"civ"}, "(call life_donator) > 0" },
			{"ffrd_cop", {"cop"}, "" },
			{"rgb_cy", {"civ"}, "" },
			{"ffrd_v1", {"civ"}, "(call life_donator) > 0" },
			{"ffrd_7n", {"press"}, "" },
			{"ffrd_ro", {"civ"}, "(call life_donator) > 0" },
			{"ffrd_bear", {"civ"}, "(call life_donator) > 0" },
			{"ffrd_2l", {"civ"}, "(call life_donator) > 0" },
			{"ffrd_gv", {"civ"}, "(call life_donator) > 0" }
		};
	};
	class B_mas_cars_Hilux_Unarmed {
		vItemSpace = 65; 
		conditions = "";
		price = 70000; 
		textures[] = {};
		materials[] = {};
	};
	class 2108_stock: BaseCar {
		vItemSpace = 50;
		price = 60000;
	};
	class sunrise_fpace_17_fe {
		vItemSpace = 50;
		nitro = 1;
		conditions = "";
		price = 3900000; 
		textures[] = {
			{"custom", {"civ"}, "" },
			{"fpacefe1", {"civ"}, "" }, 
			{"fpacefe2", {"civ"}, "" },
			{"fpacefe3", {"civ"}, "" },
			{"fpacefe4", {"civ"}, "" },
			{"fpacefe5", {"civ"}, "" },
			{"fpacefe6", {"civ"}, "" },
			{"fpacefe7", {"civ"}, "" },
			{"fpacefe8", {"civ"}, "" },
			{"fpacefe9", {"civ"}, "" },
			{"fpacefe10", {"civ"}, "" },
			{"fpacefe11", {"civ"}, "" },
			{"fpacefe12", {"civ"}, "" }
		};
		materials[] = {"glossy","metallic","matte","chrome"};
	};
	class sunrise_vklasse_17: BaseCar {
		vItemSpace = 80; 
		conditions = "";
		price = 369750; 
		textures[] = {};
		
	};
	class sunrise_vklasse_17_COP {
		vItemSpace = 160;
		conditions = "";
		price = 60000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_challenger_15_COP {
		vItemSpace = 160;
		conditions = "";
		price = 150000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_e400_16_COP {
		vItemSpace = 160;
		conditions = "";
		price = 240000;
		textures[] = {};
		materials[] = {};
	};
	class d3s_stinger_20_Police {
		vItemSpace = 160;
		conditions = "";
		price = 180000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_explorer_13_COP {
		vItemSpace = 160;
		conditions = "";
		price = 88000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_charger_15_COP {
		vItemSpace = 160;
		conditions = "";
		price = 130000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_taurus_10_COP {
		vItemSpace = 160;
		conditions = "";
		price = 75000;
		textures[] = {};
		materials[] = {};
	};
    class sunrise_vklasse_17_SCS {
		vItemSpace = 160;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	
	class sunrise_srthellcat_15_COP {
		vItemSpace = 90;
		conditions = "";
		price = 800000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_svr_17_COP {
		vItemSpace = 90;
		conditions = "";
		price = 1200000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_f90_18_COP {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_cherokee_18_COP {
		vItemSpace = 90;
		conditions = "";
		price = 600000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_g500_18_COP {
		vItemSpace = 90;	
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_durango_18_CSN {
		vItemSpace = 90;
		conditions = "";
		price = 533333;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_raptor_17_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 278000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_savana_05_unm {
		vItemSpace = 90;
		conditions = "";
		price = 633333;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_fseries_17_P3E {
		vItemSpace = 90;
		conditions = "";
		price = 633333;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_O_MRAP_02_F_CSN {
		vItemSpace = 90;
		conditions = "";
		price = 1200000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_CSN_HMMWV_HMG {
		vItemSpace = 90;
		conditions = "";
		price = 1333333;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_I_MRAP_03_F_MVD {
		vItemSpace = 90;
		conditions = "";
		price = 800000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_e400_16_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_s600_17_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_srthellcat_15_CPST {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};	
	class sunrise_srthellcat_15_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 130000;
		textures[] = {};
		materials[] = {};
	};
	class d3s_crown_98_PD {
		vItemSpace = 90;
		conditions = "";
		price = 42000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_cherokee_18_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 150000;
		textures[] = {};
		materials[] = {};
	};
	class d3s_tahoe_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 140000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_malibu_18_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_f86_15_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_camry_18_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_g63amg_16_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_G12_20_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_g500_18_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_RS7_13_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_boss_13_UNM {
		vItemSpace = 90;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
    class sunrise_s600_17_gov {
		vItemSpace = 160;
		conditions = "";
		price = 600000;
		textures[] = {};
		materials[] = {};
	};
    class sunrise_boss_15_COP {
		vItemSpace = 50;
		conditions = "";
		price = 10000000;
		textures[] = {};
		materials[] = {};
	};	
    class sunrise_boss_15: BaseCar {
		vItemSpace = 50;
		price = 2883333;
	};	
    class sunrise_g63amg_16_COP {
		vItemSpace = 50;
		conditions = "";
		price = 800000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_gls63amg_17_UNM {
		vItemSpace = 50;
		conditions = "";
		price = 280000;
		textures[] = {};
		materials[] = {};
	};
    class sunrise_savana_COP {
		vItemSpace = 50;
		conditions = "";
		price = 333333;
		textures[] = {};
		materials[] = {};
	};
    class sunrise_savana_INKAS {
		vItemSpace = 50;
		conditions = "";
		price = 425000;
		materials[] = {};
	};	
	class sunrise_ctsv_16_IND: BaseCar {
		conditions = "";
		price = 1000000; 
		materials[] = {};
	};
	class sunrise_g850_17: BaseCar {
		price = 6315000; 
		materials[] = {};
	};
	class sunrise_g800_17: BaseCar {price = 6321000;};
	class sunrise_focus_17_RS: BaseCar {
		price = 3200000;
		materials[] = {};
	};
	class sunrise_focus_17: BaseCar {price = 650000;};
	class sunrise_focus_14_ST: BaseCar {
		price = 540000; 
		materials[] = {};
	};
	class sunrise_focus_14: BaseCar {price = 500000;};
	class sunrise_focus_14_H: BaseCar {price = 3000000;};
	class sunrise_f90_18 {
		vItemSpace = 65;
		conditions = "";
		price = 1580000;
		textures[] = {
			{"bmw5_cia_bel", {"civ"}, "" },
			{"bmw5_cia_korch", {"civ"}, "" },
			{"bmw5_cia_black", {"civ"}, "" },
			{"bmw5_cia_blue", {"civ"}, "" },
			{"bmw5_cia_silver1", {"civ"}, "" },
			{"bmw5_cia_silver2", {"civ"}, "" },
			{"bmw5_cia_blue_imp", {"civ"}, "" },
			{"bmw5_cia_yellou", {"civ"}, "" },
			{"bmw5_cia_1", {"civ"}, "" },
			{"bmw5_cia_2", {"civ"}, "" },
			{"bmw5_vip_1", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_2", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_3", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_4", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_5", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_6", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_7", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_8", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_9", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_10", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_12", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_13", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_14", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_15", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_16", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_17", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_18", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_19", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_20", {"civ"}, "(call life_donator) > 0" },
			{"bmw5_vip_21", {"civ"}, "(call life_donator) > 0" }	
		};
		materials[] = {};
	};
	//GL AMG
	class sunrise_gl63amg_12: BaseCar {
		vItemSpace = 125;
		conditions = "";
		price = 945250;
		materials[] = {};
	};
	// GLS AMG
	class sunrise_gls63amg_17: BaseCar {
		vItemSpace = 200;
		conditions = "";
		price = 3750000;
		materials[] = {};
	};
	class sunrise_raptor_17 {
		vItemSpace = 250;
		conditions = "";
		price = 867250;
		textures[] = {
			{"rap_rmc", {"civ"}, "" },
			{"rap_1", {"civ"}, "" },
			{"rap_2", {"civ"}, "" },
			{"rap_3", {"civ"}, "" },
			{"rap_4", {"civ"}, "" },
			{"rap_5", {"civ"}, "" },
			{"rap_6", {"civ"}, "" },
			{"rap_7", {"civ"}, "" },
			{"rap_8", {"civ"}, "" },
			{"rap_9", {"civ"}, "" },
			{"rap_10", {"civ"}, "" },
			{"rap_11", {"civ"}, "" },
			{"rap_12", {"civ"}, "" },
			{"rap_13", {"civ"}, "" },
			{"rap_15", {"civ"}, "" },
			{"rap_16", {"civ"}, "(call life_donator) > 0" },
			{"rap_17", {"civ"}, "" },
			{"rap_18", {"civ"}, "" },
			{"rap_19", {"civ"}, "" },
			{"rap_20", {"civ"}, "" },
			{"rap_vip_1", {"civ"}, "(call life_donator) > 0" },
			{"rap_vip_2", {"civ"}, "(call life_donator) > 0" },
			{"rap_vip_3", {"civ"}, "(call life_donator) > 0" },
			{"rap_vip_4", {"civ"}, "(call life_donator) > 0" },
			{"rap_vip_5", {"civ"}, "(call life_donator) > 0" },
			{"rap_vip_6", {"civ"}, "(call life_donator) > 0" },
			{"rap_vip_7", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class sunrise_taurus_eco_10: BaseCar {
		vItemSpace = 85;
		conditions = "";
		price = 43200;
		materials[] = {};
	};

	class sunrise_ctsv_16: BaseCar {vItemSpace = 120; price = 1333333;};
	class sunrise_savana_05: BaseCar {vItemSpace = 150; price = 35000;};
	class sunrise_savana_VAN: BaseCar {vItemSpace = 250; price = 63500;};
	class sunrise_G12_20_745: BaseCar {vItemSpace = 90; price = 1500000;};
	class sunrise_vesta_15: BaseCar {price = 28210;};	
	class sunrise_taurus_10: BaseCar {price = 51700;};	
	class sunrise_300C_12: BaseCar {price = 49200;};
	class sunrise_300S_12: BaseCar {price = 57100;};
	class sunrise_300SRT_12: BaseCar {price = 250000;};
	class sunrise_charger_15: BaseCar {price = 175625;};
	class sunrise_charger_15_SXT: BaseCar {price = 290000;};
	class sunrise_charger_15_RT: BaseCar {price = 300000;};
	class sunrise_explorer_13: BaseCar {price = 214750;};
	class d3s_clubman_11: BaseCar {price = 247750;};
	class d3s_911gt3rs_18: BaseCar {price = 1552750;};
	class sunrise_explorer_sport_13: BaseCar {price = 92000;};
	class sunrise_malibu_18: BaseCar {price = 333333;};
	class sunrise_malibu_18_LT: BaseCar {price = 63050;};
	class sunrise_malibu_18_Prem: BaseCar {price = 83200;};
	class sunrise_cherokee_18: BaseCar {price = 391750;};
	class sunrise_cherokee_18_TRCK: BaseCar {price = 555555;};
	class sunrise_durango_18: BaseCar {price = 235250;};
	class sunrise_durango_18_SRT: BaseCar {price = 1800000;};
	class sunrise_durango_18_se: BaseCar {price = 667500;};
	class sunrise_e220_16: BaseCar {price = 292500;};
	class sunrise_e250_16: BaseCar {price = 407500;};
	class sunrise_e350_16: BaseCar {price = 502500;};
	class sunrise_svr_17_SD4: BaseCar {price = 348600;};
	class sunrise_svr_17_TDV: BaseCar {price = 772250;};
	class sunrise_svr_17_SVR: BaseCar {price = 3000000;};
	class sunrise_svr_17_V8: BaseCar {price = 1230000;};
	class sunrise_q50_14: BaseCar {price = 537500;};
	class sunrise_q50_ER_14: BaseCar {price = 637750;};
	class sunrise_macan_16: BaseCar {price = 4000000;};
	class sunrise_macan_s_16: BaseCar {price = 745000;};
	class sunrise_panamera_17: BaseCar {price = 1312500;};
	class sunrise_escalade_16: BaseCar {price = 1377750;};
	class sunrise_s560_18: BaseCar {vItemSpace = 120; price = 5333333;};
	class sunrise_g500_18: BaseCar {price = 1431250;};
	class sunrise_e89_12: BaseCar {price = 632500;};
	class sunrise_amgGT_15: BaseCar {price = 1577500;};
	class sunrise_alfieri_14: BaseCar {price = 1658000;};
	class sunrise_asterion_15: BaseCar {price = 2275000;};
	class d3s_fiesta_16: BaseCar {price = 33000;};
	class sunrise_fpace_17_r: BaseCar {price = 578000;};
	class sunrise_h1_06: BaseCar {vItemSpace = 100;price = 378250;};
	class sunrise_juke_15: BaseCar {vItemSpace = 65;price = 271250;};
	class d3s_eqc_20: BaseCar {vItemSpace = 65;price = 1188250;};
	class d3s_impala_67_S: BaseCar {vItemSpace = 65;price = 1500000;};
	class d3s_MustangF3_67: BaseCar {vItemSpace = 65;price = 528000;};
	class sunrise_f87_17: BaseCar {vItemSpace = 65;price = 455250;};
	class d3s_e38_98: BaseCar {vItemSpace = 65;price = 339000;};
	class d3s_e39_03: BaseCar {vItemSpace = 65;price = 431250;};
	class d3s_crown_98: BaseCar {vItemSpace = 65;price = 40000;};
	class d3s_cla_220_15: BaseCar {vItemSpace = 65;price = 315000;};
	class d3s_w140_98: BaseCar {vItemSpace = 65;price = 478750;};
	class d3s_s560_18: BaseCar {vItemSpace = 65;price = 1322500;};
	class d3s_novus_phantom_18: BaseCar {vItemSpace = 65;price = 2037500;};
	class d3s_vv222_18: BaseCar {vItemSpace = 65;price = 1705000;};
	class sunrise_continentalGT_18: BaseCar {vItemSpace = 65;price = 1310250;};
	class sunrise_LaFerrari_14: BaseCar {vItemSpace = 65;price = 2400000;};
	class sunrise_mclaren_18: BaseCar {vItemSpace = 65;price = 3300000;};
	class sunrise_amgGT_19_53: BaseCar {vItemSpace = 65;price = 1590000;};
	class sunrise_stelvio_18_Ti: BaseCar {vItemSpace = 65;price = 1047500;};
	class d3s_G07_x30d_19: BaseCar {vItemSpace = 65;price = 1962500;};
	class sunrise_escalade_20_L: BaseCar {vItemSpace = 65;price = 1035000;};
	class d3s_raptor_17: BaseCar {vItemSpace = 65;price = 346900;};
	class d3s_gle43amg_15: BaseCar {vItemSpace = 65;price = 855250;};
	class d3s_amgGT_20_B: BaseCar {vItemSpace = 65;price = 2875250;};
	class sunrise_w212_13: BaseCar {vItemSpace = 65;price = 1497000;};
	class d3s_skylark_54: BaseCar {vItemSpace = 65;price = 711300;};
	class d3s_eldorado_76: BaseCar {vItemSpace = 65;price = 900300;};
	class d3s_tornado_gtaV: BaseCar {vItemSpace = 65;price = 723000;};
	class d3s_hornet_54: BaseCar {vItemSpace = 65;price = 780000;};
	class d3s_roosevelt_gtaV: BaseCar {vItemSpace = 65;price = 576000;};
	class d3s_300SL_55: BaseCar {vItemSpace = 65;price = 1046700;};
	
	// HK
	class sunrise_B_Heli_Light_01_F_HK{
		vItemSpace = 80; 
		conditions = "";
		price = 800000; 
		textures[] = {};
		materials[] = {};
	};
	class sunrise_EC635_Unarmed_HK{
		vItemSpace = 80; 
		conditions = "";
		price = 1666666; 
		textures[] = {};
		materials[] = {};
	};
	class HK_ifrit_WD{
		vItemSpace = 65; 
		conditions = "";
		price = 866666; 
		textures[] = {};
		materials[] = {};
	};
	// ЛК
	class sunrise_G12_20_760: sunrise_G12_20_745 {price = 1000000;};
	class sunrise_w212s_13_EX: sunrise_G12_20_745 {price = 1000000;};
	class sunrise_C63S_14_EX : sunrise_G12_20_745 {price = 1000000;};
	class sunrise_g63amg_18_e1: sunrise_G12_20_745 {price = 1000000;};
	class sunrise_g65amg_Mansory: sunrise_G12_20_745 {price = 1000000;};
	class sunrise_g65amg_Mansory_2: sunrise_G12_20_745 {price = 1000000;};
	class sunrise_amgGTR_15: sunrise_G12_20_745 {price = 1000000;};
	class sunrise_G05_x45e_18 : sunrise_G12_20_745 {price = 1000000;};
	class sunrise_G07_x45e_19 : sunrise_G12_20_745 {price = 1000000;};
	//TESTER
	class sunrise_E46_NFS {
		vItemSpace = 65;
		conditions = "";
		price = 1150000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_200_16_EX: BaseCar {vItemSpace = 65;price = 1500000;};
	//Личка

	//sunrise_wrx_17
	class sunrise_wrx_17 {
		vItemSpace = 120;
		conditions = "";
		price = 3000000;
		textures[] = {
			{"wrx_1", {"civ"}, "" },
			{"wrx_2", {"civ"}, "" },
			{"wrx_3", {"civ"}, "" },
			{"wrx_4", {"civ"}, "" },
			{"wrx_5", {"civ"}, "" },
			{"wrx_6", {"civ"}, "" },
			{"wrx_7", {"civ"}, "" },
			{"wrx_8", {"civ"}, "" }
		};
		materials[] = {};
	};
	class sunrise_wrx_sti_17: sunrise_wrx_17 {price = 3000000;};
	
	
	
	// TRUCK
	class BaseTruck {
		vItemSpace = 250;
		maxContainers = 0;
		nitro = 1;
		conditions = "";
		price = 15000;
		license = "driver";
		requiredLvl = 0;
		requiredVipLvl = 0;
		textures[] = {
			{"custom", {"civ"}, "" }
		};
		materials[] = {};
	};
	class Freeman_UralNext: BaseTruck {
		vItemSpace = 600;
		conditions = "";
		price = 6000000;
	};
	
	class I_Truck_02_covered_F: BaseTruck {
		vItemSpace = 400;
		conditions = "";
		price = 430000;
		textures[] = {
			{"itc_cm", {"civ"}, "" }
		};
		materials[] = {};
	};
	class O_Truck_02_covered_F: BaseTruck {
		vItemSpace = 400;
		conditions = "";
		price = 430000;
		textures[] = {};
		materials[] = {};
	};
	class I_Truck_02_covered_CIV_F: BaseTruck {
		vItemSpace = 450;
		maxContainers = 2;
		conditions = "";
		price = 131200;
		textures[] = {
			{"itcc_or", {"civ"}, "" },
			{"itcc_r", {"civ"}, "(call life_donator) > 0" },
			{"itcc_s", {"civ"}, "(call life_donator) > 0" },
			{"itcc_w", {"civ"}, "(call life_donator) > 0" },
			{"itcc_y", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class O_Truck_02_fuel_F {
		vItemSpace = 450; 
		conditions = "";
		price = 135200;
		textures[] = {};
		materials[] = {};
	};
	class I_Truck_02_transport_F {
		vItemSpace = 300; 
		conditions = "";
		price = 166666; 
		textures[] = {
			{"itcc_or", {"civ"}, "" },
			{"itc_cia", {"cop"}, "" },
			{"itc_cm", {"civ"}, "" }
		};
		materials[] = {};
	};
	class C_Van_01_transport_F {
		vItemSpace = 100; 
		conditions = "";
		price = 50000; 
		textures[] = {
			{"vtt_w", {"civ"}, "" },
			{"vtt_r", {"civ"}, "" }
		};
		materials[] = {};
	};
	class C_Van_01_fuel_F {
		vItemSpace = 200; 
		conditions = "";
		price = 133333;
		textures[] = {};
		materials[] = {};
	};
	class I_G_Van_01_transport_F {
		vItemSpace = 200; 
		conditions = "";
		price = 133333;
		textures[] = {};
		materials[] = {};
	};
	class C_Van_01_box_F {
		vItemSpace = 200; 
		conditions = "";
		price = 100000;
		textures[] = {
			{"vtt_w", {"civ"}, "" },
			{"vtt_r", {"civ"}, "" }
		};
		materials[] = {};
	};
	class B_Truck_01_box_F {
		vItemSpace = 1300; 
		conditions = "";
		price = 5000000; 
		textures[] = {};
		materials[] = {};
	};
	class B_Truck_01_box_CIV_F {
		vItemSpace = 1500;
		conditions = "";
		price = 2400000;
		textures[] = {
			{"hmt_def", {"civ"}, "" },
			{"hmt_bl", {"civ"}, "(call life_donator) > 0" },
			{"hmt_gs", {"civ"}, "(call life_donator) > 0" },
			{"hmt_mh", {"civ"}, "(call life_donator) > 0" },
			{"hmt_or", {"civ"}, "(call life_donator) > 0" },
			{"hmt_pr", {"civ"}, "(call life_donator) > 0" },
			{"hmt_r", {"civ"}, "(call life_donator) > 0" },
			{"hmt_y", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class B_Truck_01_fuel_F {
		vItemSpace = 1300; 
		conditions = "";
		price = 5000000; 
		textures[] = {};
		materials[] = {};
	};
	class B_Truck_01_fuel_CIV_F {
		vItemSpace = 1500; 
		conditions = "";
		price = 2400000; 
		textures[] = {
			{"tfc_def", {"civ"}, "" },
			{"tfc_bl", {"civ"}, "(call life_donator) > 0" },
			{"tfc_gs", {"civ"}, "(call life_donator) > 0" },
			{"tfc_mh", {"civ"}, "(call life_donator) > 0" },
			{"tfc_or", {"civ"}, "(call life_donator) > 0" },
			{"tfc_pr", {"civ"}, "(call life_donator) > 0" },
			{"tfc_r", {"civ"}, "(call life_donator) > 0" },
			{"tfc_y", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class B_Truck_01_mover_F {
		vItemSpace = 400; 
		conditions = "";
		price = 300000;
		textures[] = {
			{"hmt_def", {"civ"}, "" },
			{"hmt_bl", {"civ"}, "(call life_donator) > 0" },
			{"hmt_gs", {"civ"}, "(call life_donator) > 0" },
			{"hmt_mh", {"civ"}, "(call life_donator) > 0" },
			{"hmt_or", {"civ"}, "(call life_donator) > 0" },
			{"hmt_pr", {"civ"}, "(call life_donator) > 0" },
			{"hmt_r", {"civ"}, "(call life_donator) > 0" },
			{"hmt_y", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class B_Truck_01_transport_F {
		vItemSpace = 650; 
		maxContainers = 3;
		conditions = "";
		price = 516000;
		textures[] = {};
		materials[] = {};
	};
	class B_Truck_01_covered_F {
		vItemSpace = 1100; 
		maxContainers = 3;
		conditions = "";
		price = 1065600;
		textures[] = {};
		materials[] = {};
	};
	class I_mas_cars_Ural_fuel {
		vItemSpace = 600; 
		conditions = "";
		price = 546666;
		textures[] = {};
		materials[] = {};
	};
	class I_mas_cars_Ural {
		vItemSpace = 600; 
		conditions = "";
		price = 546666; 
		textures[] = {};
		materials[] = {};
	};
	class I_mas_cars_Ural_open {
		vItemSpace = 450; 
		conditions = "";
		price = 333333; 
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_transport_F {
		vItemSpace = 600; 
		maxContainers = 2;
		conditions = "";
		price = 343200; 
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_fuel_F {
		vItemSpace = 900; 
		conditions = "";
		price = 865200; 
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_covered_F {
		vItemSpace = 900; 
		maxContainers = 2;
		conditions = "";
		price = 744000;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_device_F {
		vItemSpace = 450; 
		conditions = "";
		price = 2666666;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_02_medical_F {
		vItemSpace = 50;
		conditions = "";
		price = 250000;
		textures[] = {};
		materials[] = {};
	};
	class SCHS_tempest {
		vItemSpace = 800;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};	
	class DAR_MK23T {
		vItemSpace = 800; 
		conditions = "";
		price = 733333; 
		textures[] = {};
		materials[] = {};
	};
	class DAR_MK27T {
		vItemSpace = 1000; 
		maxContainers = 2;
		conditions = "";
		price = 986400; 
		textures[] = {};
		materials[] = {};
	};
	class DAR_MK27ET {
		vItemSpace = 1300; 
		conditions = "";
		price = 2004000; 
		textures[] = {};
		materials[] = {};
	};
	class DAR_4X4T {
		vItemSpace = 350; 
		maxContainers = 1;
		conditions = "";
		price = 74555; 
		textures[] = {};
		materials[] = {};
	};
	class C_Van_01_box_F_EXT_DHL {
		vItemSpace = 100;
		conditions = "";
		price = 133333;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_maz_6317 {
		vItemSpace = 400;
		conditions = "";
		price = 250000;
		textures[] = {
			{"maz_white", {"civ"}, "" },
			{"maz_blue", {"civ"}, "" },
			{"maz_green", {"civ"}, "" },
			{"maz_haki", {"civ"}, "" },
			{"maz_orange", {"civ"}, "" },
			{"maz_red", {"civ"}, "" },
			{"maz_violet", {"civ"}, "" },
			{"maz_yellow", {"civ"}, "" },
			{"maz_camo1", {"civ"}, "(call life_donator) > 0" },
			{"maz_camo2", {"civ"}, "(call life_donator) > 0" },
			{"maz_camo3", {"civ"}, "(call life_donator) > 0" },
			{"maz_camo4", {"civ"}, "(call life_donator) > 0" },
			{"maz_camo5", {"civ"}, "(call life_donator) > 0" },
			{"maz_camo6", {"civ"}, "(call life_donator) > 0" },
			{"maz_camo7", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class sunrise_maz_6317_tent {
		vItemSpace = 600;
		conditions = "";
		price = 800000;
		textures[] = {
			{"mazt_white", {"civ"}, "" },
			{"mazt_blue", {"civ"}, "" },
			{"mazt_green", {"civ"}, "" },
			{"mazt_haki", {"civ"}, "" },
			{"mazt_orange", {"civ"}, "" },
			{"mazt_red", {"civ"}, "" },
			{"mazt_violet", {"civ"}, "" },
			{"mazt_yellow", {"civ"}, "" },
			{"mazt_camo1", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo2", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo3", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo4", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo5", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo6", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo7", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class sunrise_maz_6317_cistern {
		vItemSpace = 600;
		conditions = "";
		price = 800000;
		textures[] = {
			{"mazt_white", {"civ"}, "" },
			{"mazt_blue", {"civ"}, "" },
			{"mazt_green", {"civ"}, "" },
			{"mazt_haki", {"civ"}, "" },
			{"mazt_orange", {"civ"}, "" },
			{"mazt_red", {"civ"}, "" },
			{"mazt_violet", {"civ"}, "" },
			{"mazt_yellow", {"civ"}, "" },
			{"mazt_camo1", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo2", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo3", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo4", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo5", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo6", {"civ"}, "(call life_donator) > 0" },
			{"mazt_camo7", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class sunrise_maz_7429 {
		vItemSpace = 1200;
		conditions = "";
		price = 1200000;
		textures[] = {
			{"mzk_white", {"civ"}, "" },
			{"mzk_blue", {"civ"}, "" },
			{"mzk_green", {"civ"}, "" },
			{"mzk_yellow", {"civ"}, "" },
			{"mzk_orange", {"civ"}, "" },
			{"mzk_red", {"civ"}, "" },
			{"mzk_brown", {"civ"}, "" },
			{"mzk_sea", {"civ"}, "(call life_donator) > 0" },
			{"mzk_blue_black", {"civ"}, "(call life_donator) > 0" },
			{"mzk_mosaic", {"civ"}, "(call life_donator) > 0" },
			{"mzk_girl", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class d3s_next: BaseCar {maxContainers = 2; vItemSpace = 575; price = 301680;};
	class d3s_next_bocha: BaseCar {vItemSpace = 700; price = 486000;};
	class d3s_next_tent: BaseCar {maxContainers = 2; vItemSpace = 800; price = 602397;};
	class d3s_kamaz_4350_tent2 {
		vItemSpace = 650; 
		maxContainers = 2;
		conditions = "";
		price = 410400; 
		textures[] = {};
		materials[] = {};
	};
	class sunrise_fseries_XLT_17 {
		vItemSpace = 300; 
		maxContainers = 1;
		conditions = "";
		price = 226200; 
		textures[] = {};
		materials[] = {};
	};
	class d3s_SRmh_9500 {
		vItemSpace = 500; 
		maxContainers = 2;
		conditions = "";
		price = 266400; 
		textures[] = {};
		materials[] = {};
	};
	class d3s_scania_16_t50 {
		vItemSpace = 1300; 
		conditions = "";
		price = 2210400; 
		textures[] = {};
		materials[] = {};
	};
	class d3s_scania_16 {
		vItemSpace = 1200; 
		conditions = "";
		price = 2251200; 
		textures[] = {};
		materials[] = {};
	};
	class d3s_actros_14 {
		vItemSpace = 1300; 
		conditions = "";
		price = 2352000; 
		textures[] = {};
		materials[] = {};
	};
	
	
	
	
	// BOAT
	class C_Boat_Civil_01_F {
		vItemSpace = 85; 
		conditions = "";
		price = 55000;
		textures[] = {};
		materials[] = {};
	};
	class B_SDV_01_F {
		vItemSpace = 200; 
		conditions = "";
		price = 120000;
		textures[] = {};
		materials[] = {};
	};
	class I_SDV_01_F: B_SDV_01_F{};
	class C_Boat_Civil_01_police_F {
		vItemSpace = 85; 
		conditions = "";
		price = 160000;
		textures[] = {};
		materials[] = {};
	};
	class C_Boat_Civil_01_rescue_F {
		vItemSpace = 85; 
		conditions = "";
		price = 160000;
		textures[] = {};
		materials[] = {};
	};
	class Burnes_MK10_1 {
		vItemSpace = 150;
		conditions = "";
		price = 150000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_lcm {
		vItemSpace = 100;
		conditions = "";
		price = 666666;
		textures[] = {};
		materials[] = {};
	};
	class C_Fishing_Boat_Apex {
		vItemSpace = 800;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};
	class av_fishing_boat {
		vItemSpace = 600;
		conditions = "";
		price = 250000;
		textures[] = {};
		materials[] = {};
	};
	class C_Rubberboat {
		vItemSpace = 50; 
		conditions = "";
		price = 25000;
		textures[] = {};
		materials[] = {};
	};
	class ext_sab_boat {
		vItemSpace = 100;
		conditions = "";
		price = 70000;
		textures[] = {
			{"xsb_s", {"civ"}, "" },
			{"xsb_f", {"civ"}, "" },
			{"xsb_v", {"civ"}, "" },
			{"xsb_r", {"civ"}, "" }
		};
		materials[] = {};
	};
	class I_Boat_Transport_01_F {
		vItemSpace = 0; 
		conditions = "";
		price = 60000; 
		textures[] = {};
		materials[] = {};
	};
	class O_Boat_Armed_01_hmg_F {
		vItemSpace = 175;
		conditions = "";
		price = 600000;
		textures[] = {};
		materials[] = {};
	};
	class B_Boat_Armed_01_minigun_F {
		vItemSpace = 175;
		conditions = "";
		price = 600000;
		textures[] = {};
		materials[] = {};
	};
	class I_Boat_Armed_01_minigun_F {
		vItemSpace = 175;
		conditions = "";
		price = 600000;
		textures[] = {};
		materials[] = {};
	};
	class B_G_Boat_Transport_01_F {
		vItemSpace = 45;
		conditions = "";
		price = 600000;
		textures[] = {};
		materials[] = {};
	};
	class B_Boat_Transport_01_F {
		vItemSpace = 45; 
		conditions = "";
		price = 60000;
		textures[] = {};
		materials[] = {};
	};
	
	
	
	// БРОНЕТЕХНИКА \ ТЯЖ.ТЕХНИКА
	class B_MRAP_01_F {
		vItemSpace = 65; 
		conditions = "";
		price = 1000000; 
		textures[] = {
			{"bmrp_cia", {"cop"}, "life_coplevel == 20" },
			{"bmrp_sba",{"cop"}, "life_coplevel == 20" },
			{"bmrp_ds", {"civ"}, "" }
		};
		materials[] = {};
	};
	class B_MRAP_01_hmg_F {
		vItemSpace = 65; 
		conditions = "";
		price = 100000000; 
		textures[] = {};
		materials[] = {};
	};	
	class O_MRAP_02_F {
		vItemSpace = 60; 
		conditions = "";
		price = 2300000; 
		textures[] = {
			{"mrp_g", {"civ"}, "" },
			{"mrp_med", {"med"}, "" },
			{"mrp_cg", {"civgang"}, "" },
			{"mrp_ur", {"civ"}, "(call life_donator) > 0" },
			{"mrp_swat", {"cop"}, "life_coplevel > 15" },
			{"mrp_dea", {"dea"}, "" },
			{"mrp_og", {"og"}, "" },
			{"mrp_7n", {"press"}, "" }
		};
		materials[] = {};
	};
	class I_MRAP_03_F {
		vItemSpace = 58;
		conditions = "";
		price = 2500000; 
		textures[] = {
			{"strd_cop", {"cop"}, "" },
			{"strd_reb", {"rebgang","civgang"}, "" },
			{"strd_med", {"med"}, "" },
			{"strd_un", {"un"}, "" },
			{"strd_dea", {"dea"}, "" }
		};
		materials[] = {};
	};	
	class B_mas_HMMWV_UNA {
		vItemSpace = 58; 
		conditions = "";
		price = 3000000;
		textures[] = {
			{ "hmmv_reb", {"rebgang","civgang"}, "" },
			{ "hmmv_fed", {"cop","swat","dea"}, "" }
		};
		materials[] = {};
	};
	class B_mas_HMMWV_SWAT: B_mas_HMMWV_UNA {textures[] = {"\platinm_hmmwv\data\swat\h_body_co.paa"};};
	class B_mas_HMMWV_TOW {
		vItemSpace = 58; 
		conditions = "";
		price = 4000000;
		textures[] = {
			{ "hmmv_reb", {"rebgang","civgang"}, "" },
			{ "hmmv_fed", {"cop","swat","dea"}, "" }
		};
		materials[] = {};
	};
	class B_mas_HMMWV_SWAT_TOW: B_mas_HMMWV_TOW {};
	class B_mas_HMMWV_DEA_TOW: B_mas_HMMWV_TOW {};
	class B_mas_HMMWV_M2 {
		vItemSpace = 58; 
		conditions = "";
		price = 3000000;
		textures[] = {
			{ "hmmv_reb", {"rebgang","civgang"}, "" },
			{ "hmmv_fed", {"cop","swat","dea"}, "" },
			{ "hmmv_fb", {"fb"}, "" }
		};
		materials[] = {};
	};
	class B_mas_HMMWV_SWAT_M2: B_mas_HMMWV_M2 {};
	class B_mas_HMMWV_DEA_M2: B_mas_HMMWV_M2 {};
	
	
	
	// АВИАТЕХНИКА
	class B_Heli_Light_01_F {
		vItemSpace = 90; 
		conditions = "";
		price = 413000;
		textures[] = {
			{"humm_cop", {"cop"}, "" },
			{"humm_cia", {"cop"}, "" },
			{"humm_bl", {"civ"}, "" },
			{"humm_r", {"civ"}, "" },
			{"humm_vme", {"civ"}, "(call life_donator) > 0" },
			{"humm_bln", {"civ"}, "" },
			{"humm_llp", {"civ"}, "" },
			{"humm_fr", {"civ"}, "" },
			{"humm_bj", {"civ"}, "" },
			{"humm_rl", {"civ"}, "" },
			{"humm_sn", {"civ"}, "" },
			{"humm_vrn", {"civ"}, "" },
			{"humm_wv", {"civ"}, "" },
			{"humm_reb", {"civ"}, "" },
			{"humm_rg", {"rebgang","civgang"}, "" },
			{"humm_swt", {"swat"}, "" },
			{"humm_tgr", {"civ"}, "" },
			{"humm_rnbw", {"civ"}, "" },
			{"humm_plxe", {"civ"}, "" },
			{"humm_sky", {"civ"}, "" }
		};
		materials[] = {};
	};
	class EC635_Unarmed {
		vItemSpace = 90; 
		conditions = "";
		price = 2400000; 
		textures[] = {};
		materials[] = {};
	};
	class sunrise_B_Heli_Light_01_F_PD {
		vItemSpace = 90; 
		conditions = "";
		price = 250000; 
		textures[] = {};
		materials[] = {};
	};
	class sunrise_I_Heli_light_03_unarmed_base_F_MVD {
		vItemSpace = 90; 
		conditions = "";
		price = 1200000; 
		textures[] = {};
		materials[] = {};
	};
	class sunrise_CSN_LB {
		vItemSpace = 90; 
		conditions = "";
		price = 800000; 
		textures[] = {};
		materials[] = {};
	};
	class sunrise_EC635_Unarmed_MVD {
		vItemSpace = 90; 
		conditions = "";
		price = 1200000; 
		textures[] = {};
		materials[] = {};
	};
	class sunrise_CSN_UH {
		vItemSpace = 90; 
		conditions = "";
		price = 1200000; 
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Transport_04_bench_F {
		vItemSpace = 90; 
		conditions = "";
		price = 1333333; 
		textures[] = {
			{"htb_cia", {"cop"}, "" }
		};
		materials[] = {};
	};
	class B_Heli_Transport_01_F {
		vItemSpace = 0; 
		conditions = "";
		price = 16000000;
		textures[] = {};
		materials[] = {};
	};
	class B_mas_UH1Y_UNA_F {
		vItemSpace = 90; 
		conditions = "";
		price = 4000000;
		textures[] = {
			{ "uh1y_fed", {"cop"}, "" },
			{ "uh1y_reb", {"rebgang","civgang"}, "" },
			{ "uh1y_fb", {"fb"}, "" },
			{ "uh1y_un", {"un"}, "" },
			{ "uh1y_dea", {"dea"}, "" }
		};
		materials[] = {};
	};
	class B_mas_UH60M_SF {
		vItemSpace = 0; 
		conditions = "";
		price = 1333333;
		textures[] = {};
		materials[] = {};
	};
	class I_Heli_light_03_unarmed_F {
		vItemSpace = 250; 
		conditions = "";
		price = 1333333; 
		textures[] = {
			{"hllc_cia", {"cop"}, "" },
			{"hllc_g", {"civ"}, "" },
			{"hllc_rg", {"rebgang","civgang"}, "" },
			{"hllc_cop", {"cop"}, "" }
		};
		materials[] = {};
	};
	class C_Heli_Light_01_civil_F {
		vItemSpace = 90; 
		conditions = "";
		price = 250000;
		textures[] = {
			{"humm_bln", {"civ"}, "" },
			{"humm_reb", {"reb"}, "" },
			{"humm_llp", {"civ"}, "" },
			{"humm_fr", {"civ"}, "" },
			{"humm_gra", {"civ"}, "" },
			{"humm_bj", {"civ"}, "" },
			{"humm_lg", {"civ"}, "" },
			{"humm_shd", {"civ"}, "" },
			{"humm_shr", {"civ"}, "" },
			{"humm_rl", {"civ"}, "(call life_donator) > 0" },
			{"humm_sn", {"civ"}, "(call life_donator) > 0" },
			{"humm_vrn", {"civ"}, "" },
			{"humm_wsp", {"civ"}, "(call life_donator) > 0" },
			{"humm_wv", {"civ"}, "" },
			{"humm_tx", {"taxi"}, "" }
		};
		materials[] = {};
	};
	class C_Heli_Light_01_civil_Taxi {
		vItemSpace = 90; 
		conditions = "";
		price = 600000;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Light_02_unarmed_F {
		vItemSpace = 220; 
		conditions = "";
		price = 500000; 
		textures[] = {
			{"orc_cia", {"cop"}, "" },
			{"orc_wb", {"civ"}, "" },
			{"orc_cm", {"civ"}, "(call life_donator) > 0" },
			{"orc_reb", {"civ"}, "" },
			{"orc_cop", {"cop"}, "" }
		};
		materials[] = {};
	};
	class B_Heli_Transport_03_unarmed_F {
		vItemSpace = 1400; 
		conditions = "";
		price = 11333333;
		textures[] = {
			{"hrn_fed", {"cop","swat"}, "" },
			{"hrn_med", {"med"}, "" }
		};
		materials[] = {};
	};
	class I_Heli_Transport_02_F {
		vItemSpace = 450; 
		conditions = "";
		price = 660000;
		textures[] = {
			{ "hltt_bw", {"civ"}, "" },
			{ "hltt_gw", {"civ"}, "" },
			{ "hltt_cia", {"cop"}, "" }
		};
		materials[] = {};
	};
	class O_Heli_Transport_04_covered_F {
		vItemSpace = 350; 
		conditions = "";
		price = 600000;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Transport_04_box_F {
		vItemSpace = 800; 
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Transport_04_fuel_F {
		vItemSpace = 800; 
		conditions = "";
		price = 1000000; 
		textures[] = {};
		materials[] = {};
	};
	class I_Plane_Fighter_03_AA_F {
		vItemSpace = 0; 
		conditions = "";
		price = 5000000;
		textures[] = {};
		materials[] = {};
	};
	class C_Plane_Civil_01_F {
		vItemSpace = 200; 
		conditions = "";
		price = 250000;
		textures[] = {
			{"cpc_wbl", {"civ"}, "(call life_donator) > 0" },
			{"cpc_bly", {"civ"}, "(call life_donator) > 0" },
			{"cpc_gw", {"civ"}, "(call life_donator) > 0" },
			{"cpc_r", {"civ"}, "(call life_donator) > 0" }
		};
		materials[] = {};
	};
	class B_mas_UH60M_MEV {
		vItemSpace = 600;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};	
	class med_uh {
		vItemSpace = 80;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};	
	class EC635_Unarmed_SCHS { //СЧС NEW
		vItemSpace = 80;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};	
	class SCHS_TARU {
		vItemSpace = 900;
		conditions = "";
		price = 5000000;
		textures[] = {};
		materials[] = {};
	};	
	class Littlebird_SCHS {
		vItemSpace = 80;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class SCHS_orca {
		vItemSpace = 150;
		conditions = "";
		price = 1400000;
		textures[] = {};
		materials[] = {};
	};
	class Littlebird_EMS {
		vItemSpace = 80;
		conditions = "";
		price = 210000;
		textures[] = {};
		materials[] = {};
	};	
	
	
	
	class sfp_wheelchair {
		vItemSpace = 0;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};	
	class mercedes_atego_pompier_ingame {
		vItemSpace = 50;
		conditions = "";
		price = 450000;
		textures[] = {};
		materials[] = {};
	};
	
	
	class SCHS_cars_1 {
		vItemSpace = 80;
		conditions = "";
		price = 200000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_fseries_17_SCS {
		vItemSpace = 80;
		conditions = "";
		price = 300000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_savana_SCS {
		vItemSpace = 150;
		conditions = "";
		price = 400000;
		textures[] = {};
		materials[] = {};
	};
		
	class sunrise_durango_18_SCHS {
		vItemSpace = 90;
		conditions = "";
		price = 800000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_explorer_13_SCHS {
		vItemSpace = 90;
		conditions = "";
		price = 50000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_vklasse_17_SCHS {
		vItemSpace = 90;
		conditions = "";
		price = 70000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_e400_16_EMS {
		vItemSpace = 90;
		conditions = "";
		price = 110000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_charger_15_SCHS {
		vItemSpace = 90;
		conditions = "";
		price = 90000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_f90_18_SCHS {
		vItemSpace = 90;
		conditions = "";
		price = 410000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_cherokee_18_EMS {
		vItemSpace = 80;
		conditions = "";
		price = 147000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_escalade_16_SCS {
		vItemSpace = 90;
		conditions = "";
		price = 650000;
		textures[] = {};
		materials[] = {};
	};
	class sunrise_g500_18_SCS {
		vItemSpace = 90;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class O_Heli_Transport_04_medevac_F {
		vItemSpace = 50;
		conditions = "";
		price = 3000000;
		textures[] = {};
		materials[] = {};
	};
	class O_T_LSV_02_unarmed_F {
		vItemSpace = 50;
		conditions = "";
		price = 1200000;
		textures[] = {};
		materials[] = {};
	};	
	class B_T_LSV_01_unarmed_F {
		vItemSpace = 50;
		conditions = "";
		price = 1200000;
		textures[] = {};
		materials[] = {};
	};		
	class B_mas_HMMWV_M134_des {
		vItemSpace = 15;
		conditions = "";
		price = 4000000;
		textures[] = {};
		materials[] = {};
	};
	class B_G_Offroad_01_armed_F {
		vItemSpace = 50;
		conditions = "";
		price = 1000000;
		textures[] = {
			{"ffrd_bg_r", {"reb","rebgang","civgang"}, "" },
			{"ffrd_cop", {"cop"}, "" }
		};
		materials[] = {};
	};
	class B_mas_cars_Hilux_M2 {
		vItemSpace = 50;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};
	class I_mas_cars_UAZ_M2 {
		vItemSpace = 50;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};
	class B_mas_cars_LR_M2 {
		vItemSpace = 50;
		conditions = "";
		price = 500000;
		textures[] = {};
		materials[] = {};
	};
	
	
	class PMC_Offroad_Transport {
		vItemSpace = 50;
		conditions = "";
		price = 300000;
		textures[] = {};
		materials[] = {};
	};
	class PMC_Offroad_Armed {
		vItemSpace = 50;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};

	class C_Offroad_02_unarmed_F {
		vItemSpace = 50;
		conditions = "";
		price = 19200;
		textures[] = {
			{"codu_w", {"civ"}, "" },
			{"codu_r", {"civ"}, "" },
			{"codu_o", {"civ"}, "" },
			{"codu_bl", {"civ"}, "" }
		};
		materials[] = {};
	};
	
	class O_mas_BTR60 {
		vItemSpace = 0;
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class B_APC_Wheeled_01_cannon_F {
		vItemSpace = 0;
		conditions = "";
		price = 15000000;
		textures[] = {
			{"apcw_fed", {"cop","dea"}, "" },
			{"apcw_civ", {"civ"}, "" }
		};
		materials[] = {};
	};
	class O_MRAP_02_hmg_F {
		vItemSpace = 65;
		conditions = "";
		price = 100000000;
		textures[] = {
			{"mrp_g", {"civ"}, "" },
			{"mrp_cg", {"civ"}, "" }
		};
		materials[] = {};
	};	
	class I_MRAP_03_hmg_F {
		vItemSpace = 65; 
		conditions = "";
		price = 100000000; 
		textures[] = {};
		materials[] = {};
	};
	
	//Freeman car 
	class Oka_stock: BaseCar {vItemSpace = 50; price = 100000;};
	class zaz968m_stock: BaseCar {vItemSpace = 65; price = 250000;};
	class B63S: BaseCar {vItemSpace = 65; price = 2500000;};
	class Uaz_Hunter: BaseCar {vItemSpace = 65; price = 500000;};
	class Priora_stock: BaseCar {vItemSpace = 65; price = 500000;};
	class GMC_Vandura: BaseCar {vItemSpace = 65; price = 2500000;};
	class Gaz3110_stock: BaseCar {vItemSpace = 65; price = 450000;};	
	class zaz965_halfstock: BaseCar {vItemSpace = 65; price = 300000;};	
	class Vaz2101_stock: BaseCar {vItemSpace = 65; price = 300000;};
	class BMW_I8_cop {
		vItemSpace = 65;
		conditions = "";
		price = 2500000;
		textures[] = {};
		materials[] = {};
	};
	class BMW_X6M_sk {
		vItemSpace = 65;
		conditions = "";
		price = 1333333;
		textures[] = {};
		materials[] = {};
	};
	class MrFreeman_CSRT8_stock {
		vItemSpace = 65;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};
	class MrFreeman_CSRT8_sk {
		vItemSpace = 65;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};
	class Crown_CopCrown_Cop {
		vItemSpace = 65;
		conditions = "";
		price = 500000;
		textures[] = {};
		materials[] = {};
	};
	class Vandura_cop {
		vItemSpace = 65;
		conditions = "";
		price = 500000;
		textures[] = {};
		materials[] = {};
	};
	class Vandura_swat {
		vItemSpace = 65;
		conditions = "";
		price = 500000;
		textures[] = {};
		materials[] = {};
	};
	class MrFreeman_GoldWing_cop {
		vItemSpace = 65;
		conditions = "";
		price = 500000;
		textures[] = {};
		materials[] = {};
	};
	class Cherokee_swat {
		vItemSpace = 65;
		conditions = "";
		price = 800000;
		textures[] = {};
		materials[] = {};
	};
	class G65_cop {
		vItemSpace = 65;
		conditions = "";
		price = 2500000;
		textures[] = {};
		materials[] = {};
	};
	class G65_SK {
		vItemSpace = 65;
		conditions = "";
		price = 2500000;
		textures[] = {};
		materials[] = {};
	};
	class MrFreeman_crab {
		vItemSpace = 65;
		conditions = "";
		price = 3000000;
		textures[] = {};
		materials[] = {};
	};
	class Uaz_Hunter_cop {
		vItemSpace = 65;
		conditions = "";
		price = 700000;
		textures[] = {};
		materials[] = {};
	};
	class Uaz_hunter_med {
		vItemSpace = 65;
		conditions = "";
		price = 500000;
		textures[] = {};
		materials[] = {};
	};
	class G65_Med {
		vItemSpace = 65;
		conditions = "";
		price = 1333333;
		textures[] = {};
		materials[] = {};
	};
	class BMW_X5M_ben {
		vItemSpace = 65;
		conditions = "";
		price = 1500000;
		textures[] = {};
		materials[] = {};
	};
	class Vandura_med {
		vItemSpace = 65;
		conditions = "";
		price = 500000;
		textures[] = {};
		materials[] = {};
	};
	class Ural_M70_custom_green {
		vItemSpace = 50;
		conditions = "";
		price = 350000;
		textures[] = {
			{"white", {"civ"}, "" },
			{"red", {"civ"}, "" },
			{"dblue", {"civ"}, "" },
			{"grey", {"civ"}, "" },
			{"yelow", {"civ"}, "" },
			{"noir", {"civ"}, "" },
			{"orange", {"civ"}, "" },
			{"rose", {"civ"}, "" },
			{"fiol", {"civ"}, "" },
			{"dred", {"civ"}, "" },
			{"green", {"civ"}, "" },
			{"dgreen", {"civ"}, "" },
			{"black", {"civ"}, "" },
			{"blue", {"civ"}, "" }			
		};
		materials[] = {};
	};
	class MrFreeman_ghoast {//rent
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class MrFreeman_SPwrx {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class cruiser200 {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class TrikeV8 {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class Vaz2103_black {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class Startech {
		vItemSpace = 50;
		conditions = "";
		price = 1333333;
		textures[] = {};
		materials[] = {};
	};
	class G65_Stock {
		vItemSpace = 50;
		conditions = "";
		price = 5000000;
		textures[] = {};
		materials[] = {};
	};
	class Maybach_exelero {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class M20project_auk {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class MrFreeman_lx570_stock {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class GX460_stock {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class Freeman_Cherokee {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class MrFreeman_InfinitiFX_stock {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class MrFreeman_GoldWing {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class Crown_Stock {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class MrFreeman_CSRT8_civ {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class Impala_1960 {
		vItemSpace = 50;
		conditions = "";
		price = 282000;
		textures[] = {};
		materials[] = {};
	};
	class Impala_1960_roof {
		vItemSpace = 50;
		conditions = "";
		price = 293000;
		textures[] = {};
		materials[] = {};
	};
	class zl1 {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class BrabusW140 {
		vItemSpace = 50;
		conditions = "";
		price = 2500000;
		textures[] = {};
		materials[] = {};
	};
	class brabus_6x6 {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class B850S {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class BMW_X6M {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class BMW_X5M_davidich {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class bmw_i8 {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class Bentayga {
		vItemSpace = 50;
		conditions = "";
		price = 4000000;
		textures[] = {};
		materials[] = {};
	};
	class AMG_GT {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class Titan_Freeman {
		vItemSpace = 50;
		conditions = "";
		price = 750000;
		textures[] = {};
		materials[] = {};
	};
	class I_mas_T34_Berlin_01 {
		vItemSpace = 65; 
		conditions = "";
		price = 1000000;
		textures[] = {};
		materials[] = {};
	};
	class Alpha_Ifrit {
		vItemSpace = 65; 
		conditions = "";
		price = 1333333;
		textures[] = {};
		materials[] = {};
	};	
	
	
	// GANGS
	class PS_ST {
		vItemSpace = 58;
		conditions = "";
		price = 400000; 
		textures[] = {};
		materials[] = {};
	};	
	class PS_Homyak {
		vItemSpace = 85;
		conditions = "";
		price = 350000; 
		textures[] = {};
		materials[] = {};
	};
};