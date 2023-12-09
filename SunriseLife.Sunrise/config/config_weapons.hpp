/*
		*ARRAY FORMAT:
		*0: STRING (Classname): Item Classname
		*1: STRING (Nickname): Nickname that will appear purely in the shop dialog
		*2: SCALAR (Buy price)
		*3: SCALAR (Sell price): To disable selling, this should be -1
		*4: STRING (Conditions): Same as above conditions string
*/

class LifeCfgWeaponShops {

	class apteka {
		displayName = "Аптека";
		conditions = "";
		conditionMessage = "";
		items[] = {
			{ "srl_Waterpure", 1, "", "", "true" },
			{ "srl_antibiotic", 1, "", "", "true" },
			{ "srl_vitaminbottle", 1, "", "", "true" },

			{ "srl_bandage", 1, "", "", "true" },
			{ "srl_painkillers", 1, "", "", "true" },
			{ "srl_ItemMorphine", 1, "", "", "true" },
			{ "srl_Buffout", 1, "", "", "true" },
			{ "srl_ItemSurgeryKit", 1, "", "", "true" }
		};
	};

	class cop_weapon {
		displayName = "Оружейная полиции";
		conditions = "life_copDuty";
		conditionMessage = "Вы должны быть на службе";
		items[] = {
			{ "pmc_earpiece", 1, "", "", "true" },				
			{ "Binocular", 2, "", "", "true" },			
			{ "srl_ItemRepairKit", 1, "", "", "true" },
			//{ "srl_bottleclean_100", 1, "", "", "true" },
			{ "srl_canteen_clean_3", 1, "", "", "true" },
			{ "srl_matches", 1, "", "", "true" },
			
	        { "srl_lockpick", 1, "", "", "true" },
			
			{ "srl_Fuelcan", 1, "", "", "true" },			
			{ "ItemGPS", 1, "", "", "true" },
			{ "Medikit", 1, "", "", "true" },
			
			{ "B_UavTerminal", 1, "life_coplevel in [17]", "с S.W.A.T.", "false" },
			
			{ "tf_anprc152", 1, "", "", "true" },			
			{ "tf_anprc148jem", 1, "", "", "true" },
			
			{ "srl_MetalWire", 1, "life_coplevel > 4", "с Sergeant I", "false" },	
			
            { "MineDetector", 1, "life_coplevel > 1", "c Officer I", "false" },
			
			{ "SmokeShell", 2, "life_coplevel > 4", "с Sergeant I", "false" },
            { "MiniGrenade", 1, "life_coplevel > 4", "с Sergeant I", "false" },
			
			{ "srl_prisonKey", 1, "life_coplevel > 1", "c Officer I", "false" },
			
			{ "srl_headBag", 1, "", "", "false" },	// Посмотреть что это
			
			{ "arifle_AK12_lush_F", 2, "(getPlayerUID player in ['76561198289668925'])", "", "false" },
			{ "75rnd_762x39_AK12_Lush_Mag_F", 1, "(getPlayerUID player in ['76561198289668925'])", "", "false" },
			
			{ "optic_Aco", 1, "life_coplevel > 1", "c Officer I", "false" }, //35000
			{ "optic_ACO_grn", 1, "life_coplevel > 1", "c Officer I", "false" }, //35000
			{ "optic_Aco_smg", 1, "life_coplevel > 1", "c Officer I", "false" }, //35000
			
		    { "optic_Holosight_blk_F", 1, "life_coplevel > 4", "с Sergeant I", "false" }, //35000
			{ "optic_mas_kobra", 1, "life_coplevel > 4", "с Sergeant I", "false" }, //35000
			{ "optic_mas_aim", 1, "life_coplevel > 4", "с Sergeant I", "false" }, //35000			
			{ "acc_flashlight", 1, "life_coplevel > 4", "с Sergeant I", "false" }, //5000
			{ "acc_pointer_IR", 1, "life_coplevel > 4", "с Sergeant I", "false" }, //5000			
			{ "bipod_01_F_blk", 1, "life_coplevel > 4", "с Sergeant I", "false" }, //5000
			
			{ "DDOPP_X26_b", 1, "", "", "true" }, //15000
			
			{ "arifle_mas_aks74u", 1, "", "с Cadet", "false" }, //45000
			
			{ "arifle_SDAR_F", 1, "life_coplevel > 1", "c Officer I", "false" }, //50000
			{ "arifle_mas_m4", 1, "life_coplevel > 1", "c Officer I", "false" },  // 60000
			{ "arifle_mas_m27", 1, "life_coplevel > 1", "c Officer I", "false" }, //65000
			{ "arifle_mas_ak_74m", 1, "life_coplevel > 1", "c Officer I", "false" }, //65000
			
			{ "arifle_mas_l119c", 1, "life_coplevel > 4", "с Sergeant I", "false" }, //70000
			{ "arifle_mas_hk416c", 1, "life_coplevel > 4", "с Sergeant I", "false" }, // 70000
			{ "arifle_mas_ak_74m_sf", 1, "life_coplevel > 4", "с Sergeant I", "false" }, // 70000
			{ "arifle_mas_ak12_sf", 1, "life_coplevel > 4", "с Sergeant I", "false" }, //74000
			
			{ "arifle_SPAR_01_blk_F", 1, "life_coplevel > 7", "с Lieutenant I", "false" }, //75000
			{ "arifle_mas_akm", 1, "life_coplevel > 7", "с Lieutenant I", "false" },	//85000
			{ "arifle_MX_Black_F", 1, "life_coplevel > 7", "с Lieutenant I", "false" }, //92000
			{ "arifle_mas_fal", 1, "life_coplevel > 7", "с Lieutenant I", "false" }, //100000
			
			{ "arifle_AK12_F", 1, "life_coplevel > 10", "с Major", "false" }, // 110000
			{ "arifle_AK12U_F", 1, "life_coplevel > 10", "с Major", "false" }, //110000
			
			{ "arifle_SPAR_02_blk_F", 1, "life_coplevel > 11", "с Lt.Colonel", "false" }, //120000
			{ "arifle_mas_hk417c", 1, "life_coplevel > 11", "c Lt.Colonel", "false" }, //135000
			{ "arifle_CTARS_blk_F", 1, "life_coplevel > 11", "с Lt.Colonel", "false" }, //150000
			
			{ "LMG_mas_M249_F", 1, "life_coplevel in [17]", "с S.W.A.T.", "false" }, //180000
			{ "LMG_03_F", 1, "life_coplevel in [17]", "с S.W.A.T.", "false" }, //190000
			{ "LMG_MK200_F", 1, "life_coplevel in [17]", "с S.W.A.T.", "false" }, // 220000
			{ "launch_RPG7V", 1, "life_coplevel > 9", "с Captain", "false" } //250000		
		};
	};
	
