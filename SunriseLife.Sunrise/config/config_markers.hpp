/*

	LifeCfgMapCheckBoxes

	Менять можно только titleTXT и markersArray (из LifeCfgMapMarkers)
	Чекбоксы без titleTXT будут скрываться

*/

class LifeCfgMapCheckBoxes {
	class EMM_cb_0 {
		titleID = 1130;
		checkboxID = 1140;
		titleTXT = "Зоны добычи";
		markersArray = "gather";
	};
	class EMM_cb_1 {
		titleID = 1131;
		checkboxID = 1141;
		titleTXT = "Переработка";
		markersArray = "process";
	};
	class EMM_cb_2 {
		titleID = 1132;
		checkboxID = 1142;
		titleTXT = "Скупщики";
		markersArray = "virshop";
	};
	class EMM_cb_3 {
		titleID = 1133;
		checkboxID = 1143;
		titleTXT = "Магазины оружия";
		markersArray = "weapshop";
	};
	class EMM_cb_4 {
		titleID = 1134;
		checkboxID = 1144;
		titleTXT = "Магазины предметов";
		markersArray = "itemshop";
	};
	class EMM_cb_5 {
		titleID = 1135;
		checkboxID = 1145;
		titleTXT = "Магазины одежды";
		markersArray = "clothshop";
	};
	class EMM_cb_6 {
		titleID = 1136;
		checkboxID = 1146;
		titleTXT = "Магазины техники";
		markersArray = "vehsop";
	};
	class EMM_cb_7 {
		titleID = 1137;
		checkboxID = 1147;
		titleTXT = "Услуги";
		markersArray = "service";
	};
	class EMM_cb_8 {
		titleID = 1138;
		checkboxID = 1148;
		titleTXT = "Города / Базы";
		markersArray = "base";
	};
	class EMM_cb_9 {
		titleID = 1139;
		checkboxID = 1149;
		titleTXT = "Гаражи";
		markersArray = "gar";
	};
	class EMM_cb_10 {
		titleID = 1150;
		checkboxID = 1160;
		titleTXT = "Работы";
		markersArray = "jobs";
	};
	class EMM_cb_11 {
		titleID = 1151;
		checkboxID = 1161;
		titleTXT = "Банкоматы";
		markersArray = "other";
	};
};

class LifeCfgMapMarkers {
	class Sunrise {
		other[] = {"0_atm","1_atm","2_atm","3_atm","4_atm","5_atm","6_atm","7_atm","8_atm","9_atm","10_atm","11_atm","12_atm","13_atm","14_atm","15_atm","16_atm","17_atm","18_atm","19_atm","20_atm","21_atm","22_atm","23_atm","24_atm","25_atm","26_atm","27_atm","28_atm","29_atm","30_atm","31_atm","32_atm","33_atm","34_atm","35_atm","36_atm","37_atm","38_atm","39_atm","40_atm","41_atm","42_atm","43_atm","44_atm","45_atm","46_atm","47_atm","48_atm","49_atm","50_atm","51_atm","52_atm","53_atm","54_atm","55_atm","56_atm","57_atm","58_atm","59_atm","60_atm","61_atm","62_atm","63_atm","64_atm","65_atm","66_atm","67_atm","68_atm","69_atm","70_atm","71_atm","72_atm","73_atm","dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22"};
		gather[] = {"Mines_5","Mines_4","Mines_3","Mines_2","marker_almaz","turtle_zone_1","turtle_1","hunt_zone_mark","hunt_zone","cotton_1","apple_1","peaches_1","apple_2","peaches_2","Mines_1","tree_1","oil_1","fish_zone_mark","fish_zone_radius","Mines_konoplya","Mines_rue"};
		base[] = {"base_hospital","base_hospital_1","base_pd","base_pd_1","cpp"};
		process[] = {"proc_copper","proc_silver","proc_bronze","proc_wood","proc_iron","proc_rue","proc_fish","proc_oil","proc_marija","proc_sand","meth_processor","heroin_processor","coke_processor"};
		virshop[] = {"oil_pro_zavod","avto_zavod_marker","weapons_zavod_marker","food_zavod_marker","food_zavod_pirgos_marker"};
		vehsop[] = {"shopveh_car","air_salon_aero","avto_truck_mark","port_marker","port_marker_1","port_marker_2","shopveh_car_1"};
		itemshop[] = {"apteca","univermag","fastfood","fastfood_1","fastfood_2","fastfood_3","univermag_1","univermag_2","univermag_3","apteca_1","apteca_2","apteca_3"};
		weapshop[] = {"weapon_shop_marker"};
		clothshop[] = {"clothing","clothing_1"};
		jobs[] = {"bus_marker","drug_dealer_markers","dhl_marker","birga_marker","eln_marker","ecolog_marker","gruz_depo_marker","gruz_depo_marker_1","gruz_depo_marker_2","gruz_depo_marker_3","gas_ofice_mark"};
		gar[] = {"garage_car","air_garage_aero","air_garage_fenix","garage_car_pirgos","garage_car_sofi","garage_car_atira","garage_car_aero"};
		service[] = {"courier_marker","air_ekzam_mark","ekz_boat_marker","ekz_car_marker","licenze_marker","licenze_marker_pirgos","licenze_marker_sofi","talon_bay_marker","healthyfood_1","healthyfood"};
	};
	
};