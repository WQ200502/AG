/*
/*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Description): Description of item
*        2: SCALAR (Buy price): Cost of item
*        3: STRING (Conditions): Same as above conditions string
*        4: STRING (Nickname): Nickname that will appear purely in the shop dialog
*/

class WeaponShops {
  class cop {
    name = "Cop Weapon Shop";
    conditions = "call life_coplevel >= 1";
    side = "cop";
    weapons[] = {
      { "HandGrenade_Stone", "Blind your suspects and get the upper hand.", 1500, "call life_copdept in [3,6,7,8]", "Flashbang"},
      { "SmokeShellBlue", "", 1000, "call life_copdept in [3,6,7,8]", ""},
      { "SmokeShellRed", "", 1000, "call life_copdept in [3,6,7,8]", ""},
      { "SmokeShellGreen", "", 1000, "call life_copdept in [3,6,7,8]", ""},
      { "taser", "A gun that will drop your target", 50, "call life_coplevel >= 1", ""},
      { "hlc_Pistol_M11", "", 580, "true", ""},
      { "hlc_pistol_Mk25", "", 570, "true", ""},
      { "hlc_pistol_P226WestGerman", "", 670, "true", ""},
      { "hlc_Pistol_P228", "", 670, "true", ""},
      { "hlc_Pistol_M11A1", "", 680, "true", ""},
      { "hlc_Pistol_M11A1D", "", 680, "true", ""},
      { "hlc_pistol_Mk25D", "", 670, "true", ""},
      { "hlc_pistol_Mk25TR", "", 670, "true", ""},
      { "RH_kimber_nw", "", 680, "true", ""},
      { "RH_g19", "", 680, "true", ""},
      { "RH_mp412", "", 680, "true", ""},
      { "RH_fn57", "", 680, "true", ""},
      { "RH_m9", "", 680, "true", ""},
      { "RH_m1911", "", 680, "true", ""},
      { "RH_uspm", "", 680, "true", ""},
      { "RH_g19", "", 680, "true", ""},
	  { "acc_pointer_IR", "", 500, "true", ""},
      { "RH_gsh18", "", 680, "true", ""},
      //Trooper Weapons
      { "RH_sbr9", "", 5000, "call life_coplevel >= 2", ""},
      { "KA_UMP45_P", "", 5000, "call life_coplevel >= 2", ""},
    //Senior Trooper
      { "RH_M16A3", "", 7500, "call life_coplevel >= 3", ""},
      { "RH_M4_moe_b", "", 7500, "call life_coplevel >= 3", ""},
      { "RH_M4sbr_b", "", 7500, "call life_coplevel >= 3", ""},
      { "RH_Hk416s", "", 7500, "call life_coplevel >= 3", ""},
    //Corprol
      { "hlc_rifle_bcmjack", "", 10500, "call life_coplevel >= 4", ""},
      { "thlc_rifle_SAMR", "", 10500, "call life_coplevel >= 4", ""},
    //Sergent
      { "RH_PDW", "", 12500, "call life_coplevel >= 5", ""},
      { "hlc_rifle_ACR_mid_black", "", 12500, "call life_coplevel >= 5", ""},
      { "UB_Custom_MP5", "", 12500, "call life_coplevel >= 5", ""},
    //Lieutenant
      { "RH_M4A6", "", 25000, "call life_coplevel >= 6", ""},
      { "arifle_SDAR_F", "", 3000, "call life_coplevel >= 5 || call life_copdept in [3,5,6,7,8]", ""},
      { "RH_M4sbr_b", "", 12500, "call life_coplevel >= 1", ""},
      { "hlc_smg_mp5a3", "", 2000, "call life_coplevel >= 1 || call life_copdept in [3,5,6,7,8]", ""},
      { "RH_sbr9", "", 2000, "call life_coplevel >= 2 || call life_copdept in [3,5,6,7,8]", ""},
      { "Mossberg_590", "", 4000, "call life_coplevel >= 3 || call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_smg_mp510", "", 2000, "call life_coplevel >= 6 || call life_copdept in [3,6,7,8]", ""},
      { "hlc_smg_9mmar", "", 2000, "call life_coplevel >= 6 || call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_M4", "", 12500, "call life_coplevel >= 3 || call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_rifle_CQBR", "", 10000, "call life_coplevel >= 3 || call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_rifle_RU556", "", 11000, "call life_coplevel >= 3 || call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_rifle_bcmjack", "", 12000, "call life_coplevel >= 4 || call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_SAMR", "", 12500, "call life_coplevel >= 5 || call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_rifle_auga3_bl", "", 7500, "call life_coplevel >= 4 || call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_rifle_ACR68_mid_black", "", 17500, "call life_coplevel >= 6 || call life_copdept in [3,5,6,7,8]", ""},
      { "arifle_SPAR_01_blk_F", "", 20000, "call life_coplevel >= 6 || call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_rifle_mk18mod0", "", 17500, "call life_coplevel >= 6 || call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_rifle_FN3011", "", 20000, "call life_coplevel >= 5 || call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_awmagnum_BL", "", 20000, "call life_coplevel >= 5 && call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_honeybadger", "", 25000, "call life_coplevel >= 5 && call life_copdept in [3,5,7,8]", ""},
      { "hlc_rifle_Bushmaster300", "", 20000, "call life_coplevel >= 5 && call life_copdept in [3,6,7,8]", ""},
      { "hlc_smg_mp5k", "", 1500, "call life_coplevel >= 4 && call life_copdept in [3,6,7,8]", ""},
      { "launch_B_Titan_F", "This will launch fuel rockets at heli when locking on.", 60000, "call life_copdept in [3,6,7,8]", "Fuel Rocket Launcher"},
      { "RH_M16A6", "", 17500, "call life_coplevel >= 3 && call life_copdept in [3,5,6,7,8]", ""},
      { "KA_CS5", "", 25000, "call life_coplevel >= 5 && call life_copdept in [3,6,7,8]", ""},
      { "RH_Mk12mod1", "", 25000, "call life_coplevel >= 5 && call life_copdept in [3,6,7,8]", ""},
      { "KA_M1014", "", 17500, "call life_coplevel >= 4 && call life_copdept in [3,6,7,8]", ""},
      { "KA_PDR", "", 17500, "call life_coplevel >= 4 && call life_copdept in [3,6,7,8]", ""},
      { "KA_M98B", "", 17500, "call life_coplevel >= 4 && call life_copdept in [3,6,7,8]", ""},
      { "RH_Deaglem", "", 2500, "call life_coplevel >= 4 && call life_copdept in [3,6,7,8]", ""},
      { "RH_M4sbr_b", "", 12500, "call life_coplevel >= 4 || call life_copdept in [3,6,7,8]", ""},
      { "RH_M4A1_ris", "", 12500, "call life_coplevel >= 3 || call life_copdept in [3,6,7,8]", ""},
      { "RH_M16A2", "", 12500, "call life_coplevel >= 2 || call life_copdept in [3,6,7,8]", ""},
      { "RH_Hk416s", "", 12500, "call life_coplevel >= 3 || call life_copdept in [3,6,7,8]", ""},
      { "KA_SCAR_L_Black_Grip", "", 15000, "call life_coplevel >= 5 || call life_copdept in [3,6,7,8]", ""},
      { "KA_SCAR_L_Black_Hand", "", 15000, "call life_coplevel >= 5 || call life_copdept in [3,6,7,8]", ""},
      { "KA_FNP45", "", 10000, "call life_coplevel >= 5 && call life_copdept in [3,6,7,8]", ""},
      { "Mossberg_590", "", 15000, "call life_coplevel >= 5 && call life_copdept in [3,6,7,8]", ""},

      //CRT
      { "KA_UMP9", "CRT ONLY", 5000, "call life_coplevel = 5 && call life_copdept in [3,1,7,8]", ""},
      { "RH_Mk12mod1", "CRT ONLY", 15000, "call life_coplevel = 5 && call life_copdept in [3,1,7,8]", ""},
      { "hlc_rifle_ACR68_full_black", "CRT ONLY", 15000, "call life_coplevel = 6 && call life_copdept in [3,1,7,8]", ""},
      { "hlc_rifle_ACR68_SBR_black", "CRT ONLY", 15000, "call life_coplevel = 6 && call life_copdept in [3,1,7,8]", ""},
      { "hlc_rifle_samr2", "CRT ONLY", 15000, "call life_coplevel = 6 && call life_copdept in [3,1,7,8]", ""},
      { "SmokeShellBlue", "CRT ONLY", 1000, "call life_coplevel = 5 && call life_copdept in [3,1,7,8]", ""},
      { "SmokeShellRed", "CRT ONLY", 1000, "call life_coplevel = 5 && call life_copdept in [3,1,7,8]", ""},
      { "SmokeShellGreen", "CRT ONLY", 1000, "call life_coplevel = 5 && call life_copdept in [3,1,7,8]", ""},
      //DTU weapons
      { "KA_machete", "", 2500, "call life_copdept in [3,6,7,8]", ""},
      { "KA_dagger", "", 2500, "call life_copdept in [3,6,7,8]", ""},
      { "KA_axe", "", 2500, "call life_copdept in [3,6,7,8]", ""},
      { "KA_knife", "", 2500, "call life_copdept in [3,6,7,8]", ""},
      { "KA_FNP45", "", 10000, "call life_copdept in [3,6,7,8]", ""},
      { "arifle_AKS_F", "", 10000, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_CQBR", "", 11500, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_RPK12", "", 12500, "call life_copdept in [3,6,7,8]", ""},
      { "arifle_CTAR_hex_F", "", 12500, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_aek971_mtk", "", 16250, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_ACR_SBR_tan", "", 16250, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_ak74", "", 16250, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_rpk74n", "", 16250, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_rifle_ak12", "", 16250, "call life_copdept in [3,6,7,8]", ""},
      { "RH_mk2", "", 5500, "call life_copdept in [3,6,7,8]", ""},
      { "RH_ttracker_g", "", 3000, "call life_copdept in [3,6,7,8]", ""},
      { "RH_muzi", "", 7500, "call life_copdept in [3,6,7,8]", ""},
      { "RH_vp70", "", 7500, "call life_copdept in [3,6,7,8]", ""},
      { "RH_bullb", "", 25000, "call life_copdept in [3,6,7,8]", ""},
      { "KA_UMP45", "", 12500, "call life_copdept in [3,6,7,8]", ""}
    };

    magazines[] = {
      { "RH_32Rnd_9mm_M822", "", 10, "true", ""},
      { "KA_CS5_10rnd_M993_AP_mag", "", 10, "true", ""},
      { "8Rnd_SPAS12_buck", "", 10, "true", ""},
      { "KA_SCAR_L_30rnd_Mk318_SOST_mag", "", 10, "call life_coplevel >= 5 || call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_30rnd_68x43_FMJ", "", 50, "true", ""},
      { "hlc_30rnd_68x43_OTM", "", 50, "true", ""},
      { "hlc_30rnd_68x43_OTM", "", 50, "true", ""},
      { "hlc_30rnd_68x43_FMJ", "", 50, "true", ""},
      { "hlc_30rnd_556x45_EPR", "", 50, "true", ""},
      { "hlc_30rnd_556x45_SOST", "", 50, "true", ""},
      { "hlc_30rnd_556x45_SPR", "", 50, "true", ""},
      { "hlc_20Rnd_762x51_B_fal", "", 50, "true", ""},
      { "RH_30Rnd_6x35_mag", "", 50, "true", ""},
      { "RH_7Rnd_45cal_m1911", "", 10, "true", ""},
      { "RH_30Rnd_556x45_Mk262", "", 10, "true", ""},
      { "RH_17Rnd_9x19_g17", "", 10, "true", ""},
      { "RH_6Rnd_357_Mag", "", 10, "true", ""},
      { "RH_20Rnd_57x28_FN", "", 10, "true", ""},
      { "RH_15Rnd_9x19_M9", "", 10, "true", ""},
      { "RH_16Rnd_40cal_usp", "", 10, "true", ""},
      { "RH_18Rnd_9x19_gsh", "", 10, "true", ""},
      { "KA_15Rnd_45ACP_Mag", "", 10, "true", ""},
      { "KA_25Rnd_45ACP_High_Presure_Mag", "", 10, "true", ""},
      { "RH_7Rnd_50_AE", "", 10, "true", ""},
      { "KA_Galil_35rnd_Mk318_SOST_mag", "", 10, "true", ""},
      { "RH_30Rnd_68x43_FMJ", "", 10, "call life_coplevel >= 3 && call life_copdept in [1,2,3,5,6,7,8]", ""},
      { "RH_30Rnd_556x45_Mk262", "", 10, "call life_coplevel >= 3 && call life_copdept in [3,5,6,7,8]", ""},
      { "SMA_30Rnd_556x45_Mk262", "", 10, "call life_coplevel >= 3 && call life_copdept in [3,5,6,7,8]", ""},
      { "hlc_20Rnd_762x51_mk316_M14", "", 10, "call life_coplevel >= 3 && call life_copdept in [3,5,6,7,8]", ""},
      { "6Rnd_M1014_buck", "", 10, "call life_coplevel >= 3 && call life_copdept in [3,5,6,7,8]", ""},
      { "KA_M98B_10Rnd_338_API526_Mag", "", 10, "call life_coplevel >= 3 && call life_copdept in [3,5,6,7,8]", ""},
      { "8Rnd_Mossberg_590_Pellets", "Shotgun Bullets", 5, "call life_coplevel >= 1", ""},
      { "vvv_np_magazine_taser", "Magazine for tazer", 5, "call life_coplevel >= 1", ""},
      { "8Rnd_9x19_Magazine", "", 10, "true", ""},
      { "hlc_13Rnd_9x19_B_P228", "", 10, "true", ""},
      { "hlc_15Rnd_9x19_B_P226", "", 10, "true", ""},
      { "8Rnd_45GAP_Magazine", "", 10, "true", ""},
      { "6Rnd_357M_Magazine", "", 10, "true", ""},
      { "20Rnd_556x45_UW_mag", "", 50, "true", ""},
      { "RH_30Rnd_556x45_M855A1", "", 50, "true", ""},
      { "hlc_30Rnd_9x19_GD_MP5", "", 50, "true", ""},
      { "hlc_30Rnd_9x19_B_MP5", "", 100, "true", ""},
      { "8Rnd_Mossberg_590_Slug", "Knockdown Round", 100, "true", ""},
      { "hlc_30Rnd_10mm_JHP_MP5", "", 100, "true", ""},
      { "hlc_30rnd_556x45_EPR", "", 100, "true", ""},
      { "hlc_30rnd_556x45_SPR", "", 100, "call life_coplevel >= 4 && call life_copdept in [3,5,6,7,8]", ""},
      { "30Rnd_556x45_Stanag", "", 100, "true", ""},
      { "hlc_30rnd_556x45_SOST", "", 100, "true", ""},
      { "hlc_30Rnd_556x45_B_AUG", "", 100, "true", ""},
	  { "acc_pointer_IR", "", 100, "true", ""},
      { "hlc_30rnd_68x43_FMJ", "", 110, "call life_copdept in [3,5,6,7,8]", ""},
      { "FHQ_25Rnd_762x51_Mag", "", 110, "call life_copdept in [3,6,7,8]", ""},
      { "FHQ_rem_30Rnd_680x43_ACR", "", 110, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_5rnd_300WM_mk248_AWM", "", 110, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_30rnd_556x45_SPR_sg550", "", 110, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_10Rnd_762x51_mk316_fal", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "UGL_FlareCIR_F", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "UGL_FlareYellow_F", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "UGL_FlareRed_F", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "UGL_FlareWhite_F", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "UGL_FlareGreen_F", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "1Rnd_SmokeGreen_Grenade_shell", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "1Rnd_SmokeBlue_Grenade_shell", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "1Rnd_SmokeRed_Grenade_shell", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "29rnd_300BLK_STANAG", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "Titan_AA", "This will drain the helis fuel when rocket hits.", 20000, "call life_copdept in [3,5,7,8]", "Fuel Rocket"},

      //DTU
      { "KA_machete_blade", "", 40, "call life_copdept in [3,6,7,8]", ""},
      { "KA_dagger_blade", "", 40, "call life_copdept in [3,6,7,8]", ""},
      { "KA_axe_blade", "", 40, "call life_copdept in [3,6,7,8]", ""},
      { "KA_knife_blade", "", 40, "call life_copdept in [3,6,7,8]", ""},
      { "RH_10Rnd_22LR_mk2", "", 40, "call life_copdept in [3,6,7,8]", ""},
      { "RH_6Rnd_45ACP_Mag", "", 40, "call life_copdept in [3,6,7,8]", ""},
      { "RH_30Rnd_9x19_UZI", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "RH_18Rnd_9x19_VP", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "RH_6Rnd_454_Mag", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_30rnd_68x43_OTM", "", 100, "call life_copdept in [3,5,6,7,8]", ""},
      { "KA_30rnd_7N6M_FMJ_HSC_mag", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "KA_25Rnd_45ACP_Tracer_Red_Mag", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_30rnd_556x45_EPR", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "30Rnd_545x39_Mag_F", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "30Rnd_580x42_Mag_F", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_30Rnd_545x39_t_ak", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "FHQ_35Rnd_556x45_Mag", "", 100, "call life_copdept in [3,6,7,8]", ""},
      { "hlc_30Rnd_545x39_B_AK", "", 100, "call life_copdept in [3,6,7,8]", ""}
    };

    items[] = {
      {"Binocular", "Use these to see stuff at furthur distances", 250, "call life_coplevel >= 1", ""},
      {"Rangefinder", "Use these to see stuff at furthur distances", 250, "call life_coplevel >= 5 && call life_copdept in [3,6,7,8]", ""},
      {"ItemGPS", "Use this to not get lost", 500, "call life_coplevel >= 1", ""},
      {"ItemMap", "Use this to find the local shops", 10, "call life_coplevel >= 1", ""},
      {"ItemCompass", "Use this to find directions", 10, "call life_coplevel >= 1", ""},
      {"A3MT_Police_Ohrstecker", "Use this to see in the dark", 10, "call life_coplevel >= 1", ""},
      {"RoleplayRadio", "Use this to communicate from distance", 15, "call life_coplevel >= 1", ""}
    };

    attachments[] = {
      { "RH_cmore", "", 200, "true", ""},
      { "RH_eotech553", "", 200, "true", ""},
      { "KA_FNP45_shield2", "", 200, "true", ""},
      { "KA_red", "", 200, "true", ""},
      { "RH_barska_rds", "", 200, "true", ""},
      { "SMA_BARSKA", "", 200, "true", ""},
      { "RH_ta31rmr", "", 200, "true", ""},
      { "SMA_ELCAN_SPECTER_RDS", "", 200, "true", ""},
      { "acc_flashlight", "", 200, "true", ""},
      { "optic_Hamr", "", 50, "true", ""},
      { "optic_MRCO", "", 50, "true", ""},
      { "optic_Arco_blk_F", "", 50, "true", ""},
      { "optic_ERCO_blk_F", "", 50, "true", ""},
      { "optic_MRD", "", 50, "true", ""},
      { "HLC_optic228_ATT", "", 20, "true", ""},
      { "HLC_optic228_VTAC", "", 20, "true", ""},
      { "HLC_Optic_Romeo1_RX", "", 50, "true", ""},
      { "HLC_optic228_stavenhagen", "", 50, "true", ""},
      { "hlc_optic_ZF95_3011", "", 50, "true", ""},
      { "acc_flashlight", "", 50, "true", ""},
      { "RH_compM2l", "", 200, "true", ""},
      { "RH_LTdocterl", "", 200, "true", ""},
      { "RH_barska_rds", "", 200, "true", ""},
      { "optic_Arco_blk_F", "", 200, "true", ""},
      { "RH_cmore", "", 200, "true", ""},
      { "RH_eotech553mag", "", 200, "true", ""},
      { "RH_ta01nsn_2D", "", 200, "true", ""},
      { "RH_ta31rmr_2D", "", 200, "true", ""},
      { "optic_Hamr", "", 200, "true", ""},
      { "optic_MRCO,", "", 200, "true", ""},
      { "RH_ta648", "", 200, "true", ""},
      { "KA_Elcan_black_Folding_Sight_45_Degree", "", 200, "true", ""},
      { "optic_AMS", "", 200, "true", ""},
      { "optic_DMS", "", 200, "true", ""},
      { "RH_SFM952V", "", 200, "true", ""},
      { "KA_ANPEQ15_Black_IR", "", 200, "true", ""},
      { "RH_HBLM", "", 200, "true", ""},
      { "bipod_01_F_blk", "", 200, "true", ""},
      { "RH_HBLM_des", "", 200, "true", ""},
      { "RH_TD_ACB_g", "", 200, "true", ""},
      { "103_Inches_Barrel", "", 200, "true", ""},
      { "103_Inches_Barrel_Flash_Hider", "", 200, "true", ""},
      { "103_Inches_Barrel_Silencer", "", 200, "true", ""},
      { "145_Inches_Barrel_Bayonet", "", 200, "true", ""},
      { "145_Inches_Barrel_Silencer2", "", 200, "true", ""},
      { "Hand_Guard_Rail", "", 200, "true", ""},
      { "Hand_Guard_Rail_Covers", "", 200, "true", ""},
      { "Hand_Guard_Rail_Flashlight_Black", "", 200, "true", ""},
      { "Hand_Guard_Rail_Laser_Black", "", 200, "true", ""},
      { "Hand_Guard_Rail_Laser_Use_Flashlight_Black", "", 200, "true", ""},
      { "Round_Hand_Guard", "", 200, "true", ""},
      { "ATG_Grip_MOE_Grip_MOE_Stock_Black", "", 200, "true", ""},
      { "ATG_Grip_Original_Grip_Original_Stock", "", 200, "true", ""},
      { "Bipod_MOE_Grip_MOE_Stock_Black", "", 200, "true", ""},
      { "MOE_Grip_MOE_Stock_Green", "", 200, "true", ""},
      { "MVG_Grip_MOE_Grip_MOE_Stock_Black", "", 200, "true", ""},
      { "Original_Grip_M16_Stock", "", 200, "true", ""},
      { "Original_Grip_Original_Stock", "", 200, "true", ""},
      { "Vertical_Grip_Original_Grip_Original_Stock", "", 200, "true", ""},
      { "Vertical_Grip_MOE_Grip_MOE_Stock_Black", "", 200, "true", ""},
      { "RH_ta31rmr_2D", "", 100, "call life_coplevel >= 3 && call life_copdept in [3,6,7,8]", ""},
      { "RH_ta648", "", 100, "call life_coplevel >= 3 && call life_copdept in [3,6,7,8]", ""},
      { "SMA_SFPEQ_M4TOP_BLK", "", 100, "call life_coplevel >= 3 && call life_copdept in [3,6,7,8]", ""},
      { "KA_FNP45_shield2", "", 100, "call life_coplevel >= 3 && call life_copdept in [3,6,7,8]", ""},
      { "KA_red", "", 100, "call life_coplevel >= 3 && call life_copdept in [3,6,7,8]", ""},
      { "hlc_optic_LeupoldM3A_3011", "", 100, "call life_coplevel >= 5 && call life_copdept in [3,7,8]", ""},
      { "optic_LRPS", "", 100, "call life_coplevel >= 5 && call life_copdept in [3,6,7,8]", ""}
    };
  };

  class gun {
    name = "Kamdan Firearms";
    conditions = "license_civ_gun || call life_copdept in [3,6,7,8]";
    side = "civ";
    weapons[] = {
      { "hlc_Pistol_M11", "", 11600, "true", ""},
      { "hlc_pistol_Mk25", "", 11400, "true", ""},
      { "hlc_pistol_P226WestGerman", "", 13400, "true", ""},
      { "hlc_Pistol_P228", "", 13400, "true", ""},
      { "hlc_Pistol_M11A1", "", 13600, "true", ""},
      { "hlc_Pistol_M11A1D", "", 13600, "true", ""},
      { "hlc_pistol_Mk25D", "", 13500, "true", ""},
      { "hlc_pistol_Mk25TR", "", 13500, "true", ""},
      { "hlc_pistol_P226R_357Combat", "", 13500, "true", ""},
      { "hlc_pistol_P226R_40Combat", "", 13500, "true", ""},
      { "hgun_Pistol_heavy_01_F", "", 13500, "true", ""},
      { "hgun_Rook40_F", "", 13500, "true", ""},
      { "hlc_rifle_FN3011", "", 80000, "true", ""},
      { "hlc_rifle_FN3011_WDL", "", 80000, "true", ""},
      { "hlc_rifle_M1903A1", "", 30000, "true", ""},
      { "RH_m9", "", 13400, "true", ""},
      { "RH_m9c", "", 13400, "true", ""},
      { "KA_Px4", "", 13400, "true", ""},
      { "KA_Px4_Black", "", 13400, "true", ""},
      { "RH_python", "", 25000, "true", ""},
      { "RH_Deagleg", "", 50000, "true", ""},
      { "RH_Deaglem", "", 50000, "true", ""},
      { "RH_Deagles", "", 50000, "true", ""},
      { "RH_fn57", "", 13400, "true", ""},
      { "RH_fn57_t", "", 13400, "true", ""},
      { "RH_g17", "", 13400, "true", ""},
      { "RH_g19", "", 13400, "true", ""},
      { "KA_Glock_17_Single", "", 13400, "true", ""},
      { "KA_Glock_18_Single", "", 13400, "true", ""},
      { "RH_gsh18", "", 13400, "true", ""},
      { "RH_kimber", "", 13400, "true", ""},
      { "RH_m1911", "", 13400, "true", ""},
      { "RH_mak", "", 13400, "true", ""},
      { "RH_mp412", "", 13400, "true", ""},
      { "KA_crossbow_black", "", 25000, "true", ""}
    };

    magazines[] = {
      { "hlc_12Rnd_357SIG_B_P226", "", 40, "true", ""},
      { "hlc_12Rnd_40SW_B_P226", "", 40, "true", ""},
      { "FHQ_7Rnd_45ACP_Mag", "", 30, "true", ""},
      { "hlc_13Rnd_9x19_B_P228", "", 30, "true", ""},
      { "hlc_15Rnd_9x19_B_P226", "", 40, "true", ""},
      { "8Rnd_45GAP_Magazine", "", 50, "true", ""},
      { "6Rnd_357M_Magazine", "", 100, "true", ""},
      { "hlc_30rnd_556x45_EPR", "", 30, "true", ""},
      { "11Rnd_45ACP_Mag", "", 30, "true", ""},
      { "16Rnd_9x21_Mag", "", 30, "true", ""},
      { "hlc_5rnd_3006_1903", "", 50, "true", ""},
      { "RH_15Rnd_9x19_M9", "", 40, "true", ""},
      { "KA_Px4_17Rnd_9x19_FMJ_Mag", "", 40, "true", ""},
      { "RH_6Rnd_357_Mag", "", 40, "true", ""},
      { "RH_7Rnd_50_AE", "", 40, "true", ""},
      { "RH_20Rnd_57x28_FN", "", 40, "true", ""},
      { "RH_17Rnd_9x19_g17", "", 40, "true", ""},
      { "KA_17Rnd_9x19_Mag", "", 40, "true", ""},
      { "RH_18Rnd_9x19_gsh", "", 40, "true", ""},
      { "RH_7Rnd_45cal_m1911", "", 40, "true", ""},
      { "RH_8Rnd_9x18_Mak", "", 40, "true", ""},
      { "RH_6Rnd_357_Mag", "", 40, "true", ""},
      { "KA_arrow_mag", "", 40, "true", ""},
      { "hlc_10Rnd_762x51_B_fal", "", 100, "true", ""}
    };

    attachments[] = {
      { "optic_Yorris", "", 50, "true", ""},
      { "optic_Aco_smg", "", 50, "true", ""},
      { "optic_MRD", "", 50, "true", ""},
      { "HLC_optic228_ATT", "", 20, "true", ""},
      { "HLC_optic228_VTAC", "", 20, "true", ""},
      { "HLC_Optic_Romeo1_RX", "", 50, "true", ""},
      { "HLC_optic228_stavenhagen", "", 50, "true", ""},
      { "hlc_optic_ANGSCHUTZ", "", 20, "true", ""},
      { "hlc_optic_ZF95_3011", "", 400, "true", ""},
      { "hlc_optic_FNSTANAG2D", "", 200, "true", ""}
    };
    items[] = {
      { "RoleplayRadio", "Use this to communicate from distance", 150, "true", ""},
      { "Binocular", "Use these to see stuff at furthur distances", 250, "true", ""},
      { "ItemGPS", "Use this to not get lost", 500, "true", ""},
	  { "NVGoggles", "Use this to not get lost", 300, "true", ""},
      { "ItemMap", "Use this to find the local shops", 10, "true", ""},
      { "ItemCompass", "Use this to find directions", 10, "true", ""}
    };
  };

  class jail {
    name = "Jail Firearms";
    conditions = "life_is_arrested";
    side = "civ";
    weapons[] = {
      { "KA_knife", "", 3000, "true", ""},
      { "hgun_Pistol_heavy_01_F", "", 6000, "true", ""},
      { "hgun_Rook40_F", "", 7000, "true", ""}
    };

    magazines[] = {
      { "KA_knife_blade", "", 500, "true", ""},
      { "11Rnd_45ACP_Mag", "", 500, "true", ""},
      { "16Rnd_9x21_Mag", "", 750, "true", ""}
    };

    attachments[] = {
      { "optic_Yorris", "", 50, "true", ""},
      { "optic_MRD", "", 50, "true", ""},
      { "HLC_optic228_ATT", "", 20, "true", ""},
      { "HLC_optic228_VTAC", "", 20, "true", ""},
      { "HLC_Optic_Romeo1_RX", "", 50, "true", ""},
      { "HLC_optic228_stavenhagen", "", 50, "true", ""}
    };
    items[] = {
      { "RoleplayRadio", "Use this to talk to others out of jail", 250, "true", ""},
      { "Binocular", "Use these to see cops at furthur distances", 250, "true", ""},
      { "ItemGPS", "Let others find you if you are in a gang", 750, "true", ""},
	  { "NVGoggles", "Let others find you if you are in a gang", 300, "true", ""},
      { "ItemMap", "Use this to find your way out", 100, "true", ""}
    };
  };

  class rebel {
    name = "Rebel Weaponn Shop";
    conditions = "(missionNamespace getVariable ['mav_ttm_var_rebel',0]) isEqualTo 1";
    side = "civ";
    weapons[] = {
      { "NVGoggles_OPFOR", "", 1000, "true", ""},
      { "NVGoggles", "", 1000, "true", ""},
      { "NVGoggles_INDEP", "", 1000, "true", ""},
      { "NVGoggles_tna_F", "", 1000, "true", ""},
      { "KA_machete", "", 10000, "true", ""},
      { "KA_dagger", "", 10000, "true", ""},
      { "KA_axe", "", 10000, "true", ""},
      { "KA_knife", "", 10000, "true", ""},
      { "hlc_smg_mp5k", "", 30000, "true", ""},
      { "arifle_AKS_F", "", 40000, "true", ""},
      { "hlc_rifle_CQBR", "", 43000, "true", ""},
      { "hlc_rifle_RPK12", "", 50000, "true", ""},
      { "hlc_smg_mp510", "", 50000, "true", ""},
      { "arifle_CTAR_hex_F", "", 50000, "true", ""},
      { "arifle_TRG21_F", "", 50000, "true", ""},
      { "hlc_rifle_RU556", "", 65000, "true", ""},
      { "hlc_rifle_aek971_mtk", "", 65000, "true", ""},
      { "hlc_rifle_ACR_SBR_tan", "", 70000, "true", ""},
      { "arifle_KA_SKS_F", "", 50000, "true", ""},
      { "hlc_rifle_mk18mod0", "", 75000, "true", ""},
      { "hlc_rifle_SAMR", "", 75000, "true", ""},
      { "arifle_SPAR_01_blk_F", "", 80000, "true", ""},
      { "hlc_rifle_ak74", "", 40000, "true", ""},
      { "hlc_rifle_rpk74n", "", 40000, "true", ""},
      { "hlc_rifle_ak12", "", 50000, "true", ""},
      { "hlc_rifle_auga3_bl", "", 70000, "true", ""},
      { "KA_SCAR_L_Black_Hand", "", 90000, "true", ""},
      { "hlc_rifle_ACR_full_black", "", 85000, "true", ""},
      { "RH_mk2", "", 11000, "true", ""},
      { "KICKASS_Sawed_Off_Shotgun", "", 17000, "true", ""},
      { "RH_ttracker_g", "", 11000, "true", ""},
      { "RH_muzi", "", 25000, "true", ""},
      { "RH_vp70", "", 25000, "true", ""},
      { "RH_bullb", "", 41000, "true", ""},
      { "RH_SAMR", "", 80000, "true", ""},
      { "RH_M4sbr_b", "", 65000, "true", ""},
      { "KA_UMP45", "", 40000, "true", ""},
      { "RH_Hk416s", "", 80000, "true", ""},
      { "RH_m4", "", 65000, "true", ""},
      { "arifle_AK12U_F", "", 65000, "true", ""}
    };

    magazines[] = {
      { "KA_machete_blade", "", 40, "true", ""},
      { "KA_dagger_blade", "", 40, "true", ""},
      { "KA_axe_blade", "", 40, "true", ""},
      { "KA_knife_blade", "", 40, "true", ""},
      { "RH_10Rnd_22LR_mk2", "", 40, "true", ""},
      { "30Rnd_556x45_Stanag", "", 40, "true", ""},
      { "KICKASS_2Rnd_Sawed_Off_Shotgun_Pellets", "", 40, "true", ""},
      { "RH_6Rnd_45ACP_Mag", "", 40, "true", ""},
      { "KA_SCAR_L_30rnd_Mk318_SOST_mag", "", 40, "true", ""},
      { "hlc_30Rnd_556x45_B_AUG", "", 40, "true", ""},
      { "RH_30Rnd_9x19_UZI", "", 100, "true", ""},
      { "RH_18Rnd_9x19_VP", "", 100, "true", ""},
      { "RH_6Rnd_454_Mag", "", 100, "true", ""},
      { "KA_30rnd_7N6M_FMJ_HSC_mag", "", 100, "true", ""},
      { "SMA_30Rnd_556x45_Mk262", "", 100, "true", ""},
      { "KA_25Rnd_45ACP_Tracer_Red_Mag", "", 100, "true", ""},
      { "hlc_30Rnd_9x19_B_MP5", "", 100, "true", ""},
      { "hlc_30rnd_556x45_EPR", "", 100, "true", ""},
      { "30Rnd_545x39_Mag_F", "", 100, "true", ""},
      { "hlc_30Rnd_10mm_B_MP5", "", 100, "true", ""},
      { "30Rnd_556x45_Stanag", "", 100, "true", ""},
      { "30Rnd_580x42_Mag_F", "", 100, "true", ""},
      { "10Rnd_M43_762x39_Ball", "", 100, "true", ""},
      { "hlc_30Rnd_556x45_SPR_sg550", "", 100, "true", ""},
      { "hlc_30Rnd_545x39_t_ak", "", 100, "true", ""},
      { "FHQ_35Rnd_556x45_Mag", "", 100, "true", ""},
      { "FHQ_rem_30Rnd_680x43_ACR", "", 100, "true", ""},
      { "hlc_30Rnd_545x39_B_AK", "", 100, "true", ""},
      { "30Rnd_762x39_AK12_Mag_F", "", 100, "true", ""}
    };

    attachments[] = {
      { "optic_Arco_blk_F", "", 50, "true", ""},
      { "optic_ERCO_blk_F", "", 50, "true", ""},
      { "optic_MRCO", "", 20, "true", ""},
      { "optic_Hamr", "", 20, "true", ""},
      { "optic_SOS", "", 20000, "true", ""},
      { "bipod_03_F_blk", "", 10000, "true", ""},
      { "optic_Holosight", "", 20, "true", ""},
      { "RH_cmore", "", 200, "true", ""},
      { "RH_eotech553", "", 200, "true", ""},
      { "RH_barska_rds", "", 200, "true", ""},
      { "SMA_BARSKA", "", 200, "true", ""},
      { "RH_ta31rmr", "", 200, "true", ""},
      { "SMA_ELCAN_SPECTER_RDS", "", 200, "true", ""},
      { "acc_flashlight", "", 200, "true", ""}
    };

    items[] = {
      { "RoleplayRadio", "Use this to communicate from distance", 150, "true", ""},
      { "Binocular", "Use these to see stuff at furthur distances", 250, "true", ""},
      { "ItemGPS", "Use this to not get lost", 500, "true", ""},
	  { "NVGoggles", "Use this to not get lost", 300, "true", ""},
      { "ItemMap", "Use this to find the local shops", 10, "true", ""},
      { "ItemCompass", "Use this to find directions", 10, "true", ""}
    };
  };

  class Advrebel {
    name = "Advanced Rebel";
    conditions = "(missionNamespace getVariable ['mav_ttm_var_advrebel',0]) isEqualTo 1";
    side = "civ";
    weapons[] = {
      { "RH_Mk12mod1", "", 175000, "true", ""},
      { "hlc_rifle_awmagnum", "", 175000, "true", ""},
      { "hlc_rifle_M14", "", 200000, "true", ""},
      { "RH_M4A6", "", 200000, "true", ""},
      { "hlc_rifle_ak47", "", 100000, "true", ""},
      { "hlc_rifle_rpk74n", "", 40000, "true", ""},
      { "FHQ_arifle_ACR_blk", "", 200000, "true", ""},
      { "RH_M16A6", "", 200000, "true", ""},
      { "hlc_rifle_honeybadger", "", 250000, "true", ""},
      { "hlc_rifle_M14dmr_Rail", "", 250000, "true", ""},
      { "hlc_rifle_SG550Sniper_RIS", "", 200000, "true", ""}
    };

    magazines[] = {
      { "RH_30Rnd_68x43_FMJ", "", 500, "true", ""},
      { "hlc_5rnd_300WM_FMJ_AWM", "", 500, "true", ""},
      { "hlc_60Rnd_545x39_t_rpk", "", 600, "true", ""},
      { "hlc_30Rnd_762x39_b_ak", "", 200, "true", ""},
      { "FHQ_rem_30Rnd_680x43_ACR", "", 500, "true", ""},
      { "hlc_30Rnd_556x45_SOST_sg550", "", 500, "true", ""},
      { "RH_30Rnd_556x45_Mk262", "", 500, "true", ""},
      { "20Rnd_762x51_Mag", "", 500, "true", ""},
      { "29rnd_300BLK_STANAG", "", 500, "true", ""}
    };

    attachments[] = {
      { "optic_SOS", "", 20000, "true", ""},
      { "hlc_optic_kobra", "", 500, "true", ""},
      { "RH_ta31rmr_2D", "", 20000, "true", ""},
      { "RH_ta648", "", 20000, "true", ""},
      { "SMA_SFPEQ_M4TOP_BLK", "", 20000, "true", ""}
    };

    items[] = {
      { "RoleplayRadio", "Use this to communicate from distance", 150, "true", ""},
      { "Binocular", "Use these to see stuff at furthur distances", 250, "true", ""},
      { "ItemGPS", "Use this to not get lost", 500, "true", ""},
	  { "NVGoggles", "Use this to not get lost", 300, "true", ""},
      { "ItemMap", "Use this to find the local shops", 10, "true", ""},
      { "ItemCompass", "Use this to find directions", 10, "true", ""}
    };
  };

  class genstore {
    name = "Kamdan General Store";
    conditions = "";
    side = "civ";
    weapons[] = {
      { "TR8_Mining_Drill", "Used to mine more ore", 1000, "true", ""},
      { "Mr_Camera_News", "Used to record the news.", 1000, "true", ""},
      { "Mr_Micro_News", "Used to record audio.", 1000, "true", ""}
    };

    magazines[] = {
      { "10_TR8_Drill_Fuel", "Fuel for the drill", 100, "true", ""}
    };

    items[] = {
      { "RoleplayRadio", "Use this to communicate from distance", 150, "true", ""},
      { "Binocular", "Use these to see stuff at furthur distances", 250, "true", ""},
      { "ItemGPS", "Use this to not get lost", 500, "true", ""},
	  { "NVGoggles", "Use this to not get lost", 300, "true", ""},
      { "ItemMap", "Use this to find the local shops", 10, "true", ""},
      { "ItemCompass", "Use this to find directions", 10, "true", ""}
    };
  };

  class f_station_store {
    name = "Kamdan Fuel Station Store";
    conditions = "";
    side = "civ";
    items[] = {
      { "RoleplayRadio", "Use this to communicate from distance", 150, "true", ""},
      { "Binocular", "Use these to see stuff at furthur distances", 250, "true", ""},
      { "ItemGPS", "Use this to not get lost", 500, "true", ""},
	  { "NVGoggles", "Use this to not get lost", 300, "true", ""},
      { "ItemMap", "Use this to find the local shops", 10, "true", ""},
      { "ItemCompass", "Use this to find directions", 10, "true", ""}
    };
  };

  class med_basic {
    name = "Medic Shop";
    conditions = "call life_medicLevel >= 1";
    side = "med";
    items[] = {
      { "KA_TL_122_flashlight", "Use this to communicate from distance", 50, "call(life_medicLevel) >= 1", ""},
      { "A3MT_Police_Ohrstecker", "Use this to see in the dark", 50, "call(life_medicLevel) >= 1", ""},
      { "Medikit", "Use this to heal to full health", 50, "call(life_medicLevel) >= 1", ""},
      { "FirstAidKit", "Use this to heal players", 50, "call(life_medicLevel) >= 1", ""},
      { "Binocular", "Use this to communicate from distance", 50, "call(life_medicLevel) >= 1", ""},
      { "ItemGPS", "Use this to not get lost", 50, "call(life_medicLevel) >= 1", ""},
      { "ItemMap", "Use this to find the local shops", 10, "call(life_medicLevel) >= 1", ""},
      { "ItemCompass", "Use this to find directions", 10, "call(life_medicLevel) >= 1", ""}
    };
  };
};