	class gun {
		displayName = "Оружейная гражданских";
		conditions = "'gun' in life_licenses";
		conditionMessage = "Необходима лицензия на оружие";
		items[] = {
			{ "hgun_P07_khk_F", 1, "", "", "true" }, //15000
			{ "RH_tt33", 1, "", "", "true" }, //12000
			{ "RH_mak", 1, "", "", "true" }, //12000
			{ "RH_m1911a1", 1, "", "", "true" }, //12500
			{ "RH_vp70", 1, "", "", "true" }, //15000
			{ "RH_sw659", 1, "", "", "true" }, //16000
			{ "RH_m9", 1, "", "", "true" }, //17000
			{ "RH_p226", 1, "", "", "true" }, //17500	
			{ "RH_p226s", 1, "", "", "true" }, //17900
			{ "RH_g17", 1, "", "", "true" }, //20000
			{ "RH_fn57", 1, "", "", "true" }, //21000
			{ "RH_fn57_t", 1, "", "", "true" }, //21500
			{ "RH_fn57_g", 1, "", "", "true" }, //21500
			{ "RH_fnp45", 1, "(call life_donator) > 0", "c VIP ур. 1", "false" }, //20000
			{ "RH_fnp45t", 1, "(call life_donator) > 0", "c VIP ур. 1", "false" }, //20500
			{ "RH_docter", 1, "(call life_donator) > 0", "c VIP ур. 1", "false" }, //25000 ?!?!?!?
			{ "RH_g18", 1, "(call life_donator) > 0", "c VIP ур. 2", "false" }, //25000
			{ "RH_deagles", 1, "(call life_donator) > 0", "c VIP ур. 4", "false" }, //28000
			{ "RH_tec9", 1, "(call life_donator) > 0", "c VIP ур. 4", "false" }, //29000
			{ "RH_bull", 1, "(call life_donator) > 0", "c VIP ур. 4", "false" } //30000
		};
	};

