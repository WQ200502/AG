class CarShops {
    class civ_car {
        conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
        vehicles[] = {
            { "Acj_HarleyDavidson_Sholvehead", "group player getVariable ['gang_id',-1] isEqualTo 2000" }, //Dont touch Black Piston Gang Vehicle
            { "d3s_xesv_17_shadow", "group player getVariable ['gang_id',-1] isEqualTo 1002" },
            { "d3s_challenger_15_playboy", "group player getVariable ['gang_id',-1] isEqualTo 2011" },
            { "d3s_continentalHughIsBeta", "group player getVariable ['gang_id',-1] isEqualTo 2011" },
            { "HenchmenCar", "group player getVariable ['gang_id',-1] isEqualTo 3002" },
            { "d3s_xesv_17_capone", "group player getVariable ['containers_pid',-1] isEqualTo 2153" },
            { "d3s_oka", "" },
            { "d3s_zaz968m", "" },
            { "d3s_3159", "" },
            { "d3s_3159_9may", "" },
            { "d3s_3159_AMG", "" },
            { "d3s_uaz_3162", "" },
            { "d3s_savana_05", "" },
            { "d3s_savana_05_EX", "" },
            { "d3s_beetle_04", "" },
            { "d3s_clubman_11", "" },
            { "d3s_clubman_11_50", "" },
            { "d3s_clubman_11_W", "" },
            { "d3s_vesta_15", "" },
            { "d3s_vesta_15_turbo", "" },
            { "d3s_vesta_15_EX", "" },
            { "d3s_kodiaq_act_17", "" },
            { "d3s_kodiaq_17", "" },
            { "d3s_kodiaq_amb_17", "" },
            { "d3s_giulietta_16", "" },
            { "d3s_giulietta_16_SE", "" },
            { "d3s_giulietta_quad_16", "" },
            { "d3s_wrx_17", "" },
            { "d3s_wrx_17", "" },
            { "d3s_wrx_s4_17", "" } //Remember the last car has no comma
         };
     };

 class civ_haohua {
        conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
        vehicles[] = {
            { "Acj_HarleyDavidson_Sholvehead", "group player getVariable ['gang_id',-1] isEqualTo 2000" }, //Dont touch Black Piston Gang Vehicle
            { "d3s_roosevelt_gtaV_2", "call life_donorlevel > 3" },
			{ "d3s_javelin_72_Talib", "call life_donorlevel > 3" },
			{ "d3s_suprarz_98", "call life_donorlevel > 3" },
			{ "d3s_F40_87_V", "call life_donorlevel > 3" },
			{ "d3s_GTC4Lusso_16", "call life_donorlevel > 3" },
			{ "d3s_dawn_16_III", "call life_donorlevel > 3" },
			{ "d3s_veneno_13", "call life_donorlevel > 3" },
			{ "d3s_mclaren_18", "call life_donorlevel > 3" },
			{ "d3s_LB650S_15_R", "call life_donorlevel > 3" },
			{ "d3s_gemera_21", "getPlayerUID player in ['76561198890553411']" },
			{ "d3s_cullinan_19_BB", "getPlayerUID player in ['76561198890553411']" },
			{ "d3s_terzo_18", "getPlayerUID player in ['76561198890553411']" },
			{ "d3s_P1GTR_15_M", "getPlayerUID player in ['76561198890553411']" },
			{ "d3s_sian_20_P", "getPlayerUID player in ['76561198890553411']" },
			{ "d3s_911gt3rs_18_W", "getPlayerUID player in ['76561199014404395']" },
			{ "d3s_donkervoort_17", "getPlayerUID player in ['76561198978158050']" },
			{ "d3s_PEE_P50_62_2", "getPlayerUID player in ['76561198978158050']" },
			{ "d3s_918spyder_15_W", "getPlayerUID player in ['76561198978158050']" },
			{ "d3s_300SL_55_L", "getPlayerUID player in ['76561198978158050']" },
			{ "d3s_bacalar_21_B", "getPlayerUID player in ['76561198978158050']" },//Remember the last car has no comma
         };
     };
      class civ_exotic {
           conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
           vehicles[] = {
            { "d3s_pajero_07_38", "" },
            { "d3s_pajero_07_PE", "" },
            { "d3s_200_16", "" },
            { "d3s_200_VX_16", "" },
            { "d3s_200_16_EX", "" },
            { "d3s_escalade_16", "" },
            { "d3s_kodiaq_sl_17", "" },
            { "d3s_kodiaq_sport_17", "" },
            { "d3s_kodiaq_se_17", "" },
            { "d3s_wrx_sti_17", "" },
            { "d3s_wrx_sti_17", "" },
            { "d3s_wrx_17_FnF8", "" },
            { "d3s_wrx_17_FnF8", "" },
            { "d3s_silvia_s15_02", "" },
            { "d3s_civic_17", "" },
            { "d3s_civic_17_S", "" },
            { "d3s_santafe_19", "" },
            { "d3s_santafe_19_High", "" },
            { "d3s_cherokee_18", "" },
            { "d3s_cherokee_18_LTD", "" },
            { "d3s_cherokee_18_SRT", "" },
            { "d3s_cherokee_18_TRCK", "" },
            { "d3s_qx56_13", "" },
            { "d3s_qx56_ht_13", "" },
            { "d3s_qx56_13_02", "" },
            { "d3s_qx56_13_EX", "" },
            { "d3s_qx56_13_EX2", "" },
            { "d3s_qx56_13_SE", "" },
            { "d3s_giulia_16", "" },
            { "d3s_giulia_ti_16", "" },
            { "d3s_giulia_q4_16", "" },
            { "d3s_giulia_quad_16", "" },
            { "d3s_giulia_16_SE", "" },
            { "d3s_QX60_16", "" },
            { "d3s_QX60_16_S", "" },
            { "d3s_QX60_16_SE", "" },
            { "d3s_q50_14", "" },
            { "d3s_q50_14_1", "" },
            { "d3s_q50_ER_14", "" },
            { "d3s_q50_14_SE", "" },
            { "d3s_is_16", "" },
            { "d3s_is_f_16", "" },
            { "d3s_is_16_1", "" },
            { "d3s_is_16_SE", "" },
            { "d3s_q50_14_EX", "" },
            { "d3s_evoque_16", "" },
            { "d3s_evoque_td4_16", "" },
            { "d3s_evoque_sd4_16", "" },
            { "d3s_evoque_si4_16", "" },
            { "d3s_evoque_16_se", "" },
            { "d3s_svr_17_SD4", "" },
            { "d3s_svr_17_SDV8", "" },
            { "d3s_svr_17_SI4", "" },
            { "d3s_svr_17_e", "" },
            { "d3s_svr_17_HSE", "" },
            { "d3s_svr_17_V8", "" },
            { "d3s_svr_17_SVR", "" },
            { "d3s_svr_17_TDV", "" },
            { "d3s_svr_17_CHARGED", "" },
            { "d3s_svr_17_007", "" },
            { "d3s_macan_s_16", "" },
            { "d3s_macan_turbo_16", "" },
            { "d3s_ctsv_16", "" },
            { "d3s_ctsv_16_2", "" },
            { "d3s_ctsv_16_SCK", "" },
            { "d3s_ctsv_16_1", "" },
            { "d3s_levante_17", "" },
            { "d3s_levante_s_17", "" },
            { "d3s_levante_Esteso_17", "" },
            { "d3s_levante_s_17_mat", "" },
            { "d3s_rapide_10", "" },
            { "d3s_rapide_10_S", "" },
            { "d3s_rapide_10_AMR", "" },
            { "d3s_ghibli_14_30", "" },
            { "d3s_ghibli_14_d", "" },
            { "d3s_ghibli_14_q4", "" },
            { "d3s_ghibli_14_sq4", "" },
            { "d3s_ghibli_14", "" },
            { "d3s_ghibli_14", "" },
            { "d3s_ghibli_esteso_14", "" },
            { "d3s_ghibli_14_nerissimo", "" },
            { "d3s_ghibli_14_EX", "" },
            { "d3s_hornet_52", "" },
            { "d3s_hornet_53", "" },
            { "d3s_hornet_54", "" },
            { "d3s_model_a", "" },
            { "d3s_continentalGT_18", "" },
            { "d3s_continentalGT_18_FE", "" },
            { "d3s_continentalGT_18_Black", "" },
            { "d3s_alfieri_14", "" },
            { "d3s_lm002_90", "" },
            { "d3s_urus_12", "" },
            { "d3s_urus_sv_12", "" },
            { "d3s_urus_18", "" },
            { "d3s_teslaS_16_90", "" },
            { "d3s_teslaS_16_100", "" },
            { "d3s_ghost_18_EWB", "" },
            { "d3s_ghost_18_EWB_II", "" },
            { "d3s_asterion_15_DMC", "" },
            { "d3s_asterion_15_SE", "" },
            { "d3s_LaFerrari_14", "" }
               // { "d3s_survolt_10", "" }
           };
       };

       class civ_motorbike {
           conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
           vehicles[] = {
            { "d3s_Kawasaki_Z800", "" },
            { "d3s_KTM_1290_Super_Duke", "" },
            { "d3s_Ducati_Monster_1200_S", "" },
            { "d3s_Ducati_XDiavel_S", "" },
            { "d3s_Suzuki_Hayabusa", "" },
            { "d3s_Kawasaki_ZX7RR", "" },
            { "d3s_Suzuki_GSX_R_1000", "" },
            { "d3s_Aprilia_Tuono_V4_1100_RR", "" },
            { "d3s_BMW_S_1000_RR", "" },
            { "d3s_Kawasaki_Ninja_H2R", "" }
           };
       };

       class civ_donator {
           conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
           vehicles[] = {
            { "Cardinal_Grinder", "" },
            { "Chevrolet_Advance_1953", "" },
            { "Ford_Mainline_1954", "" },
            { "Ford_Model_B_1932", "" },
            { "Holden_Coupe_Utility_1951", "" },
            { "Righteous_Spike", "" }
           };
       };

       class rebel_car {
           conditions = "(missionNamespace getVariable ['mav_ttm_var_vehrebel',0]) isEqualTo 1";
           vehicles[] = {
            { "d3s_willys", "" },
			{ "d3s_svr_17_Minions", "" },
			{ "d3s_camry_18_Sch", "" },
			{ "DINGASSMALLCOCK", "" },
			{ "Cardinal_Grinder", "" },
			{ "d3s_roadrunner_71_GTX", "" },
            { "d3s_uaz_469P", "" },
            { "d3s_patriot", "" },
            { "d3s_uaz_3162_CAM", "" },
            { "d3s_uaz_3162_ULT", "" },
            { "d3s_uaz_3162_MAW", "" },
            { "d3s_uaz_3162_SP", "" },
            { "d3s_explorer_sport_13_BSC", "" },
			{ "d3s_svr_17_Shadow", "" },
            { "d3s_cherokee_18_STELS", "" },
            { "d3s_tahoe_LMS", "" },
            { "d3s_vklasse_ULT", "" },
            { "d3s_wrx_sti_17_mar", "" },
            { "d3s_wrx_sti_17_maw_2", "" },
            { "d3s_wrx_sti_17_maw", "" },
            { "d3s_wrx_sti_17_BSC", "" },
            { "d3s_raptor_RSF_17", "" },
            { "d3s_raptor_17_RMC", "" },
            { "d3s_gls63amg_17_SYND", "" },
            { "d3s_gl63amg_AlmaZ", "" },
            { "d3s_gl63amg_Lcn", "" },
            { "d3s_gl63amg_Aryans", "" },
            { "d3s_ctsv_16_LCN", "" },
            { "d3s_ctsv_16_Aryans", "" },
            { "d3s_lm002_MAW", "" },
            { "d3s_lm002_MAW_2", "" },
            { "d3s_kamaz_4911", "" },
            { "d3s_kamaz_49255", "" }
           };
       };

       class civ_chev {
           conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
           vehicles[] = {
            { "d3s_tahoe_vortec_08", "" },
            { "d3s_tahoe_08", "" },
            { "d3s_malibu_18", "" },
            { "d3s_malibu_18_LT", "" },
            { "d3s_malibu_18_EX", "" },
            { "d3s_camaro_ss_16", "" },
            { "d3s_camaro_zl1_17", "" },
            { "d3s_camaro_zl1_1le_18", "" },
            { "the_camaro_tuning_AP", "" }
           };
       };

       class civ_jag {
           conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
           vehicles[] = {
            { "CLASSNAME", "" },
            { "d3s_fpace_17_r", "" },
            { "d3s_fpace_17_s", "" },
            { "d3s_fpace_17_fe", "" },
            { "d3s_xe_15", "" },
            { "d3s_xer_15", "" },
            { "d3s_xes_15", "" },
            { "d3s_xes_15_SE", "" },
            { "d3s_xesv_17", "" },
            { "d3s_xesv_17_8", "" }
           };
       };

       class civ_dodge {
           conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
           vehicles[] = {
            { "CLASSNAME", "" },
            { "d3s_durango_18", "" },
            { "d3s_durango_18_SRT", "" },
            { "d3s_durango_18_se", "" },
            { "d3s_charger_15", "" },
            { "d3s_charger_15_SXT", "" },
            { "d3s_charger_15_RT", "" },
            { "d3s_charger_15_FnF7", "" },
            { "d3s_srthellcat_15", "" },
            { "d3s_srthellcat_15_392", "" },
            { "d3s_srthellcat_15_HELL", "" }
           };
       };

       class civ_ford {
           conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
           vehicles[] = {
            { "d3s_taurus_dur_10", "" },
            { "d3s_taurus_10_ex", "" },
            { "d3s_fiesta_16_230", "" },
            { "d3s_fiesta_16_H", "" },
            { "d3s_focus_14", "" },
            { "d3s_focus_14_ST", "" },
            { "d3s_focus_14_H", "" },
            { "d3s_explorer_13", "" },
            { "d3s_explorer_LT_13", "" },
            { "d3s_explorer_sport_13", "" },
            { "d3s_explorer_13_EX", "" },
            { "d3s_focus_17_RS", "" },
            { "d3s_focus_17_PP", "" },
            { "d3s_raptor_17", "" },
            { "d3s_raptor_SCR_17", "" },
            { "d3s_fseries_17", "" },
            { "d3s_fseries_LTD_17", "" },
            { "d3s_fseries_PLT_17", "" },
            { "d3s_focus_17_LB", "" },
            { "d3s_boss_15", "" },
            { "d3s_boss_15_payback", "" }
           };
       };

       class civ_merc {
           conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
           vehicles[] = {
            { "CLASSNAME", "" },
            { "d3s_vklasse_220_17", "" },
            { "d3s_vklasse_250_17", "" },
            { "d3s_vklasse_250amg_17", "" },
            { "d3s_vklasse_17", "" },
            { "d3s_vklasse_17_SE", "" },
            { "d3s_amazing_a45_16", "" },
            { "d3s_amazing_a45_16_AMG", "" },
            { "d3s_amazing_a45_16_EX", "" },
            { "d3s_cla_15", "" },
            { "d3s_cla_14", "" },
            { "d3s_cla_15", "" },
            { "d3s_cla_220_15", "" },
            { "d3s_cla_250_15", "" },
            { "d3s_cla_45amg_14", "" },
            { "d3s_cla_2years_14", "" },
            { "d3s_gl63amg_Bikers", "" },
            { "d3s_gls63amg_17", "" },
            { "d3s_gls63amg_17", "" },
            { "d3s_gls63amg_17_LT", "" },
            { "d3s_gls63amg_17_EX", "" },
            { "d3s_gls63amg_17_SE", "" },
            { "d3s_gl63amg_12", "" },
            { "d3s_gle43amg_15", "" },
            { "d3s_gle63amg_15", "" },
            { "d3s_gle63amgS_15", "" },
            { "d3s_cla_45amg_15", "" },
            { "d3s_cla_15_SE", "" },
            { "d3s_cla_14_SE", "" },
            { "d3s_e220_16", "" },
            { "d3s_e350_16", "" },
            { "d3s_e400_16", "" },
            { "d3s_s350_17", "" },
            { "d3s_s560_18", "" },
            { "d3s_s600guard_14", "" },
            { "d3s_s650_18", "" },
            { "d3s_C63S_14", "" },
            { "d3s_C180_14", "" },
            { "d3s_C220_14", "" },
            { "d3s_C250_14", "" },
            { "d3s_C300_14", "" },
            { "d3s_C350_14", "" },
            { "d3s_C450_15", "" },
            { "d3s_w212s_13", "" },
            { "d3s_w212_13", "" },
            { "d3s_w212s_13_SCK", "" },
            { "d3s_C43_16", "" },
            { "d3s_C63_14", "" },
            { "d3s_C63S_14_SE_AP", "" },
            { "d3s_g65amg_Mansory", "" },
            { "d3s_g65amg_Mansory_2", "" },
            { "d3s_vv222_18", "" },
            { "d3s_vv222_18_2", "" },
            { "d3s_amgGT_15", "" },
            { "d3s_amgGTS_15", "" }
           };
       };

       class civ_bmw {
           conditions = "playerside isEqualTo civilian || call(life_copdept) in [3,5,7]";
           vehicles[] = {
            { "d3s_e38_98", "" },
            { "d3s_e38_98_ex", "" },
            { "d3s_e60_09_ACS5", "" },
            { "d3s_f87_17", "" },
            { "d3s_f87_17_sport", "" },
            { "d3s_f87_17_m", "" },
            { "d3s_f87_18_m", "" },
            { "d3s_f87_17_ACH", "" },
            { "d3s_f87_17_EX", "" },
            { "d3s_f87_18_EX", "" },
            { "d3s_f80_14", "" },
            { "d3s_f80_14_cs", "" },
            { "d3s_f80_14_GTS", "" },
            { "d3s_f80_14_EX2", "" },
            { "d3s_f80_14_SE", "" },
            { "d3s_f80_14_EX", "" },
            { "d3s_f82_14_EX", "" },
            { "d3s_f82_14_CE", "" },
            { "d3s_f82_14", "" },
            { "d3s_f82_14", "" },
            { "d3s_f82_14_gts", "" },
            { "d3s_amazing_f82_16", "" },
            { "d3s_amazing_f82_16_IND", "" },
            { "d3s_amazing_f82_16_EX", "" },
            { "d3s_f85_15", "" },
            { "d3s_f85_15_m", "" },
            { "d3s_f85_15_EX", "" },
            { "d3s_f86_15", "" },
            { "d3s_f86_15_m", "" },
            { "d3s_f86_SCK", "" },
            { "d3s_f86_15_OFF", "" },
            { "d3s_e60_09_EX", "" },
            { "m5_SCK", "" },
            { "d3s_e60_09", "" },
            { "d3s_e60_09_m", "" },
            { "d3s_amazing_f10_12", "" },
            { "d3s_f90_18", "" },
            { "d3s_f90_18_FE", "" },
            { "d3s_f90_18_FE", "" },
            { "d3s_f90_18_M", "" },
            { "d3s_f90_18_EX", "" },
            { "d3s_f90_18_sport", "" },
            { "d3s_amazing_f10_12_FEMID", "" },
            { "d3s_amazing_f10_12_IND", "" },
            { "d3s_amazing_f10_12_EX", "" },
            { "d3s_f13_13", "" },
            { "d3s_f13_13_Comp", "" },
            { "d3s_f13_13_CE", "" },
            { "d3s_f13_13_EX", "" },
            { "d3s_e89_12", "" },
            { "d3s_e89_12_M", "" },
            { "d3s_f82_14_LB", "" },
            { "d3s_f82_14_LB", "" },
            { "d3s_f82_14_LCN", "" },
            { "d3s_f90_18_ULT", "" },
            { "d3s_i8_17", "" },
            { "d3s_amazing_ACS8_17_IND", "" },
            { "d3s_amazing_ACS8_17_IND", "" },
            { "d3s_amazing_ACS8_17_SHELL", "" }
           };
       };

       class civ_truck {
           conditions = "playerside isEqualTo civilian";
           vehicles[] = {
            { "d3s_actros_14", "" },
            { "d3s_actros_14_big", "" },
            { "d3s_actros_14_giga", "" },
            { "d3s_zil_130_05", "" },
            { "d3s_zil_130_02", "" },
            { "d3s_3303", "" },
            { "d3s_452", "" },
            { "d3s_zil_130", "" },
            { "d3s_zil_130_03", "" },
            { "d3s_zil_130_01", "" },
            { "d3s_zil_130_04", "" },
            { "d3s_zil_130_06", "" },
            { "d3s_zil_130_07", "" },
            { "d3s_zil_131", "" },
            { "d3s_zil_131_4", "" },
            { "d3s_zil_131_3", "" },
            { "d3s_zil_131_5", "" },
            { "d3s_zil_131_2", "" },
            { "d3s_kamaz_2", "" },
            { "d3s_kamaz_MAW_1", "" },
            { "d3s_kamaz_bocha", "" },
            { "d3s_kamaz_bocha_MAW_1", "" },
            { "d3s_kamaz_tent_2", "" },
            { "d3s_kamaz_4310_med", "" },
            { "d3s_kamaz", "" },
            { "d3s_kamaz_kung", "" },
            { "d3s_kamaz_tent", "" },
            { "d3s_kamaz_tent2", "" },
            { "d3s_kamaz_4350", "" },
            { "d3s_kamaz_4350_kung", "" },
            { "d3s_kamaz_4350_tent", "" },
            { "d3s_kamaz_4350_tent2", "" },
            { "d3s_kamaz_5350", "" },
            { "d3s_kamaz_5350_bocha", "" },
            { "d3s_kamaz_5350_tent", "" },
            { "d3s_kamaz_6350", "" },
            { "d3s_kraz_6315", "" },
            { "d3s_kraz_6316", "" },
            { "d3s_ural", "" },
            { "d3s_ural_tent", "" },
            { "d3s_next", "" },
            { "d3s_next_kung", "" },
            { "d3s_next_tent", "" }
           };
       };
//DONT TOUCH
       class civ_air {
           conditions = "playerside isEqualTo civilian && (missionNamespace getVariable ['mav_ttm_var_air',0]) isEqualTo 1";
           vehicles[] = {
            { "B_Heli_Light_01_F", "" },
            { "O_Heli_Light_02_unarmed_F", "" },
            { "M_AS350_CIV", "" },
            { "d3s_AS_365", "" },
            { "C_Plane_Civil_01_F", "" },
            { "I_C_Plane_Civil_01_F", "" },
            { "C_Plane_Civil_01_racing_F", "" }
           };
       };

        class civ_ship {
           conditions = "playerside isEqualTo civilian";
           vehicles[] = {
            { "C_Scooter_Transport_01_F", "" },
            { "C_Rubberboat", "" },
            { "C_Boat_Transport_01_F", "" },
            { "C_Boat_Civil_01_F", "" },
            { "Boat_OSK_land_yachthouse_01", "" }
           };
       };

       class med_shop {
           conditions = "playerside isEqualTo independent";
           vehicles[] = {
            { "d3s_fseries_17_EMS", ""},
            { "anzus_rescuetruck", ""},
			{ "d3s_ems_car", ""},
			{ "AG_EMS_Challenger", ""},
			{ "AG_EMS_CTSV", ""},
            { "d3s_explorer_EMS_13", "call life_medicLevel >= 2"},
			{ "AG_EMS_TAURUS", "call life_medicLevel >= 2"},
            { "vvv_fire_truck_ausmd", "call life_medicLevel >= 4 || ((call life_MedicDept) isEqualTo 2)"},
            { "d3s_raptor_EMS_17", "call life_medicLevel >= 2"},
            { "d3s_tahoe_EMS", "call life_medicLevel >= 2"},
            { "d3s_savana_EMS", "call life_medicLevel >= 2"},
            { "d3s_charger_15_EMS", "call life_medicLevel >= 4"},
            { "d3s_teslaS_ems", "call life_medicLevel >= 4"},
            { "d3s_fpace_17_EMS", "call life_medicLevel >= 3"},
            { "d3s_challenger_15_EMS", "call life_medicLevel >= 7"},
			{ "d3s_tiger_2975_EMS", "call life_medicLevel >= 7"},
            { "VPC_gn", "call life_medicLevel >= 4"}
           };
       };

       class med_ship {
          conditions = "playerside isEqualTo independent";
          vehicles[] = {
            { "B_Lifeboat", "" },
            { "C_Scooter_Transport_01_F", "" }
          };
        };

       class med_air_hs {
           conditions = "playerside isEqualTo independent";
           vehicles[] = {
            { "AG_EMS_Bird", "" },
            { "C_hh60j_unarmed_F", "" },
            { "d3s_HH_65", "" }
           };
       };

        class cop_car {
           conditions = "playerside isEqualTo west && call life_coplevel > 0 && call(life_copdept) in [0,1,2,4,5,6,7]";
           vehicles[] = {
               //Patrol
            { "F1_KSP_CV", "call life_coplevel >= 1" },
			{ "d3s_srthellcat_15_Sheriff", "call life_coplevel >= 1" },
			{ "HWP_Holden_blue", "call life_coplevel >= 1" },
			{ "DOUG_SWAT_CHARGER", "call life_coplevel >= 1" },
			{ "d3s_malibu_18_COP", "call life_coplevel >= 1" },
			{ "d3s_ctsv_16_police", "call life_coplevel >= 1" },
            { "d3s_charger_15_CPP", "call life_coplevel >= 2" },
			{ "GM_ANZUS_SRTCHARGER", "call life_coplevel >= 2" },
			{ "d3s_srthellcat_15_SWAT", "call life_coplevel >= 2" },
            { "d3s_nemises_taurus_FPI_10", "call life_coplevel >= 2" },
			{ "d3s_srthellcat_15_SWAT", "call life_coplevel >= 2" },
			{ "d3s_srthellcat_15_CPP", "call life_coplevel >= 2" },
			{ "d3s_fseries_17_COP", "call life_coplevel >= 2" },
			{ "d3s_g63amg_16_Police", "call life_coplevel >= 2" },
			{ "d3s_g500_18_FSB", "call life_coplevel >= 2" },
			{ "GM_AFP_C300", "call life_coplevel >= 2" },
            { "M_Charger12", "call life_coplevel >= 3" },
            { "M_Charger12_Slick", "call life_coplevel >= 3" },
            { "M_Silverado_cab", "call life_coplevel >= 4" },
            { "d3s_titan_17_PPV", "call life_coplevel >= 5" },
            { "d3s_f90_18_PD", "call life_coplevel >= 5" },
            { "PAUL_FAST_MAN", "call life_coplevel >= 6" },
            { "d3s_focus_17_COP", "call life_coplevel >= 6" },
			{ "d3s_svr_17_cop", "call life_coplevel >= 6" },
            { "VPC", "call life_coplevel >= 6" },
            { "d3s_durango_18_DDPI", "call life_coplevel >= 6" },
            { "d3s_svr_17_COP", "call life_coplevel >= 7" },
			{ "d3s_tiger_2975_COP", "call life_coplevel >= 5" },
            { "d3s_challenger_15_CPST", "call life_coplevel >= 8" },
			{ "d3s_tiger_2975_COP", "call life_coplevel >= 8" },
            { "d3s_srthellcat_15_CPST", "call life_coplevel >= 6" },
            { "d3s_teslaS_16_Mark_42", "call life_coplevel >= 8" },
            { "d3s_challenger_15_CPE", "call life_coplevel >= 8" },
            //DOC
			
            { "DOC_Savana_05", "call life_copLevel >= 1 || ((call life_copdept) isEqualTo 1)" },
            { "DOC_Charger_18", "call life_copLevel >= 6 || ((call life_copdept) isEqualTo 1)" },
            // SWAT VEHICLES (ALL BLACK)
            { "d3s_srthellcat_15_CPST", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
			{ "d3s_tiger_2975_COP", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
			{ "KSK_Strider_Desert", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_fseries_17_P3E", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_durango_18_UNM", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_camry_18_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_challenger_15_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_ctsv_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_e400_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_escalade_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_fseries_17_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_200_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_lx570_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_raptor_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "AG_Swat_Heli", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "AG_Swat_Orca", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "ASN_Lenco_Bearcat", "call(life_copdept) in [6,7]" }
           };
       };

        class swat_car {
           conditions = "playerside isEqualTo west && call life_coplevel > 0 && call(life_copdept) in [6,7,8]";
           vehicles[] = {
               //Patrol
            { "d3s_srthellcat_15_CPST", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
			{ "d3s_tiger_2975_COP", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_fseries_17_P3E", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_durango_18_UNM", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_camry_18_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_challenger_15_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_srthellcat_15_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_ctsv_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_e400_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_escalade_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_fseries_17_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_200_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_lx570_16_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "d3s_raptor_SWAT", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "AG_Swat_Heli", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "AG_Swat_Orca", "call life_copLevel >= 3 && ((call life_copdept) isEqualTo 6)" },
            { "ASN_Lenco_Bearcat", "call(life_copdept) in [6,7]" }
           };
       };

       class uc_car {
           conditions = "playerside isEqualTo west && call (life_coplevel) > 0 && call(life_copdept) in [3,4,5,7]";
           vehicles[] = {
            // UNMARKED STUFF
            { "d3s_explorer_UNM_13", "call life_coplevel >= 3" },
            { "d3s_camry_18_UNM", "call life_coplevel >= 3" },
            { "d3s_malibu_18_UNM", "call life_coplevel >= 3" },
            { "d3s_srthellcat_15_UNM", "call life_coplevel >= 3" },
            { "d3s_raptor_UNM_17", "call life_coplevel >= 3" },
            { "d3s_f10_12_UNM", "call life_coplevel >= 3" },
            { "d3s_ctsv_16_unm", "call life_coplevel >= 3" },
            { "d3s_escalade_16_unm", "call life_coplevel >= 3" },
            { "d3s_tahoe_UNM", "call life_coplevel >= 3" },
            { "d3s_taurus_UNM_10", "call life_coplevel >= 3" },
            { "d3s_f86_15_UNM", "call life_coplevel >= 3" },
            { "d3s_cherokee_18_UNM", "call life_coplevel >= 3" },
			{ "d3s_agera_11_COP", "call life_coplevel >= 3" }
           };
       };


      class sheriff_car {
           conditions = "playerside isEqualTo west && call (life_coplevel) > 0 && call(life_copdept) in [3]";
           vehicles[] = {
            //sheriff
            { "d3s_crown_98_Sheriff", "call life_coplevel >= 3" },
            { "d3s_taurus_sheriff_10", "call life_coplevel >= 3" },
            { "d3s_srthellcat_15_Sheriff", "call life_coplevel >= 3" },
            { "d3s_challenger_15_CPST", "call life_coplevel >= 8" },
            { "d3s_raptor_Sheriff_17", "call life_coplevel >= 5" },
            { "d3s_challenger_15_Sheriff", "call life_coplevel >= 8" },
            { "d3s_challenger_15_Sheriff_ST", "call life_coplevel >= 8" },
            { "d3s_srthellcat_15_Sheriff_ST", "call life_coplevel >= 8" },
            { "d3s_macan_16_Sheriff", "call life_coplevel >= 8" },
            { "d3s_svr_17_Sheriff", "call life_coplevel >= 8" },
            // UNMARKED STUFF
            { "d3s_explorer_UNM_13", "call life_coplevel >= 8" },
            { "d3s_taurus_UNM_10", "call life_coplevel >= 8" },
            { "d3s_malibu_18_UNM", "call life_coplevel >= 8" },
            { "d3s_ctsv_16_unm", "call life_coplevel >= 8" },
            { "d3s_srthellcat_15_UNM", "call life_coplevel >= 8" },
            { "d3s_cherokee_18_UNM", "call life_coplevel >= 8" },
            { "d3s_raptor_UNM_17", "call life_coplevel >= 8" },
            { "d3s_explorer_UNM_13", "call life_coplevel >= 8" },
            { "d3s_tahoe_UNM", "call life_coplevel >= 8" },
            { "d3s_escalade_16_unm", "call life_coplevel >= 8" },
            { "d3s_f86_15_UNM", "call life_coplevel >= 8" },
            { "d3s_camry_18_UNM", "call life_coplevel >= 8" },
            { "d3s_teslaS_16_Mark_42", "call life_coplevel >= 8" }
           };
       };

       class cop_boat {
        conditions = "playerside isEqualTo west && call life_coplevel > 0";
        vehicles[] = {
            { "C_Scooter_Transport_01_F", "call life_coplevel >= 3" },
            { "B_Boat_Transport_01_F", "call life_coplevel >= 3" },
            { "C_Boat_Civil_01_police_F", "call life_coplevel >= 3" },
            { "B_SDV_01_F", "call life_coplevel >= 3" }
        };
    };

       class cop_air {
           conditions = "playerside isEqualTo west && call life_coplevel > 0";
           vehicles[] = {
            { "AG_Cop_Bird", "call life_coplevel >= 1" },
            { "GM_ANZUS_HELICOPTER", "call life_coplevel >= 1" },
            { "EC635_Unarmed", "call life_coplevel >= 3" },
            { "O_Heli_Light_02_unarmed_F", "call(life_copdept) in [6,7]" },
            { "AG_Swat_Orca", "call(life_copdept) in [6,7]" },
            { "AG_Swat_Heli", "call(life_copdept) in [6,7]" }
           };
       };
    };

   class LifeCfgVehicles {

       class Default {
           vItemSpace = -1;
           conditions = "";
           price = -1;
           textures[] = {};
       };

      class Land_UWreck_MV22_F { vItemSpace = 500000; conditions = ""; price = -1; textures[] = {}; };
      class Land_Wreck_Traw_F { vItemSpace = 500000; conditions = ""; price = -1; textures[] = {}; };
      class Land_Wreck_Traw2_F { vItemSpace = 500000; conditions = ""; price = -1; textures[] = {}; };

      class B_supplyCrate_F { vItemSpace = 700; conditions = ""; price = -1; textures[] = {}; };
      class B_CargoNet_01_ammo_F { vItemSpace = 1000; conditions = ""; price = -1; textures[] = {}; };
      class Box_IND_Grenades_F { vItemSpace = 350; conditions = ""; price = -1; textures[] = {}; };
      class plp_ct_MilBoxBigBlack { vItemSpace = 50; conditions = ""; price = -1; textures[] = {}; };
      class Land_CargoBox_V1_F { vItemSpace = 100; conditions = ""; price = -1; textures[] = {}; };

      //AIR
      class C_Heli_Light_01_civil_F { vItemSpace = 0; conditions = ""; price = 80000; textures[] = {}; };
      class AG_Cop_Bird { vItemSpace = 0; conditions = ""; price = 6500; textures[] = {}; };
      class GM_ANZUS_HELICOPTER { vItemSpace = 0; conditions = ""; price = 6500; textures[] = {}; };
      class AG_Swat_Orca { vItemSpace = 0; conditions = ""; price = 50000; textures[] = {}; };
      class AG_EMS_Bird { vItemSpace = 0; conditions = ""; price = 6500; textures[] = {}; };
      class B_Heli_Light_01_F { vItemSpace = 0; conditions = ""; price = 100000; textures[] = {}; };
      class EC635_Unarmed { vItemSpace = 0; conditions = ""; price = 35000; textures[] = {}; };
      class M_AS350_CIV { vItemSpace = 0; conditions = ""; price = 125000; textures[] = {}; };
      class O_Heli_Light_02_unarmed_F { vItemSpace = 0; conditions = ""; price = 300000; textures[] = {}; };
      class d3s_AS_365 { vItemSpace = 0; conditions = ""; price = 125000; textures[] = {}; };
      class C_Plane_Civil_01_F { vItemSpace = 300; conditions = ""; price = 86000; textures[] = {}; };
      class I_C_Plane_Civil_01_F { vItemSpace = 300; conditions = ""; price = 86000; textures[] = {}; };
      class C_Plane_Civil_01_racing_F { vItemSpace = 300; conditions = ""; price = 94000; textures[] = {}; };

      class M_AS350_EMS { vItemSpace = 0; conditions = ""; price = 4000; textures[] = {}; };
      class C_hh60j_unarmed_F { vItemSpace = 0; conditions = ""; price = 6500; textures[] = {}; };
      class d3s_HH_65 { vItemSpace = 0; conditions = ""; price = 7600; textures[] = {}; };
      class al_ORCA_EMS { vItemSpace = 0; conditions = ""; price = 7600; textures[] = {}; };
      class EMS_helo { vItemSpace = 0; conditions = ""; price = 7600; textures[] = {}; };

      class M_AS350_SHERIFF { vItemSpace = 0; conditions = ""; price = 14000; textures[] = {}; };
      class d3s_AS_365_PD { vItemSpace = 0; conditions = ""; price = 17000; textures[] = {}; };
      //ENDAIR

      //boat
      class C_Scooter_Transport_01_F { vItemSpace = 60; conditions = ""; price = 5500; textures[] = {}; };
      class C_Rubberboat { vItemSpace = 150; conditions = ""; price = 12000; textures[] = {}; };
      class B_SDV_01_F { vItemSpace = 100; conditions = ""; price = 10000; textures[] = {}; };
      class C_Boat_Transport_01_F { vItemSpace = 220; conditions = ""; price = 20000; textures[] = {}; };
      class Lexx_Jetboat_H { vItemSpace = 280; conditions = ""; price = 25000; textures[] = {}; };
      class C_Boat_Civil_01_F { vItemSpace = 300; conditions = ""; price = 30000; textures[] = {}; };
      class mr_max_freighter { vItemSpace = 1000; conditions = ""; price = 80000; textures[] = {}; };
      class Boat_OSK_land_yachthouse_01 { vItemSpace = 100; conditions = ""; price = 2500000; textures[] = {}; };

      //pd
      class B_Boat_Transport_01_F { vItemSpace = 120; conditions = ""; price = 8000; textures[] = {}; };
      class C_Boat_Civil_01_police_F { vItemSpace = 150; conditions = ""; price = 11700; textures[] = {}; };

      //EMS
      class B_Lifeboat { vItemSpace = 100; conditions = ""; price = 3700; textures[] = {}; };
      class anzus_rescuetruck { vItemSpace = 100; conditions = ""; price = 6000; textures[] = { }; };
	  class d3s_ems_car { vItemSpace = 100; conditions = ""; price = 6000; textures[] = { }; };
	  class AG_EMS_CTSV { vItemSpace = 100; conditions = ""; price = 6100; textures[] = { }; };
	  class AG_EMS_Challenger { vItemSpace = 100; conditions = ""; price = 6200; textures[] = { }; };
      class d3s_fseries_17_EMS { vItemSpace = 100; conditions = ""; price = 6000; textures[] = { }; };
      class d3s_charger_15_EMS { vItemSpace = 75; conditions = ""; price = 8000; textures[] = { }; };
      class d3s_tahoe_EMS { vItemSpace = 80; conditions = ""; price = 7500; textures[] = { }; };
      class d3s_savana_EMS { vItemSpace = 80; conditions = ""; price = 8500; textures[] = { }; };
      class d3s_explorer_EMS_13 { vItemSpace = 100; conditions = ""; price = 8000; textures[] = { }; };
	  class AG_EMS_TAURUS { vItemSpace = 100; conditions = ""; price = 8000; textures[] = { }; };
      class d3s_fpace_17_EMS { vItemSpace = 100; conditions = ""; price = 8000; textures[] = { }; };
      class VPC_gn { vItemSpace = 100; conditions = ""; price = 12000; textures[] = { }; };
      class vvv_fire_truck_ausmd { vItemSpace = 100; conditions = ""; price = 15000; textures[] = { }; };
      class d3s_raptor_EMS_17 { vItemSpace = 100; conditions = ""; price = 5000; textures[] = { }; };
      class d3s_challenger_15_EMS { vItemSpace = 100; conditions = ""; price = 5000; textures[] = { }; };
	  class d3s_tiger_2975_EMS { vItemSpace = 100; conditions = ""; price = 7000; textures[] = { }; };
      class d3s_teslaS_ems { vItemSpace = 100; conditions = ""; price = 5000; textures[] = { }; };
      /////////////////////////////////////////////////////////////////////////////////////////////////////////////

      //truck
      class d3s_actros_14_big { vItemSpace = 600; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 300000; textures[] = { }; };
      class d3s_actros_14 { vItemSpace = 600; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 300000; textures[] = { }; };
      class d3s_actros_14_giga { vItemSpace = 600; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 300000; textures[] = { }; };
      class d3s_zil_130_05 { vItemSpace = 150; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 40000; textures[] = { }; };
      class d3s_zil_130_02 { vItemSpace = 200; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 43000; textures[] = { }; };
      class d3s_3303 { vItemSpace = 200; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 40000; textures[] = { }; };
      class d3s_452 { vItemSpace = 190; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 37000; textures[] = { }; };
      class d3s_zil_130 { vItemSpace = 200; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 40000; textures[] = { }; };
      class d3s_zil_130_03 { vItemSpace = 200; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 40000; textures[] = { }; };
      class d3s_zil_130_01 { vItemSpace = 200; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 40000; textures[] = { }; };
      class d3s_zil_130_04 { vItemSpace = 170; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 36000; textures[] = { }; };
      class d3s_zil_130_06 { vItemSpace = 230; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 45000; textures[] = { }; };
      class d3s_zil_130_07 { vItemSpace = 230; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 45000; textures[] = { }; };
      class d3s_zil_131 { vItemSpace = 250; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 50000; textures[] = { }; };
      class d3s_zil_131_4 { vItemSpace = 170; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 30000; textures[] = { }; };
      class d3s_zil_131_3 { vItemSpace = 300; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 55000; textures[] = { }; };
      class d3s_zil_131_5 { vItemSpace = 330; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 62000; textures[] = { }; };
      class d3s_zil_131_2 { vItemSpace = 330; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 61000; textures[] = { }; };
      class d3s_kamaz_2 { vItemSpace = 350; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 68000; textures[] = { }; };
      class d3s_kamaz_MAW_1 { vItemSpace = 350; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 68000; textures[] = { }; };
      class d3s_kamaz_bocha { vItemSpace = 170; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 30000; textures[] = { }; };
      class d3s_kamaz_bocha_MAW_1 { vItemSpace = 170; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 30000; textures[] = { }; };
      class d3s_kamaz_tent_2 { vItemSpace = 420; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 70000; textures[] = { }; };
      class d3s_kamaz_4310_med { vItemSpace = 420; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 70000; textures[] = { }; };
      class d3s_kamaz { vItemSpace = 400; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 65000; textures[] = { }; };
      class d3s_kamaz_kung { vItemSpace = 440; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 74000; textures[] = { }; };
      class d3s_kamaz_tent { vItemSpace = 440; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 74000; textures[] = { }; };
      class d3s_kamaz_tent2 { vItemSpace = 440; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 74000; textures[] = { }; };
      class d3s_kamaz_4350 { vItemSpace = 400; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 63000; textures[] = { }; };
      class d3s_kamaz_4350_kung { vItemSpace = 440; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 74000; textures[] = { }; };
      class d3s_kamaz_4350_tent { vItemSpace = 440; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 76000; textures[] = { }; };
      class d3s_kamaz_4350_tent2 { vItemSpace = 440; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 76000; textures[] = { }; };
      class d3s_kamaz_5350 { vItemSpace = 460; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 80000; textures[] = { }; };
      class d3s_kamaz_5350_bocha { vItemSpace = 170; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 30000; textures[] = { }; };
      class d3s_kamaz_5350_tent { vItemSpace = 490; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 90000; textures[] = { }; };
      class d3s_kraz_6315 { vItemSpace = 500; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 100000; textures[] = { }; };
      class d3s_ural { vItemSpace = 430; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 70000; textures[] = { }; };
      class d3s_ural_tent { vItemSpace = 480; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 80000; textures[] = { }; };
      class d3s_next { vItemSpace = 500; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 150000; textures[] = { }; };
      class d3s_kamaz_6350 { vItemSpace = 580; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 200000; textures[] = { }; };
      class d3s_kraz_6316 { vItemSpace = 600; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 240000; textures[] = { }; };
      class d3s_next_tent { vItemSpace = 600; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 240000; textures[] = { }; };
      class d3s_next_kung { vItemSpace = 650; conditions = "license_civ_driver || call(life_copdept) in [3,5,7]"; price = 270000; textures[] = { }; };

      //POLICE VEHICLES

      //bike
      //normal cars
      class d3s_crown_98_PD { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
      class d3s_taurus_FPI_10 { vItemSpace = 100; conditions = ""; price = 2200; textures[] = { }; };
      class d3s_f86_15_UNM { vItemSpace = 100; conditions = ""; price = 2200; textures[] = { }; };
      class d3s_tahoe_PPV { vItemSpace = 100; conditions = ""; price = 2500; textures[] = { }; };
      class d3s_tahoe_UNM { vItemSpace = 100; conditions = ""; price = 2500; textures[] = { }; };
      class d3s_taurus_sheriff_10 { vItemSpace = 100; conditions = ""; price = 2500; textures[] = { }; };
      class d3s_srthellcat_15_CPP { vItemSpace = 100; conditions = ""; price = 4000; textures[] = { }; };
      class VPC { vItemSpace = 100; conditions = ""; price = 3000; textures[] = { }; };

      class d3s_e400_16_COP { vItemSpace = 100; conditions = ""; price = 5000; textures[] = { }; };
      class d3s_challenger_15_CPST { vItemSpace = 100; conditions = ""; price = 3000; textures[] = { }; };

      class d3s_durango_18_UNM { vItemSpace = 100; conditions = ""; price = 6000; textures[] = { }; };
      class d3s_titan_17_PPV { vItemSpace = 100; conditions = ""; price = 8000; textures[] = { }; };
      class d3s_srthellcat_15_CPST { vItemSpace = 100; conditions = ""; price = 8000; textures[] = { }; };
	  class d3s_tiger_2975_COP { vItemSpace = 100; conditions = ""; price = 9000; textures[] = { }; };
      class d3s_teslaS_16_Mark_42 { vItemSpace = 100; conditions = ""; price = 8000; textures[] = { }; };
      class d3s_challenger_15_CPE { vItemSpace = 100; conditions = ""; price = 12000; textures[] = { }; };

      class d3s_charger_15_CPP { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
	  class GM_ANZUS_SRTCHARGER { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
	  class d3s_srthellcat_15_SWAT { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
	  class d3s_srthellcat_15_CPP { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
	  class d3s_fseries_17_COP { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
	  class d3s_g63amg_16_Police { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
	  class d3s_g500_18_FSB { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
	  class GM_AFP_C300 { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
      class d3s_savana_PSV { vItemSpace = 100; conditions = ""; price = 2200; textures[] = { }; };
      class d3s_fseries_17_P3E { vItemSpace = 100; conditions = ""; price = 2500; textures[] = { }; };
      class d3s_durango_18_DDPI { vItemSpace = 100; conditions = ""; price = 4000; textures[] = { }; };
      class F1_KSP_CV { vItemSpace = 100; conditions = ""; price = 1000; textures[] = { }; };
	  class d3s_srthellcat_15_Sheriff { vItemSpace = 1500; conditions = ""; price = 1000; textures[] = { }; };
	  class HWP_Holden_blue { vItemSpace = 1300; conditions = ""; price = 1000; textures[] = { }; };
	  class DOUG_SWAT_CHARGER { vItemSpace = 1200; conditions = ""; price = 1000; textures[] = { }; };
	  class d3s_malibu_18_COP { vItemSpace = 1500; conditions = ""; price = 1000; textures[] = { }; };
	  class d3s_ctsv_16_police { vItemSpace = 1500; conditions = ""; price = 1000; textures[] = { }; };
	  class d3s_tiger_2975_COP { vItemSpace = 1600; conditions = ""; price = 20000; textures[] = { }; };
      class DOC_Charger_18 { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
      class DOC_Savana_05 { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
      class d3s_crown_98_Sheriff { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
      class d3s_srthellcat_15_Sheriff { vItemSpace = 100; conditions = ""; price = 2200; textures[] = { }; };
      class d3s_raptor_Sheriff_17 { vItemSpace = 100; conditions = ""; price = 2500; textures[] = { }; };
      class d3s_challenger_15_Sheriff { vItemSpace = 100; conditions = ""; price = 4000; textures[] = { }; };
      class d3s_challenger_15_Sheriff_ST { vItemSpace = 100; conditions = ""; price = 4000; textures[] = { }; };
      class d3s_srthellcat_15_Sheriff_ST { vItemSpace = 100; conditions = ""; price = 4000; textures[] = { }; };
      class d3s_macan_16_Sheriff { vItemSpace = 100; conditions = ""; price = 4000; textures[] = { }; };

      class d3s_camry_18_SWAT  { vItemSpace = 100; conditions = ""; price = 1800; textures[] = { }; };
      class d3s_challenger_15_SWAT  { vItemSpace = 100; conditions = ""; price = 2800; textures[] = { }; };
      class d3s_srthellcat_15_SWAT  { vItemSpace = 100; conditions = ""; price = 3800; textures[] = { }; };
      class d3s_ctsv_16_SWAT  { vItemSpace = 100; conditions = ""; price = 4800; textures[] = { }; };
      class d3s_ctsv_16_unm  { vItemSpace = 100; conditions = ""; price = 4800; textures[] = { }; };
      class d3s_e400_16_SWAT  { vItemSpace = 100; conditions = ""; price = 5800; textures[] = { }; };
      class d3s_escalade_16_SWAT  { vItemSpace = 100; conditions = ""; price = 6800; textures[] = { }; };
      class d3s_fseries_17_SWAT  { vItemSpace = 100; conditions = ""; price = 7800; textures[] = { }; };
      class d3s_200_16_SWAT  { vItemSpace = 100; conditions = ""; price = 8800; textures[] = { }; };
      class d3s_lx570_16_SWAT  { vItemSpace = 100; conditions = ""; price = 9800; textures[] = { }; };
      class d3s_raptor_SWAT  { vItemSpace = 100; conditions = ""; price = 10900; textures[] = { }; };
      class AG_Swat_Heli  { vItemSpace = 100; conditions = ""; price = 5800; textures[] = { }; };
      class d3s_FPIU_13  { vItemSpace = 100; conditions = ""; price = 5800; textures[] = { }; };
      class PAUL_FAST_MAN  { vItemSpace = 100; conditions = ""; price = 5800; textures[] = { }; };
      class d3s_focus_17_COP  { vItemSpace = 100; conditions = ""; price = 5800; textures[] = { }; };
	  class d3s_f90_18_PD  { vItemSpace = 100; conditions = ""; price = 5800; textures[] = { }; };
      class ASN_Lenco_Bearcat { vItemSpace = 100; conditions = ""; price = 15000; textures[] = { }; };
      class d3s_raptor_PRP_17  { vItemSpace = 100; conditions = ""; price = 5800; textures[] = { }; };

      //undercover
      class d3s_explorer_UNM_13 { vItemSpace = 100; conditions = ""; price = 6000; textures[] = {
          { "Undercover (Black)", "cop", {
          "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
          "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Red)", "cop", {
            "#(argb,8,8,3)color(0.4,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Green)", "cop", {
            "#(argb,8,8,3)color(0.05,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Blue)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.4,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (White)", "cop", {
            "#(argb,8,8,3)color(0.5,0.5,0.5,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Hot Pink)", "cop", {
            "#(argb,8,8,3)color(1,0.1,1,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Ugly)", "cop", {
            "#(argb,8,8,3)color(0.4,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" }
            };
        };

        class d3s_camry_18_UNM { vItemSpace = 100; conditions = ""; price = 5000; textures[] = {
            { "Undercover (Black)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Red)", "cop", {
            "#(argb,8,8,3)color(0.4,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Green)", "cop", {
            "#(argb,8,8,3)color(0.05,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Blue)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.4,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (White)", "cop", {
            "#(argb,8,8,3)color(0.5,0.5,0.5,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Hot Pink)", "cop", {
            "#(argb,8,8,3)color(1,0.1,1,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Ugly)", "cop", {
            "#(argb,8,8,3)color(0.4,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" }
            };
        };

        class d3s_malibu_18_UNM { vItemSpace = 100; conditions = ""; price = 4000; textures[] = {
            { "Undercover (Black)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Red)", "cop", {
            "#(argb,8,8,3)color(0.4,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Green)", "cop", {
            "#(argb,8,8,3)color(0.05,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Blue)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.4,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (White)", "cop", {
            "#(argb,8,8,3)color(0.5,0.5,0.5,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Hot Pink)", "cop", {
            "#(argb,8,8,3)color(1,0.1,1,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Ugly)", "cop", {
            "#(argb,8,8,3)color(0.4,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" }
            };
        };

        class d3s_taurus_UNM_10 { vItemSpace = 100; conditions = ""; price = 2000; textures[] = {
            { "Undercover (Black)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Red)", "cop", {
            "#(argb,8,8,3)color(0.4,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Green)", "cop", {
            "#(argb,8,8,3)color(0.05,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Blue)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.4,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (White)", "cop", {
            "#(argb,8,8,3)color(0.5,0.5,0.5,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Hot Pink)", "cop", {
            "#(argb,8,8,3)color(1,0.1,1,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Ugly)", "cop", {
            "#(argb,8,8,3)color(0.4,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" }
            };
        };


        class d3s_300_12_UNM { vItemSpace = 100; conditions = ""; price = 7000; textures[] = {
            { "Undercover (Black)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Red)", "cop", {
            "#(argb,8,8,3)color(0.4,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Green)", "cop", {
            "#(argb,8,8,3)color(0.05,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Blue)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.4,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (White)", "cop", {
            "#(argb,8,8,3)color(0.5,0.5,0.5,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Hot Pink)", "cop", {
            "#(argb,8,8,3)color(1,0.1,1,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Ugly)", "cop", {
            "#(argb,8,8,3)color(0.4,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" }
            };
        };

        class d3s_srthellcat_15_UNM { vItemSpace = 100; conditions = ""; price = 7500; textures[] = {
            { "Undercover (Black)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Red)", "cop", {
            "#(argb,8,8,3)color(0.4,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Green)", "cop", {
            "#(argb,8,8,3)color(0.05,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Blue)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.4,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (White)", "cop", {
            "#(argb,8,8,3)color(0.5,0.5,0.5,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Hot Pink)", "cop", {
            "#(argb,8,8,3)color(1,0.1,1,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Ugly)", "cop", {
            "#(argb,8,8,3)color(0.4,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" }
            };
        };

        class d3s_escalade_16_unm { vItemSpace = 100; conditions = ""; price = 5000; textures[] = {
            { "Undercover (Black)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Red)", "cop", {
            "#(argb,8,8,3)color(0.4,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Green)", "cop", {
            "#(argb,8,8,3)color(0.05,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Blue)", "cop", {
            "#(argb,8,8,3)color(0.05,0.05,0.4,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (White)", "cop", {
            "#(argb,8,8,3)color(0.5,0.5,0.5,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Hot Pink)", "cop", {
            "#(argb,8,8,3)color(1,0.1,1,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" },
            { "Undercover (Ugly)", "cop", {
            "#(argb,8,8,3)color(0.4,0.4,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
            "#(argb,8,8,3)color(0.05,0.05,0.05,0.9)"
            }, "" }
            };
        };

        //#### PAUL START HERE ####
        //Civilian cars
      class d3s_oka { vItemSpace = 10; conditions = ""; price = 8000; textures[] = { }; };
      class d3s_zaz968m { vItemSpace = 15; conditions = ""; price = 10200; textures[] = { }; };
      class d3s_3159 { vItemSpace = 20; conditions = ""; price = 15000; textures[] = { }; };
      class d3s_3159_9may { vItemSpace = 20; conditions = ""; price = 17500; textures[] = { }; };
      class d3s_3159_AMG { vItemSpace = 20; conditions = ""; price = 20000; textures[] = { }; };
      class d3s_challenger_15_playboy { vItemSpace = 25; conditions = ""; price = 41250; textures[] = { }; };
      class d3s_xesv_17_shadow { vItemSpace = 25; conditions = ""; price = 41250; textures[] = { }; };
      class d3s_xesv_17_capone { vItemSpace = 25; conditions = ""; price = 41250; textures[] = { }; };
      class d3s_uaz_3162 { vItemSpace = 20; conditions = ""; price = 17500; textures[] = { }; };
      class d3s_savana_05 { vItemSpace = 60; conditions = ""; price = 31250; textures[] = { }; };
      class d3s_savana_05_EX { vItemSpace = 60; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_beetle_04 { vItemSpace = 20; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_beetle_04_EX { vItemSpace = 20; conditions = ""; price = 25000; textures[] = { }; };
      //class d3s_coupeconcept_10 { vItemSpace = 20; conditions = ""; price = 22500; textures[] = { }; };
      class d3s_clubman_11 { vItemSpace = 20; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_clubman_11_50 { vItemSpace = 20; conditions = ""; price = 27500; textures[] = { }; };
      class d3s_clubman_11_W { vItemSpace = 20; conditions = ""; price = 30000; textures[] = { }; };
      class d3s_vesta_15 { vItemSpace = 20; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_vesta_15_turbo { vItemSpace = 20; conditions = ""; price = 27500; textures[] = { }; };
      class d3s_vesta_15_EX { vItemSpace = 20; conditions = ""; price = 31250; textures[] = { }; };
      class d3s_kodiaq_act_17 { vItemSpace = 20; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_kodiaq_17 { vItemSpace = 20; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_kodiaq_amb_17 { vItemSpace = 20; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_giulietta_16 { vItemSpace = 20; conditions = ""; price = 27500; textures[] = { }; };
      class d3s_giulietta_16_SE { vItemSpace = 20; conditions = ""; price = 35000; textures[] = { }; };
      class d3s_giulietta_quad_16 { vItemSpace = 20; conditions = ""; price = 30000; textures[] = { }; };
      class d3s_wrx_17 { vItemSpace = 20; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_wrx_s4_17 { vItemSpace = 20; conditions = ""; price = 37500; textures[] = { }; };
	  //haohua
	  class d3s_roosevelt_gtaV_2 { vItemSpace = 20; conditions = ""; price = 500000; textures[] = { }; };
	  class d3s_javelin_72_Talib { vItemSpace = 20; conditions = ""; price = 600000; textures[] = { }; };
	  class d3s_suprarz_98 { vItemSpace = 20; conditions = ""; price = 550000; textures[] = { }; };
	  class d3s_F40_87_V { vItemSpace = 20; conditions = ""; price = 3000000; textures[] = { }; };
	  class d3s_GTC4Lusso_16 { vItemSpace = 20; conditions = ""; price = 800000; textures[] = { }; };
	  class d3s_dawn_16_III { vItemSpace = 20; conditions = ""; price = 800000; textures[] = { }; };
	  class d3s_veneno_13 { vItemSpace = 20; conditions = ""; price = 2000000; textures[] = { }; };
	  class d3s_mclaren_18 { vItemSpace = 20; conditions = ""; price = 1500000; textures[] = { }; };
	  class d3s_LB650S_15_R { vItemSpace = 20; conditions = ""; price = 1500000; textures[] = { }; };
	  class d3s_gemera_21 { vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_cullinan_19_BB { vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_terzo_18 { vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_P1GTR_15_M { vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_sian_20_P { vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_911gt3rs_18_W { vItemSpace = 20; conditions = ""; price = 1200000; textures[] = { }; };
	  class d3s_CorvetteZR1_19{ vItemSpace = 99999; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_donkervoort_17{ vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_PEE_P50_62_2{ vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_918spyder_15_W{ vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_300SL_55_L{ vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
	  class d3s_bacalar_21_B{ vItemSpace = 20; conditions = ""; price = 200000; textures[] = { }; };
      //Exotic Dealer
      class d3s_pajero_07_38 { vItemSpace = 20; conditions = ""; price = 31250; textures[] = { }; };
      class d3s_pajero_07_PE { vItemSpace = 20; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_200_16 { vItemSpace = 30; conditions = ""; price = 45000; textures[] = { }; };
      class d3s_200_VX_16 { vItemSpace = 30; conditions = ""; price = 46250; textures[] = { }; };
      class d3s_200_16_EX { vItemSpace = 35; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_escalade_16 { vItemSpace = 40; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_kodiaq_sl_17 { vItemSpace = 20; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_kodiaq_sport_17 { vItemSpace = 20; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_kodiaq_se_17 { vItemSpace = 20; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_wrx_sti_17 { vItemSpace = 20; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_wrx_17_FnF8 { vItemSpace = 10; conditions = ""; price = 56250; textures[] = { }; };
      class d3s_silvia_s15_02 { vItemSpace = 20; conditions = ""; price = 72500; textures[] = { }; };
      class d3s_civic_17 { vItemSpace = 20; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_civic_17_S { vItemSpace = 20; conditions = ""; price = 87500; textures[] = { }; };
      class d3s_santafe_19 { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_santafe_19_High { vItemSpace = 35; conditions = ""; price = 56250; textures[] = { }; };
      class d3s_cherokee_18 { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_cherokee_18_LTD { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_cherokee_18_UNM { vItemSpace = 30; conditions = ""; price = 4600; textures[] = { }; };
	  class d3s_agera_11_COP { vItemSpace = 50; conditions = ""; price = 2000000; textures[] = { }; };
      class d3s_raptor_UNM_17 { vItemSpace = 30; conditions = ""; price = 6250; textures[] = { }; };
      class d3s_cherokee_18_SRT { vItemSpace = 35; conditions = ""; price = 60000; textures[] = { }; };
      class d3s_cherokee_18_TRCK { vItemSpace = 35; conditions = ""; price = 60000; textures[] = { }; };
      class d3s_qx56_13 { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_qx56_ht_13 { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_qx56_13_02 { vItemSpace = 35; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_qx56_13_EX { vItemSpace = 35; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_qx56_13_EX2 { vItemSpace = 35; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_qx56_13_SE { vItemSpace = 45; conditions = ""; price = 68750; textures[] = { }; };
      class d3s_giulia_16 { vItemSpace = 20; conditions = ""; price = 81250; textures[] = { }; };
      class d3s_giulia_ti_16 { vItemSpace = 20; conditions = ""; price = 81250; textures[] = { }; };
      class d3s_giulia_q4_16 { vItemSpace = 20; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_giulia_quad_16 { vItemSpace = 20; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_giulia_16_SE { vItemSpace = 20; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_QX60_16 { vItemSpace = 35; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_QX60_16_S { vItemSpace = 35; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_QX60_16_SE { vItemSpace = 10; conditions = ""; price = 72500; textures[] = { }; };
      class d3s_q50_14 { vItemSpace = 25; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_q50_14_1 { vItemSpace = 25; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_q50_ER_14 { vItemSpace = 25; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_q50_14_SE { vItemSpace = 30; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_is_16 { vItemSpace = 25; conditions = ""; price = 975000; textures[] = { }; };
      class d3s_is_f_16 { vItemSpace = 25; conditions = ""; price = 97500; textures[] = { }; };
      class d3s_is_16_1 { vItemSpace = 25; conditions = ""; price = 97500; textures[] = { }; };
      class d3s_is_16_SE { vItemSpace = 35; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_q50_14_EX { vItemSpace = 30; conditions = ""; price = 110000; textures[] = { }; };
      class d3s_evoque_16 { vItemSpace = 35; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_evoque_td4_16 { vItemSpace = 35; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_evoque_sd4_16 { vItemSpace = 35; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_evoque_si4_16 { vItemSpace = 35; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_evoque_16_se { vItemSpace = 35; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_svr_17_SD4 { vItemSpace = 40; conditions = ""; price = 82500; textures[] = { }; };
      class d3s_svr_17_COP { vItemSpace = 40; conditions = ""; price = 7250; textures[] = { }; };
      class d3s_svr_17_Sheriff { vItemSpace = 40; conditions = ""; price = 7250; textures[] = { }; };
      class d3s_svr_17_SDV8 { vItemSpace = 40; conditions = ""; price = 82500; textures[] = { }; };
      class d3s_svr_17_SI4 { vItemSpace = 40; conditions = ""; price = 82500; textures[] = { }; };
      class d3s_svr_17_e { vItemSpace = 40; conditions = ""; price = 82500; textures[] = { }; };
      class d3s_svr_17_HSE { vItemSpace = 40; conditions = ""; price = 82500; textures[] = { }; };
      class d3s_svr_17_V8 { vItemSpace = 40; conditions = ""; price = 82500; textures[] = { }; };
      class d3s_svr_17_SVR { vItemSpace = 40; conditions = ""; price = 82500; textures[] = { }; };
      class d3s_svr_17_TDV { vItemSpace = 40; conditions = ""; price = 82500; textures[] = { }; };
      class d3s_svr_17_CHARGED { vItemSpace = 40; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_svr_17_007 { vItemSpace = 40; conditions = ""; price = 95000; textures[] = { }; };
      class d3s_macan_s_16 { vItemSpace = 40; conditions = ""; price = 87500; textures[] = { }; };
      class d3s_macan_turbo_16 { vItemSpace = 40; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_300C_12 { vItemSpace = 25; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_300S_12 { vItemSpace = 25; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_300SRT_12 { vItemSpace = 25; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_ctsv_16 { vItemSpace = 25; conditions = ""; price = 108750; textures[] = { }; };
      class d3s_ctsv_16_2 { vItemSpace = 25; conditions = ""; price = 108750; textures[] = { }; };
      class d3s_ctsv_16_SCK { vItemSpace = 25; conditions = ""; price = 108750; textures[] = { }; };
      class d3s_ctsv_16_1 { vItemSpace = 25; conditions = ""; price = 117500; textures[] = { }; };
      class d3s_levante_17 { vItemSpace = 25; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_levante_s_17 { vItemSpace = 25; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_levante_Esteso_17 { vItemSpace = 25; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_levante_s_17_mat { vItemSpace = 25; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_rapide_10 { vItemSpace = 25; conditions = ""; price = 137500; textures[] = { }; };
      class d3s_rapide_10_S { vItemSpace = 25; conditions = ""; price = 137500; textures[] = { }; };
      class d3s_rapide_10_AMR { vItemSpace = 25; conditions = ""; price = 137500; textures[] = { }; };
      class d3s_ghibli_14_30 { vItemSpace = 25; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_ghibli_14_d { vItemSpace = 25; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_ghibli_14_q4 { vItemSpace = 25; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_ghibli_14_sq4 { vItemSpace = 25; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_ghibli_14 { vItemSpace = 25; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_ghibli_esteso_14 { vItemSpace = 25; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_ghibli_14_nerissimo { vItemSpace = 25; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_ghibli_14_EX { vItemSpace = 25; conditions = ""; price = 122500; textures[] = { }; };
      class d3s_hornet_52 { vItemSpace = 30; conditions = ""; price = 137500; textures[] = { }; };
      class d3s_hornet_53 { vItemSpace = 30; conditions = ""; price = 137500; textures[] = { }; };
      class d3s_hornet_54 { vItemSpace = 30; conditions = ""; price = 137500; textures[] = { }; };
      class d3s_model_a { vItemSpace = 30; conditions = ""; price = 150000; textures[] = { }; };
      class d3s_continentalGT_18 { vItemSpace = 30; conditions = ""; price = 162500; textures[] = { }; };
      class d3s_continentalGT_18_FE { vItemSpace = 30; conditions = ""; price = 170000; textures[] = { }; };
      class d3s_continentalGT_18_Black { vItemSpace = 30; conditions = ""; price = 175000; textures[] = { }; };
      class d3s_continentalHughIsBeta { vItemSpace = 30; conditions = ""; price = 175000; textures[] = { }; };
      class d3s_alfieri_14 { vItemSpace = 25; conditions = ""; price = 200000; textures[] = { }; };
      class d3s_lm002_90 { vItemSpace = 50; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_lm002_EX { vItemSpace = 50; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_urus_12 { vItemSpace = 50; conditions = ""; price = 168750; textures[] = { }; };
      class d3s_urus_sv_12 { vItemSpace = 50; conditions = ""; price = 175000; textures[] = { }; };
      class d3s_urus_18 { vItemSpace = 50; conditions = ""; price = 187500; textures[] = { }; };
      class d3s_teslaS_16_90 { vItemSpace = 30; conditions = ""; price = 245000; textures[] = { }; };
      class d3s_teslaS_16_100 { vItemSpace = 30; conditions = ""; price = 250000; textures[] = { }; };
      class d3s_ghost_18_EWB { vItemSpace = 30; conditions = ""; price = 425000; textures[] = { }; };
      class d3s_ghost_18_EWB_II { vItemSpace = 30; conditions = ""; price = 450000; textures[] = { }; };
      class d3s_asterion_15_DMC { vItemSpace = 30; conditions = ""; price = 750000; textures[] = { }; };
      class d3s_asterion_15_SE { vItemSpace = 30; conditions = ""; price = 750000; textures[] = { }; };
      class d3s_LaFerrari_14 { vItemSpace = 30; conditions = ""; price = 1187500; textures[] = { }; };
      class d3s_survolt_10 { vItemSpace = 30; conditions = ""; price = 2500000; textures[] = { }; };
      //Motorbike Dealer
      class d3s_Kawasaki_Z800 { vItemSpace = 10; conditions = ""; price = 15000; textures[] = { }; };
      class d3s_KTM_1290_Super_Duke { vItemSpace = 10; conditions = ""; price = 20000; textures[] = { }; };
      class d3s_Ducati_Monster_1200_S { vItemSpace = 10; conditions = ""; price = 23125; textures[] = { }; };
      class d3s_Ducati_XDiavel_S { vItemSpace = 10; conditions = ""; price = 27500; textures[] = { }; };
      class d3s_Suzuki_Hayabusa { vItemSpace = 10; conditions = ""; price = 35000; textures[] = { }; };
      class d3s_Kawasaki_ZX7RR { vItemSpace = 10; conditions = ""; price = 40000; textures[] = { }; };
      class d3s_Suzuki_GSX_R_1000 { vItemSpace = 10; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_Aprilia_Tuono_V4_1100_RR { vItemSpace = 10; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_BMW_S_1000_RR { vItemSpace = 10; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_Kawasaki_Ninja_H2R { vItemSpace = 10; conditions = ""; price = 677500; textures[] = { }; };
      //Donator Dealer
      class Cardinal_Grinder { vItemSpace = 20; conditions = ""; price = 0; textures[] = { }; };
      class Chevrolet_Advance_1953 { vItemSpace = 20; conditions = ""; price = 0; textures[] = { }; };
      class Ford_Mainline_1954 { vItemSpace = 20; conditions = ""; price = 0; textures[] = { }; };
      class Ford_Model_B_1932 { vItemSpace = 20; conditions = ""; price = 0; textures[] = { }; };
      class Holden_Coupe_Utility_1951 { vItemSpace = 20; conditions = ""; price = 0; textures[] = { }; };
      class Righteous_Spike { vItemSpace = 20; conditions = ""; price = 0; textures[] = { }; };
      //Rebel Vehicle
      class d3s_willys { vItemSpace = 15; conditions = ""; price = 12500; textures[] = { }; };
	  class d3s_svr_17_Minions { vItemSpace = 15; conditions = ""; price = 13000; textures[] = { }; };
	  class d3s_camry_18_Sch { vItemSpace = 15; conditions = ""; price = 20000; textures[] = { }; };
	  class DINGASSMALLCOCK { vItemSpace = 15; conditions = ""; price = 20200; textures[] = { }; };
	  class Cardinal_Grinder { vItemSpace = 15; conditions = ""; price = 20100; textures[] = { }; };
	  class d3s_roadrunner_71_GTX { vItemSpace = 15; conditions = ""; price = 20500; textures[] = { }; };
      class d3s_niva_2329 { vItemSpace = 20; conditions = ""; price = 13750; textures[] = { }; };
      class d3s_uaz_469P { vItemSpace = 20; conditions = ""; price = 18750; textures[] = { }; };
      class d3s_uaz_469P_EXP { vItemSpace = 30; conditions = ""; price = 35000; textures[] = { }; };
      class d3s_patriot { vItemSpace = 30; conditions = ""; price = 32500; textures[] = { }; };
      class d3s_uaz_3162_1 { vItemSpace = 25; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_uaz_3162_CAM { vItemSpace = 25; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_uaz_3162_ULT { vItemSpace = 25; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_uaz_3162_LMS { vItemSpace = 25; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_uaz_3162_MAW { vItemSpace = 25; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_uaz_3162_SP { vItemSpace = 25; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_explorer_sport_13_BSC { vItemSpace = 30; conditions = ""; price = 37500; textures[] = { }; };
	  class d3s_svr_17_Shadow { vItemSpace = 30; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_cherokee_18_STELS { vItemSpace = 25; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_tahoe_LMS { vItemSpace = 30; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_vklasse_ULT { vItemSpace = 80; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_wrx_sti_17_mar { vItemSpace = 20; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_wrx_sti_17_maw_2 { vItemSpace = 20; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_wrx_sti_17_maw { vItemSpace = 20; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_wrx_sti_17_BSC { vItemSpace = 20; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_raptor_17_RMC { vItemSpace = 100; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_gls63amg_17_SYND { vItemSpace = 40; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_gl63amg_AlmaZ { vItemSpace = 40; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_gl63amg_Lcn { vItemSpace = 40; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_gl63amg_Aryans { vItemSpace = 40; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_ctsv_16_LCN { vItemSpace = 25; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_ctsv_16_Aryans { vItemSpace = 20; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_lm002_MAW { vItemSpace = 50; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_lm002_MAW_2 { vItemSpace = 50; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_kamaz_4911 { vItemSpace = 120; conditions = ""; price = 156250; textures[] = { }; };
      class d3s_kamaz_49255 { vItemSpace = 120; conditions = ""; price = 156250; textures[] = { }; };
      class d3s_kuruma_gtaV { vItemSpace = 30; conditions = ""; price = 225000; textures[] = { }; };
      //Chevrolet Car Dealer
      class d3s_tahoe_vortec_08 { vItemSpace = 30; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_tahoe_08 { vItemSpace = 30; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_malibu_18 { vItemSpace = 25; conditions = ""; price = 225000; textures[] = { }; };
      class d3s_malibu_18_LT { vItemSpace = 25; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_malibu_18_EX { vItemSpace = 25; conditions = ""; price = 70000; textures[] = { }; };
      class d3s_camaro_ss_16 { vItemSpace = 30; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_camaro_zl1_17 { vItemSpace = 30; conditions = ""; price = 422500; textures[] = { }; };
      class d3s_camaro_zl1_1le_18 { vItemSpace = 30; conditions = ""; price = 1425000; textures[] = { }; };
      class the_camaro_tuning_AP { vItemSpace = 35; conditions = ""; price = 150000; textures[] = { }; };
      //Jaguar Car Dealer
      class d3s_fpace_17_r { vItemSpace = 40; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_fpace_17_s { vItemSpace = 40; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_fpace_17_fe { vItemSpace = 40; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_xe_15 { vItemSpace = 25; conditions = ""; price = 87500; textures[] = { }; };
      class d3s_xer_15 { vItemSpace = 25; conditions = ""; price = 87500; textures[] = { }; };
      class d3s_xes_15 { vItemSpace = 25; conditions = ""; price = 87500; textures[] = { }; };
      class d3s_xes_15_SE { vItemSpace = 30; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_xesv_17 { vItemSpace = 30; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_xesv_17_8 { vItemSpace = 30; conditions = ""; price = 131250; textures[] = { }; };
      //Dodge Car Dealer
      class d3s_durango_18 { vItemSpace = 40; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_durango_18_SRT { vItemSpace = 30; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_durango_18_se { vItemSpace = 40; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_charger_15 { vItemSpace = 25; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_charger_15_SXT { vItemSpace = 25; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_charger_15_RT { vItemSpace = 25; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_charger_15_FnF7 { vItemSpace = 25; conditions = ""; price = 93750; textures[] = { }; };
      class d3s_srthellcat_15 { vItemSpace = 30; conditions = ""; price = 106250; textures[] = { }; };
      class d3s_srthellcat_15_392 { vItemSpace = 30; conditions = ""; price = 106250; textures[] = { }; };
      class d3s_srthellcat_15_HELL { vItemSpace = 30; conditions = ""; price = 106250; textures[] = { }; };
      //Ford Car Dealer
      class d3s_crown_98 { vItemSpace = 15; conditions = ""; price = 25000; textures[] = { }; };
      class d3s_taurus_eco_10 { vItemSpace = 20; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_taurus_dur_10 { vItemSpace = 20; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_taurus_10_ex { vItemSpace = 25; conditions = ""; price = 45000; textures[] = { }; };
      class d3s_fiesta_16_230 { vItemSpace = 20; conditions = ""; price = 31250; textures[] = { }; };
      class d3s_fiesta_16_H { vItemSpace = 20; conditions = ""; price = 31250; textures[] = { }; };
      class d3s_focus_14 { vItemSpace = 20; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_focus_14_ST { vItemSpace = 20; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_focus_14_H { vItemSpace =20; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_explorer_13 { vItemSpace = 30; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_explorer_LT_13 { vItemSpace = 30; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_explorer_sport_13 { vItemSpace = 30; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_explorer_se_13 { vItemSpace = 40; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_explorer_13_EX { vItemSpace = 40; conditions = ""; price = 47500; textures[] = { }; };
      class d3s_focus_17_RS { vItemSpace = 20; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_focus_17_PP { vItemSpace = 20; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_raptor_17 { vItemSpace = 80; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_raptor_SCR_17 { vItemSpace = 100; conditions = ""; price = 85000; textures[] = { }; };
      class d3s_fseries_17 { vItemSpace = 150; conditions = ""; price = 95000; textures[] = { }; };
      class d3s_fseries_LTD_17 { vItemSpace = 150; conditions = ""; price = 95000; textures[] = { }; };
      class d3s_fseries_PLT_17 { vItemSpace = 160; conditions = ""; price = 95000; textures[] = { }; };
      class d3s_focus_17_LB { vItemSpace = 20; conditions = ""; price = 81250; textures[] = { }; };
      class d3s_boss_15 { vItemSpace = 25; conditions = ""; price = 118750; textures[] = { }; };
      class d3s_boss_15_payback { vItemSpace = 25; conditions = ""; price = 128750; textures[] = { }; };
      class Jag_blue { vItemSpace = 25; conditions = ""; price = 1; textures[] = { }; };
      class Jag_orange { vItemSpace = 25; conditions = ""; price = 1; textures[] = { }; };
      class Jag_grise { vItemSpace = 25; conditions = ""; price = 1; textures[] = { }; };
      //Mercedes Car Dealer
      class d3s_vklasse_220_17 { vItemSpace = 80; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_vklasse_250_17 { vItemSpace = 80; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_vklasse_250amg_17 { vItemSpace = 80; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_vklasse_17 { vItemSpace = 80; conditions = ""; price = 43750; textures[] = { }; };
      class d3s_vklasse_17_SE { vItemSpace = 80; conditions = ""; price = 52500; textures[] = { }; };
      class d3s_amazing_a45_16 { vItemSpace = 80; conditions = ""; price = 56250; textures[] = { }; };
      class d3s_amazing_a45_16_AMG { vItemSpace = 25; conditions = ""; price = 56250; textures[] = { }; };
      class d3s_amazing_a45_16_EX { vItemSpace = 30; conditions = ""; price = 67500; textures[] = { }; };
      class d3s_cla_15 { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_cla_14 { vItemSpace = 30; conditions = ""; price = 128750; textures[] = { }; };
      class d3s_cla_220_15 { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class HenchmenCar { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_cla_250_15 { vItemSpace = 25; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_cla_45amg_14 { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_cla_2years_14 { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_gl63amg_Bikers { vItemSpace = 40; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_gls63amg_17 { vItemSpace = 40; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_gls63amg_17_LT { vItemSpace = 40; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_gls63amg_17_EX { vItemSpace = 40; conditions = ""; price = 70000; textures[] = { }; };
      class d3s_gls63amg_17_SE { vItemSpace = 25; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_gl63amg_12 { vItemSpace = 40; conditions = ""; price = 65000; textures[] = { }; };
      class d3s_gle43amg_15 { vItemSpace = 30; conditions = ""; price = 68750; textures[] = { }; };
      class d3s_gle63amg_15 { vItemSpace = 30; conditions = ""; price = 68750; textures[] = { }; };
      class d3s_gle63amgS_15 { vItemSpace = 30; conditions = ""; price = 68750; textures[] = { }; };
      class d3s_cla_45amg_15 { vItemSpace = 30; conditions = ""; price = 81250; textures[] = { }; };
      class d3s_cla_15_SE { vItemSpace = 30; conditions = ""; price = 85000; textures[] = { }; };
      class d3s_cla_14_SE { vItemSpace = 30; conditions = ""; price = 92500; textures[] = { }; };
      class d3s_e220_16 { vItemSpace = 30; conditions = ""; price = 87500; textures[] = { }; };
      class d3s_e350_16 { vItemSpace = 30; conditions = ""; price = 87500; textures[] = { }; };
      class d3s_e400_16 { vItemSpace = 30; conditions = ""; price = 87500; textures[] = { }; };
      class d3s_s350_17 { vItemSpace = 30; conditions = ""; price = 95000; textures[] = { }; };
      class d3s_s560_18 { vItemSpace = 25; conditions = ""; price = 105000; textures[] = { }; };
      class d3s_s600guard_14 { vItemSpace = 30; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_s650_18 { vItemSpace = 30; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_C63S_14 { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_C180_14 { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_C220_14 { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_C250_14 { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_C300_14 { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_C350_14 { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_C450_15 { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_w212s_13 { vItemSpace = 30; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_w212_13 { vItemSpace = 30; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_w212s_13_SCK { vItemSpace = 30; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_C43_16 { vItemSpace = 30; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_C63_14 { vItemSpace = 30; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_C63S_14_SE_AP { vItemSpace = 25; conditions = ""; price = 118750; textures[] = { }; };
      class d3s_g65amg_Mansory { vItemSpace = 25; conditions = ""; price = 131250; textures[] = { }; };
      class d3s_g65amg_Mansory_2 { vItemSpace = 50; conditions = ""; price = 131250; textures[] = { }; };
      class d3s_vv222_18 { vItemSpace = 30; conditions = ""; price = 150000; textures[] = { }; };
      class d3s_vv222_18_2 { vItemSpace = 30; conditions = ""; price = 156250; textures[] = { }; };
      class d3s_amgGT_15 { vItemSpace = 30; conditions = ""; price = 262500; textures[] = { }; };
      //BMW Car Dealer
      class d3s_e38_98 { vItemSpace = 30; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_e38_98_ex { vItemSpace = 30; conditions = ""; price = 37500; textures[] = { }; };
      class d3s_e60_09_ACS5 { vItemSpace = 30; conditions = ""; price = 52500; textures[] = { }; };
      class d3s_f87_17 { vItemSpace = 30; conditions = ""; price = 45000; textures[] = { }; };
      class d3s_f87_17_sport { vItemSpace = 30; conditions = ""; price = 50000; textures[] = { }; };
      class d3s_f87_17_m { vItemSpace = 30; conditions = ""; price = 65000; textures[] = { }; };
      class d3s_f87_18_m { vItemSpace = 30; conditions = ""; price = 68750; textures[] = { }; };
      class d3s_f87_17_ACH { vItemSpace = 30; conditions = ""; price = 68750; textures[] = { }; };
      class d3s_f87_17_EX { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_f87_18_EX { vItemSpace = 30; conditions = ""; price = 56250; textures[] = { }; };
      class d3s_f80_14 { vItemSpace = 30; conditions = ""; price = 67500; textures[] = { }; };
      class d3s_f80_14_cs { vItemSpace = 30; conditions = ""; price = 67500; textures[] = { }; };
      class d3s_f80_14_GTS { vItemSpace = 30; conditions = ""; price = 67500; textures[] = { }; };
      class d3s_f80_14_EX2 { vItemSpace = 30; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_f80_14_SE { vItemSpace = 30; conditions = ""; price = 82500; textures[] = { }; };
      class d3s_f80_14_EX { vItemSpace = 30; conditions = ""; price = 77500; textures[] = { }; };
      class d3s_f82_14_EX { vItemSpace = 30; conditions = ""; price = 80000; textures[] = { }; };
      class d3s_f82_14_CE { vItemSpace = 30; conditions = ""; price = 85000; textures[] = { }; };
      class d3s_amgGTS_15 { vItemSpace = 30; conditions = ""; price = 262500; textures[] = { }; };
      class d3s_f82_14 { vItemSpace = 30; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_f82_14_gts { vItemSpace = 30; conditions = ""; price = 90000; textures[] = { }; };
      class d3s_amazing_f82_16 { vItemSpace = 30; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_amazing_f82_16_IND { vItemSpace = 30; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_amazing_f82_16_EX { vItemSpace = 30; conditions = ""; price = 118750; textures[] = { }; };
      class d3s_f85_15 { vItemSpace = 40; conditions = ""; price = 57500; textures[] = { }; };
      class d3s_f85_15_m { vItemSpace = 40; conditions = ""; price = 62500; textures[] = { }; };
      class d3s_f85_15_EX { vItemSpace = 40; conditions = ""; price = 67500; textures[] = { }; };
      class d3s_f86_15 { vItemSpace = 40; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_f86_15_m { vItemSpace = 40; conditions = ""; price = 80000; textures[] = { }; };
      class d3s_f86_SCK { vItemSpace = 40; conditions = ""; price = 77500; textures[] = { }; };
      class d3s_f86_15_OFF { vItemSpace = 40; conditions = ""; price = 80000; textures[] = { }; };
      class d3s_e60_09_EX { vItemSpace = 30; conditions = ""; price = 56250; textures[] = { }; };
      class d3s_e60_09 { vItemSpace = 30; conditions = ""; price = 56250; textures[] = { }; };
      class d3s_e60_09_m { vItemSpace = 30; conditions = ""; price = 56250; textures[] = { }; };
      class d3s_amazing_f10_12 { vItemSpace = 30; conditions = ""; price = 56250; textures[] = { }; };
      class d3s_f10_12_UNM { vItemSpace = 30; conditions = ""; price = 5500; textures[] = { }; };
      class d3s_f90_18_FE { vItemSpace = 30; conditions = ""; price = 65000; textures[] = { }; };
      class d3s_f90_18_M { vItemSpace = 30; conditions = ""; price = 85000; textures[] = { }; };
      class d3s_f90_18_EX { vItemSpace = 30; conditions = ""; price = 87500; textures[] = { }; };
      class d3s_f90_18_sport { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_f90_18 { vItemSpace = 30; conditions = ""; price = 75000; textures[] = { }; };
      class d3s_amazing_f10_12_FEMID { vItemSpace = 30; conditions = ""; price = 120000; textures[] = { }; };
      class d3s_amazing_f10_12_IND { vItemSpace = 30; conditions = ""; price = 975000; textures[] = { }; };
      class d3s_amazing_f10_12_EX { vItemSpace = 30; conditions = ""; price = 975000; textures[] = { }; };
      class d3s_f13_13 { vItemSpace = 30; conditions = ""; price = 105000; textures[] = { }; };
      class d3s_f13_13_Comp { vItemSpace = 30; conditions = ""; price = 105000; textures[] = { }; };
      class d3s_f13_13_CE { vItemSpace = 30; conditions = ""; price = 112500; textures[] = { }; };
      class d3s_f13_13_EX { vItemSpace = 30; conditions = ""; price = 107500; textures[] = { }; };
      class d3s_e89_12 { vItemSpace = 30; conditions = ""; price = 689750; textures[] = { }; };
      class d3s_e89_12_M { vItemSpace = 30; conditions = ""; price = 68750; textures[] = { }; };
      class d3s_f82_14_LB { vItemSpace = 30; conditions = ""; price = 131250; textures[] = { }; };
      class d3s_f82_14_LCN { vItemSpace = 30; conditions = ""; price = 137500; textures[] = { }; };
      class d3s_f90_18_ULT { vItemSpace = 30; conditions = ""; price = 100000; textures[] = { }; };
      class d3s_i8_17 { vItemSpace = 30; conditions = ""; price = 175000; textures[] = { }; };
      class d3s_amazing_ACS8_17_IND { vItemSpace = 30; conditions = ""; price = 231250; textures[] = { }; };
      class d3s_amazing_ACS8_17_SHELL { vItemSpace = 30; conditions = ""; price = 237500; textures[] = { }; };
};
