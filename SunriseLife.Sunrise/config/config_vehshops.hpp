class LifeCfgVehShops {
	
	class med_shop_car {
		conditions = "life_medDuty AND 'driver' in life_licenses";
		conditionsMessage = "Нужно состоять на службе и иметь лицензию водителя";
		multiplier = 0.06;
		vehicles[] = {
			
			{ "sunrise_explorer_13_SCHS", "", "c Intern", "true" },
			{ "sunrise_vklasse_17_SCHS", "life_medlevel > 1", "с Doctor", "false" },
			{ "sunrise_charger_15_SCHS", "life_medlevel > 1", "с Doctor", "false" },
			{ "sunrise_e400_16_EMS", "life_medlevel > 2", "с Therapist", "false" }			
		};
	};

	class med_shop_air {
		conditions = "life_medDuty AND 'air' in life_licenses";
		conditionsMessage = "Нужно состоять на службе и иметь лицензию пилота";
		multiplier = 0.06;
		vehicles[] = {
			{ "Littlebird_EMS", "", "", "false" }
			
		};
	};

	class avto_car {
		conditions = "'driver' in life_licenses";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {
			{ "B_Quadbike_01_F", "", "", "true" }, //6100
			{ "C_SUV_01_F", "", "", "true" }, //14800			
			{ "C_Offroad_02_unarmed_F", "", "", "true" }, //19200
			{ "sunrise_vesta_15", "", "", "true" }, //28210
			{ "d3s_fiesta_16", "", "", "true" }, //33000
			{ "sunrise_savana_05", "", "", "true" },//35000
			{ "d3s_crown_98", "", "", "true" }, //40000
			{ "sunrise_taurus_eco_10", "", "", "true" }, //43200
			{ "sunrise_300C_12", "", "", "true" }, //49200								
			{ "sunrise_malibu_18_LT", "", "", "true" }, //63.050
			
			{ "sunrise_charger_15", "", "", "true" }, //70250 //175625						
			{ "sunrise_explorer_13", "", "", "true" }, //85900 //214750			
			{ "sunrise_durango_18", "", "", "true" }, //94100 //235250	
			{ "d3s_clubman_11", "", "", "true" }, //99100 //247750
			{ "sunrise_juke_15", "", "", "true" }, //108500	//271250
            { "sunrise_e220_16", "", "", "true" }, //117000 // 292500
			{ "d3s_cla_220_15", "", "", "true" }, //126000 //315000
            { "d3s_e38_98", "", "", "true" }, //135600		//339000				
			{ "sunrise_vklasse_17", "(call life_donator) > 0", "c VIP ур. 1", "true" }, //147900 //369750
			{ "sunrise_h1_06", "", "", "true" }, //151300 //378250
			{ "sunrise_cherokee_18", "", "", "true" }, //156700 // 391750
			{ "sunrise_e250_16", "", "", "true" }, //163000 // 407500
			{ "d3s_e39_03", "", "", "true" }, //172500	//431250		 
			{ "sunrise_f87_17", "", "", "true" }, //182100 //455250
			{ "sunrise_cherokee_18_TRCK", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //222222 //555555
            { "d3s_w140_98", "", "", "true" }, //191500	//478750	
			{ "sunrise_e350_16", "", "", "true" }, //201000 //502500
			{ "sunrise_q50_14", "", "", "true" },	//215000 //537500
			{ "sunrise_fpace_17_r", "", "", "true" }, //231200 //578000
			{ "sunrise_e89_12", "", "", "true" },// 253000 //632500
			{ "sunrise_q50_ER_14", "", "", "true" },	//255100 //637750			
			{ "sunrise_durango_18_se", "(call life_donator) > 0", "c VIP ур. 1", "true" },	//267000 //667500
            { "sunrise_macan_s_16", "", "", "true" }, //298000 //745000	
            { "sunrise_svr_17_TDV", "", "", "true" }, //308900 //772250
            { "d3s_gle43amg_15", "", "", "true" }, //342100		//855250	
			{ "sunrise_raptor_17", "", "", "true" }, //346900   //867250        
			{ "sunrise_gl63amg_12", "", "", "true" }, //378100	//945250									
			{ "sunrise_escalade_20_L", "", "", "true" }, //414000 //1035000
			{ "sunrise_stelvio_18_Ti", "", "", "true" }, //419000 //1047500		
			{ "d3s_eqc_20", "", "", "true" }, //475300	//1188250
		    { "sunrise_svr_17_V8", "(call life_donator) > 0", "c VIP ур. 1", "true" },	//492000 // 1230000			
						
			{ "sunrise_panamera_17", "(call life_donator) > 0", "c VIP ур. 1", "true" }, // 525000 //1312500
			{ "d3s_s560_18", "", "", "true" }, //529000 //1322500
			{ "sunrise_continentalGT_18", "", "", "true" }, //524100 //1310250
			{ "sunrise_escalade_16", "(call life_donator) > 0", "c VIP ур. 1", "true" }, // 551100 //1377750		
			{ "sunrise_g500_18", "", "", "true" }, // 572500 //1431250
			{ "sunrise_w212_13", "", "", "true" }, //598800 //1497000
			{ "d3s_911gt3rs_18", "", "", "true" }, //621100	//1552750		
			{ "sunrise_amgGT_15", "(call life_donator) > 0", "c VIP ур. 1", "true" },// 631000 // 1577500
			{ "sunrise_f90_18", "(call life_donator) > 0", "c VIP ур. 1", "true" }, //632000 //1580000			
			{ "sunrise_amgGT_19_53", "", "", "true" }, //636000 //1590000
			{ "sunrise_alfieri_14", "", "", "true" },	// 663200 //1658000
			
			{ "d3s_vv222_18", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //682000 //1705000
			{ "d3s_G07_x30d_19", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //785000 //1962500
			{ "d3s_novus_phantom_18", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //815000 //2037500									
			{ "sunrise_asterion_15", "(call life_donator) > 2", "c VIP ур. 3", "true" },// 910000 //2275000
			{ "sunrise_LaFerrari_14", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //960000 //2400000
			{ "d3s_amgGT_20_B", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //1150100 //2875250
			{ "sunrise_mclaren_18", "(call life_donator) > 2", "c VIP ур. 3", "true" } //1320000 //3300000

		};
	};
	class retro_car {
		conditions = "'driver' in life_licenses";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {						
	        { "d3s_MustangF3_67", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //176000 ( ретро ) //528000
			{ "d3s_roosevelt_gtaV", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //192000( ретро) //576000
			{ "d3s_skylark_54", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //237100 ( ретро) //711300
			{ "d3s_tornado_gtaV", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //241000( ретро) //723000
			{ "d3s_hornet_54", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //260000( ретро) //780000
			{ "d3s_eldorado_76", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //300100( ретро) //900300
			{ "d3s_300SL_55", "(call life_donator) > 2", "c VIP ур. 3", "true" }, //348900( ретро) //1046700
            { "d3s_impala_67_S", "(call life_donator) > 2", "c VIP ур. 3", "true" } //500.000 ( ретро ) //1500000				
		};
	};

	class avto_truck {
		conditions = "'driver' in life_licenses";
		conditionsMessage = "Необходима лицензия водителя";
		multiplier = 1;
		vehicles[] = {
			{ "sunrise_savana_VAN", "", "", "true" },//63500
			
			{ "DAR_4X4T", "", "", "true" },//74555						
			{ "I_Truck_02_covered_CIV_F", "", "", "true" },//131200
			{ "O_Truck_02_fuel_F", "", "", "true" },//135200
			
			{ "sunrise_fseries_XLT_17", "", "", "true" },// 226200
			
			{ "d3s_SRmh_9500", "", "", "true" },//266400
			
			{ "d3s_next", "", "", "true" },//301680
			{ "O_Truck_03_transport_F", "", "", "true" },//343200
			{ "d3s_kamaz_4350_tent2", "", "", "true" },//410400
			
			
			{ "d3s_next_bocha", "", "", "true" },//486000
			{ "d3s_next_tent", "", "", "true" },//602397
			{ "B_Truck_01_transport_F", "", "", "true" },//516000
			{ "O_Truck_03_covered_F", "", "", "true" },//744000
			{ "O_Truck_03_fuel_F", "", "", "true" },//865200
			
			{ "DAR_MK27T", "", "", "true" }, //986400
			{ "B_Truck_01_covered_F", "", "", "true" },//1065600
			{ "DAR_MK27ET", "", "", "true" },//2004000
			{ "d3s_scania_16_t50", "", "", "true" },//2210400
			{ "d3s_scania_16", "", "", "true" },///2251200
			{ "d3s_actros_14", "", "", "true" },//2352000
			
			{ "B_Truck_01_box_CIV_F", "", "", "true" },//2400000
			{ "B_Truck_01_fuel_CIV_F", "", "", "true" },//2400000
			
			{ "Freeman_UralNext", "(call life_donator) > 2", "c VIP ур. 3", "true" } //6000000
		};
	};

	class civ_air {
		conditions = "'air' in life_licenses";
		conditionsMessage = "Необходима лицензия пилота";
		multiplier = 1;
		vehicles[] = {
			{ "C_Heli_Light_01_civil_F", "", "", "true" }, // 250000
			{ "B_Heli_Light_01_F", "", "", "true" }, // 413000
			{ "O_Heli_Light_02_unarmed_F", "", "", "true" },//500000
			{ "O_Heli_Transport_04_covered_F", "", "", "true" },//600000
			{ "I_Heli_Transport_02_F", "", "", "true" },//660000
			{ "O_Heli_Transport_04_box_F", "", "", "true" },//1 000 000
			{ "O_Heli_Transport_04_fuel_F", "", "", "true" },//1 000 000
			
			{ "C_Plane_Civil_01_F", "(call life_donator) > 1", "c VIP ур. 2", "true" } // 250000
		};
	};

	class shopveh_ship {
		conditions = "'boat' in life_licenses";
		conditionsMessage = "Необходима лицензия моряка";
		multiplier = 1;
		vehicles[] = {
			{ "C_Rubberboat", "", "", "true" },//25000
			{ "C_Boat_Civil_01_F", "", "", "true" },// 55 000
			{ "ext_sab_boat", "", "", "true" },// 200 000
			{ "B_SDV_01_F", "(call life_donator) > 0", "c VIP ур. 1", "true" },//120000
			{ "av_fishing_boat", "", "", "true" } //250000
			
		};
	};

	class cop_car {
		conditions = "life_copDuty AND 'driver' in life_licenses";
		conditionsMessage = "Нужно состоять на службе и иметь лицензию водителя";
		multiplier = 1;
		vehicles[] = {
			{ "d3s_crown_98_PD", "", "с Cadet", "false" },
			
			{ "sunrise_vklasse_17_COP", "life_coplevel > 1", "c Officer I", "true" },			
			{ "sunrise_taurus_10_COP", "life_coplevel > 1", "c Officer I", "false" },
			{ "sunrise_explorer_13_COP", "life_coplevel > 1", "c Officer I", "false" },
			
			
			{ "sunrise_charger_15_COP", "life_coplevel > 4", "с Sergeant I", "false" },
		
		
			{ "sunrise_challenger_15_COP", "life_coplevel > 7", "с Lieutenant I", "false" },
			{ "d3s_stinger_20_Police", "life_coplevel > 7", "с Lieutenant I", "false" },
			
			
			{ "sunrise_e400_16_COP", "life_coplevel > 10", "с Major", "false" },
			
			{ "sunrise_gls63amg_17_UNM", "life_coplevel > 13", "с General Major", "false" },
		
			{ "sunrise_srthellcat_15_UNM", "life_coplevel in [17]", "с S.W.A.T.", "false" },
			{ "sunrise_cherokee_18_UNM", "life_coplevel in [17]", "с S.W.A.T.", "false" },
			{ "d3s_tahoe_UNM", "life_coplevel in [17]", "с S.W.A.T.", "false" }
			
		
		};
	};
	
	class cop_air {
		conditions = "life_copDuty AND 'air' in life_licenses";
		conditionsMessage = "Нужно состоять на службе и иметь лицензию пилота";
		multiplier = 0.5;
		vehicles[] = {
			{ "sunrise_B_Heli_Light_01_F_PD", "", "", "true" },
			//{ "sunrise_I_Heli_light_03_unarmed_base_F_MVD", "life_coplevel > 5", "", "true" },
			//{ "sunrise_EC635_Unarmed_MVD", "life_coplevel > 8", "", "true" },
			//{ "sunrise_CSN_LB", "life_coplevel in [18,20]", "", "false"  },
			//{ "sunrise_CSN_UH", "life_coplevel in [18,20]", "", "false"  }
		};
	};
	
	class cop_ship {
		conditions = "life_copDuty AND 'ship' in life_licenses";
		conditionsMessage = "Нужно состоять на службе и иметь лицензию моряка";
		multiplier = 0.25;
		vehicles[] = {
			{ "B_Boat_Transport_01_F", "life_coplevel > 1", "", "true" },
			{ "C_Boat_Civil_01_police_F", "life_coplevel > 1", "", "true" },
			{ "B_SDV_01_F", "life_coplevel > 14", "", "true" },
			{ "B_Boat_Armed_01_minigun_F", "life_coplevel > 14", "", "true" }
		};
	};
	
	
	// ГРУППИРОВКИ
	//sparta
	class psycho_car {
		conditions = "'psycho' in life_licenses";
		conditionsMessage = "У вас нет доступа!";
		multiplier = 1;
		vehicles[] = {
			{ "PS_ST", "", "", "true" }
		};
	};
	class psycho_air {
		conditions = "'psycho' in life_licenses";
		conditionsMessage = "У вас нет доступа!";
		multiplier = 1;
		vehicles[] = {
			{ "PS_Homyak", "", "", "true" }
		};
	};
};