	class med_basic {
		displayName = "Снаряжение EMS";
		conditions = "life_medDuty";
		conditionMessage = "Вы должны быть на службе";
		items[] = {
			{ "pmc_earpiece", 1, "", "", "true" },	
			{ "srl_TacticalBacon_100", 1, "", "", "true" },
			{ "srl_SmithsChips", 1, "", "", "true" },
			{ "srl_Steak", 1, "", "", "true" },
			{ "srl_BakedBeans_100", 1, "", "", "true" },
			{ "srl_Apple", 1, "", "", "true" },
			{ "srl_Peach", 1, "", "", "true" },
			{ "srl_Banana", 1, "", "", "true" },
			{ "srl_PineApple", 1, "", "", "true" },
			{ "srl_Coconut", 1, "", "", "true" },
			{ "srl_Spirit", 1, "", "", "true" },
			{ "srl_franta", 1, "", "", "true" },
			{ "Binocular", 2, "", "", "true" },
			{ "ItemGPS", 2, "", "", "true" },
			{ "tf_fadak", 2, "", "", "true" },
			{ "srl_Waterpure", 2, "", "", "true" },
			{ "srl_antibiotic", 2, "", "", "true" },
			{ "srl_ItemAdrenaline", 2, "", "", "true" },
			{ "srl_vitaminbottle", 2, "", "", "true" },
			{ "srl_bandage", 2, "", "", "true" },
			{ "srl_painkillers", 2, "", "", "true" },
			{ "srl_ItemMorphine", 2, "", "", "true" },
			{ "srl_ItemSurgeryKit", 2, "", "", "true" },
			{ "srl_Buffout", 2, "", "", "true" },
			{ "Medikit", 2, "", "", "true" },
			{ "srl_defibrillator", 2, "", "", "true" },
			{ "srl_ItemRepairKit", 2, "", "", "true" },
			{ "srl_bottleclean_100", 2, "", "", "true" },
			{ "srl_canteen_clean_3", 2, "", "", "true" },
			{ "srl_canopener", 2, "", "", "true" },
			{ "srl_matches", 2, "", "", "true" },
			{ "srl_Fuelcan", 2, "", "", "true" },
			{ "sunrise_Tool_Axe", 2, "", "", "true" },
			{ "sunrise_Tool_PickAxe", 2, "", "", "true" },
			{ "sunrise_Tool_Shovel", 2, "", "", "true" },
			{ "sunrise_Tool_Hoe", 2, "", "", "true" },
			{ "srl_metalDetector", 2, "", "", "true" },

			{ "srl_SeatBelt", 1, "", "", "true" },
			{ "srl_adacBox", 1, "life_mediclevel > 1", "с Доктора (ур.2)", "true" },
			{ "srl_adacNitro", 1, "life_mediclevel > 2", "со Специалиста (ур.3)", "true" },
			{ "srl_AntiTheft", 1, "life_mediclevel > 3", "с Мастера (ур.4)", "true" },
			//{ "srl_GPSTracker", 1, "life_mediclevel > 3", "с Мастера (ур.4)", "true" },
			{ "srl_AntiStole", 1, "life_mediclevel > 3", "с Мастера (ур.4)", "true" },
			{ "srl_ItemDetoxin", 1, "life_mediclevel > 3", "с Мастера (ур.4)", "true" },
			{ "srl_ItemRadX", 1, "life_mediclevel > 4", "с Эксперта (ур.5)", "true" }
		};
	};
	
	class univermag {
		displayName = "Универмаг";
		conditions = "";
		conditionMessage = "";
		items[] = {
			{ "ItemGPS", 1, "", "", "true" },
			{ "ItemMap", 1, "", "", "true" },
			{ "ItemCompass", 1, "", "", "true" },
			{ "Binocular", 1, "", "", "true" },
			{ "pmc_earpiece", 1, "", "", "true" },

			{ "srl_ItemRepairKit", 1, "", "", "true" },

			{ "tf_microdagr", 1, "", "", "true" },
			{ "tf_anprc154", 1, "", "", "true" },
			{ "tf_anprc148jem", 1, "", "", "true" },

			{ "srl_bottle_empty", 1, "", "", "true" },
			{ "srl_canteen_empty", 1, "", "", "true" },

			{ "srl_canopener", 1, "", "", "true" },
			{ "srl_knife", 1, "", "", "true" },
			{ "srl_matches", 1, "", "", "true" },

			{ "srl_Fuelcan_empty", 1, "", "", "true" },
			

			{ "sunrise_Tool_Axe", 1, "", "", "true" },
			{ "sunrise_Tool_PickAxe", 1, "", "", "true" },
			{ "sunrise_Tool_Shovel", 1, "", "", "true" },
			{ "sunrise_Tool_Hoe", 1, "", "", "true" },
			

			{ "srl_metalDetector", 1, "", "", "true" }
		};
	};

	class fastfood {
		displayName = "Еда и напитки";
		conditions = "";
		conditionMessage = "";
		items[] = {
			{ "srl_TacticalBacon_100", 1, "", "", "true" },
			{ "srl_SmithsChips", 1, "", "", "true" },
			{ "srl_Steak", 1, "", "", "true" },
			{ "srl_BakedBeans_100", 1, "", "", "true" },
			{ "srl_Apple", 1, "", "", "true" },
			{ "srl_Peach", 1, "", "", "true" },
			{ "srl_Banana", 1, "", "", "true" },
			{ "srl_PineApple", 1, "", "", "true" },
			{ "srl_Coconut", 1, "", "", "true" },
			{ "srl_Spirit", 1, "", "", "true" },
			{ "srl_franta", 1, "", "", "true" },
			{ "srl_redgull", 1, "", "", "true" }
		};
	};

	class shop24 {
		displayName = "Магазинчик на заправке";
		conditions = "";
		conditionMessage = "";
		items[] = {
			{ "tf_microdagr", 1, "", "", "true" },
			{ "tf_anprc154", 1, "", "", "true" },
			{ "tf_anprc148jem", 1, "", "", "true" },
			{ "srl_bottle_empty", 1, "", "", "true" },
			{ "srl_canteen_empty", 1, "", "", "true" },

			{ "sunrise_Tool_Axe", 1, "", "", "true" },
			{ "sunrise_Tool_PickAxe", 1, "", "", "true" },
			{ "sunrise_Tool_Shovel", 1, "", "", "true" },
			{ "sunrise_Tool_Hoe", 1, "", "", "true" },

			{ "srl_metalDetector", 1, "", "", "true" },

			{ "srl_ItemRepairKit", 1, "", "", "true" },
			{ "srl_bandage", 1, "", "", "true" },
			{ "srl_SmithsChips", 1, "", "", "true" },
			{ "srl_Spirit", 1, "", "", "true" },
			{ "srl_franta", 1, "", "", "true" },
			{ "srl_redgull", 1, "", "", "true" }
		};
	};

	class hideout_gun {
		displayName = "Магазин бандитов";
		conditions = "";
		conditionMessage = "";
		items[] = {
			{ "pmc_earpiece", 1, "", "", "true" },
			{ "srl_ducttape", 1, "", "", "true" },
			{ "srl_lockpick", 1, "", "", "true" },
			{ "srl_headBag", 1, "", "", "true" },
			{ "DDOPP_X26", 1, "", "", "true" },
			
			{ "hgun_P07_khk_F", 1, "", "", "true" }, //15000
			{ "RH_tt33", 1, "", "", "true" },
			{ "RH_mak", 1, "", "", "true" },
			{ "RH_m1911a1", 1, "", "", "true" },
			{ "RH_vz61", 1, "", "", "true" },
			{ "RH_muzi", 1, "", "", "true" },
						
			{ "arifle_SDAR_F", 1, "", "", "true" },
			{ "arifle_TRG20_F", 1, "", "", "true" },
			{ "arifle_TRG21_F", 1, "", "", "true" },
						
			{ "arifle_mas_aks74u", 1, "", "", "true" },
			
			{ "arifle_mas_m16a2", 1, "", "", "true" }
		};
	};
	class rebl_gun {
		displayName = "Магазин Опозиционера";
		conditions = "'rebl' in life_licenses";
		conditionMessage = "";
		items[] = {
			{ "pmc_earpiece", 1, "", "", "true" }, //35000
			{ "srl_ducttape", 1, "", "", "true" }, //3000
			{ "srl_lockpick", 1, "", "", "true" }, //3000
			{ "srl_headBag", 1, "", "", "true" }, //3000
			{ "DDOPP_X26", 1, "", "", "true" }, //15000
			
			{ "hgun_P07_khk_F", 1, "", "", "true" }, //15000
			{ "RH_tt33", 1, "", "", "true" }, //12000
			{ "RH_mak", 1, "", "", "true" },  //12000
			{ "RH_m1911a1", 1, "", "", "true" }, //12500
			{ "RH_vz61", 1, "", "", "true" }, //17000
			{ "RH_muzi", 1, "", "", "true" }, //31000
						
			{ "arifle_SDAR_F", 1, "", "", "true" }, //35000
			{ "arifle_TRG20_F", 1, "", "", "true" }, //45000
			{ "arifle_TRG21_F", 1, "", "", "true" }, //50000
			
			{ "arifle_mas_ak12sf_c", 1, "", "", "true" }, //87000
			{ "arifle_mas_ak74", 1, "", "", "true" }, //70000
			{ "arifle_mas_g36c", 1, "", "", "true" }, //51000
			{ "arifle_mas_g3", 1, "", "", "true" }, //120000
			{ "arifle_mas_m14", 1, "", "", "true" }, //110000
			{ "arifle_mas_m4vlt", 1, "", "", "true" }, //60000
			{ "arifle_mas_mp40", 1, "", "", "true" }, //40000
			{ "arifle_mas_mp5_d", 1, "", "", "true" }, //35000
			{ "arifle_mas_sten", 1, "", "", "true" }, //25000
						
			{ "arifle_mas_aks74u", 1, "", "", "true" }, //55000
			
			{ "arifle_mas_m16a2", 1, "", "", "true" } //60000
	
		};
	};
	/// GANGS
	// Psycho
	class psycho_weap {
		displayName = "Оружейная Psychokids";
		conditions = "'psycho' in life_licenses";
		conditionMessage = "Вы не состоите в Psychokids";
		items[] = {			
			{ "srl_Buffout", 1, "", "", "true" }, 
			{ "srl_ducttape", 1, "", "", "true" },
			{ "srl_lockpick", 1, "", "", "true" },
			{ "srl_headBag", 1, "", "", "true" },
			
			{ "DDOPP_X26_b", 1, "(call life_donator) > 0", "", "true" },
			
			{ "arifle_mas_ak_74m_sf_c", 1, "", "", "true" },
			{ "arifle_MX_SW_F", 1, "(getPlayerUID player in ['76561199094441641'])", "", "false" }
		};
	};
	
	//vip
	class vip_weap {
		displayName = "Оружие Джентльмена";
		conditions = "";
		conditionMessage = "У вас нет доступа!";
		items[] = {
			{ "srl_Buffout", 1, "(call life_donator) > 3", "", "true" }, //бАФАУТ
			{ "srl_ducttape", 1, "(call life_donator) > 0", "", "true" }, //лента
			{ "srl_lockpick", 1, "(call life_donator) > 0", "", "true" }, //отмычки
			{ "srl_headBag", 1, "(call life_donator) > 0", "", "true" },  //мешок на голову
			
			{ "DDOPP_X26_b", 1, "(call life_donator) > 0", "", "true" },
			
			{ "SMG_05_F", 1, "", "", "true" }, //vip2
			
			{ "arifle_mas_g36c", 1, "", "", "true" }, //vip4
			{ "30Rnd_mas_556x45_Stanag", 1, "(call life_donator) > 3", "", "true" },
			
			{ "arifle_mas_mp5sd", 1, "", "", "true" } //vip4

		};
	};
	//end vep//
};