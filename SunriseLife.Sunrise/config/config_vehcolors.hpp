class LifeCfgVehMaterials {
	class glossy {
		material = "\Sunrise_material\data\glossy";
		displayName = "Глянцевый";
		conditions = "";
	};
	class metallic {
		material = "\Sunrise_material\data\metallic";
		displayName = "Металлик";
		conditions = "";
	};
	class matte {
		material = "\Sunrise_material\data\matte";
		displayName = "Матовый";
		conditions = "(call life_donator) > 0";
	};
	class chrome {
		material = "\Sunrise_material\data\chrome";
		displayName = "Хром";
		conditions = "(call life_donator) > 0";
	};	
};

class LifeCfgVehTextures {
	class custom {
		displayName = "Свой цвет";
		texture[] = {"#(argb,8,8,3)color(0,0,0,1,co)"};
	};
	class c_black {
		displayName = "Черный";
		texture[] = {"#(rgb,8,8,3)color(0,0,0,1)"};
	};
	class c_white {
		displayName = "Белый";
		texture[] = {"#(rgb,8,8,3)color(1,1,1,1)"};
	};
	class c_grey {
		displayName = "Серый";
		texture[] = {"#(rgb,8,8,3)color(0.5,0.5,0.5,1)"};
	};
	class c_red {
		displayName = "Красный";
		texture[] = {"#(rgb,8,8,3)color(0.9,0,0,1)"};
	};
	class c_east {
		displayName = "Темно-красный";
		texture[] = {"#(rgb,8,8,3)color(0.5,0,0,1)"};
	};
	class c_brown {
		displayName = "Коричневый";
		texture[] = {"#(rgb,8,8,3)color(0.5,0.25,0,1)"};
	};
	class c_orange {
		displayName = "Оранжевый";
		texture[] = {"#(rgb,8,8,3)color(0.85,0.4,0,1)"};
	};
	class c_yellow {
		displayName = "Желтый";
		texture[] = {"#(rgb,8,8,3)color(0.85,0.85,0,1)"};
	};
	class c_khaki {
		displayName = "Хаки";
		texture[] = {"#(rgb,8,8,3)color(0.5,0.6,0.4,1)"};
	};
	class c_green {
		displayName = "Зеленый";
		texture[] = {"#(rgb,8,8,3)color(0,0.8,0,1)"};
	};
	class c_guer {
		displayName = "Темно-зеленый";
		texture[] = {"#(rgb,8,8,3)color(0,0.5,0,1)"};
	};
	class c_blue {
		displayName = "Синий";
		texture[] = {"#(rgb,8,8,3)color(0,0,1,1)"};
	};
	class c_west {
		displayName = "Голубой";
		texture[] = {"#(rgb,8,8,3)color(0,0.3,0.6,1)"};
	};
	class c_pink {
		displayName = "Розовый";
		texture[] = {"#(rgb,8,8,3)color(1,0.3,0.4,1)"};
	};
	class c_civ {
		displayName = "Фиолетовый";
		texture[] = {"#(rgb,8,8,3)color(0.4,0,0.5,1)"};
	};
	class c_carbon {
		displayName = "Карбон";
		texture[] = {"Sunrise_material\coler\carbon.paa"};
	};
	
	
	
	//C_Offroad_01_F
	class ffrd_r {
		displayName = "Красный";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"};
	};
	class ffrd_y {
		displayName = "Желтый";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"};
	};
	class ffrd_w {
		displayName = "Белый";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"};
	};
	class ffrd_b {
		displayName = "Синий";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"};
	};
	class ffrd_br {
		displayName = "Темно-красный";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"};
	};
	class ffrd_bw {
		displayName = "Сине-белый";
		texture[] = {"\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"};
	};
	class ffrd_sb {
		displayName = "VIP Стикеры";
		texture[] = {"\sunrise_textures\vip1\offroad_blau_sickerbomb.paa"};
	};
	class ffrd_cop {
		displayName = "Полиция";
		texture[] = {"\sunrise_textures\police_offroad.paa"};
	};
	class rgb_cy {
		displayName = "Кислотно-желтый";
		texture[] = {"#(argb,8,8,3)color(0.6,0.3,0.01,1)"};
	};
	class ffrd_v1 {
		displayName = "VIP 1";
		texture[] = {"\sunrise_textures\vip\TRG_AMC_offroad1_ex.paa"};
	};
	class ffrd_ro {
		displayName = "Ржавчина";
		texture[] = {"\sunrise_textures\vip1\civ_offroad_rost.paa"};
	};
	class ffrd_bear {
		displayName = "Медведь";
		texture[] = {"\sunrise_textures\vip1\bear_offroad.paa"};
	};
	class ffrd_2l {
		displayName = "Две полоски";
		texture[] = {"\sunrise_textures\vip1\CIV_OFF1.paa"};
	};
	class ffrd_gv {
		displayName = "GTA V";
		texture[] = {"\sunrise_textures\vip2\offroad_gta5.paa"};
	};

	//B_Quadbike_01_F
	class qdbk_reb {
		displayName = "Зеленый камуфляж";
		texture[] = {"\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"};
	};
	class qdbk_b {
		displayName = "Черный";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"};
	};
	class qdbk_bl {
		displayName = "Синий";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"};
	};
	class qdbk_r {
		displayName = "Красный";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"};
	};
	class qdbk_w {
		displayName = "Белый";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"};
	};
	class qdbk_g {
		displayName = "Зеленый";
		texture[] = {"\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"};
	};
	class qdbk_cm {
		displayName = "Камуфляж";
		texture[] = {"\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"};
	};

	//C_SUV_01_F
	class suv_br {
		displayName = "Темно-красный";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"};
	};
	class suv_b {
		displayName = "Черный";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"};
	};
	class suv_s {
		displayName = "Серебряный";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"};
	};
	class suv_o {
		displayName = "Оранжевый";
		texture[] = {"\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"};
	};
	class suv_cop {
		displayName = "Полиция";
		texture[] = {"\sunrise_textures\police_suv.paa"};
	};
	class suv_vx6 {
		displayName = "VIP BMW X6";
		texture[] = {"\sunrise_textures\vip\X6_suv.paa"};
	};
	class suv_vd {
		displayName = "VIP пончики";
		texture[] = {"\sunrise_textures\vip\donut_suv_textures.paa"};
	};
	class suv_vnc {
		displayName = "VIP NyanCat";
		texture[] = {"\sunrise_textures\vip\nyan_suv.paa"};
	};
	class suv_vo {
		displayName = "VIP океан";
		texture[] = {"\sunrise_textures\vip1\suv_1.paa"};
	};
	class suv_vs {
		displayName = "VIP космос";
		texture[] = {"\sunrise_textures\vip1\suv_universe.paa"};
	};
	class suv_vpm {
		displayName = "VIP PacMan";
		texture[] = {"\sunrise_textures\vip1\suvPacMan.paa"};
	};
	class suv_vme {
		displayName = "VIP Monster Energy";
		texture[] = {"\sunrise_textures\vip1\suv_Monster_energy_block.paa"};
	};
	class suv_vgr {
		displayName = "VIP Ghostrider";
		texture[] = {"\sunrise_textures\vip1\suv_Ghostrider.paa"};
	};
	class suv_vsw {
		displayName = "VIP Star Wars";
		texture[] = {"\sunrise_textures\vip1\suv_starwarscar.paa"};
	};
	class suv_vcx {
		displayName = "VIP Comix";
		texture[] = {"\sunrise_textures\vip2\suv_comix.paa"};
	};
	class suv_vfs {
		displayName = "VIP Fire Skull";
		texture[] = {"\sunrise_textures\vip2\suv_fireskull.paa"};
	};
	class suv_vme2 {
		displayName = "VIP Monster Energy 2";
		texture[] = {"\sunrise_textures\vip2\suv_monsterenergy.paa"};
	};

	//C_Van_01_transport_F
	//C_Van_01_box_F
	class vtt_w {
		displayName = "Белый";
		texture[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"};
	};
	class vtt_r {
		displayName = "Красный";
		texture[] = {"\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"};
	};

	//O_MRAP_02_F 
	class mrp_og {
		displayName = "OMEGA";
		texture[] = {"\OMEGA\textures\veh\Ifrit_Front.paa","\OMEGA\textures\veh\Ifrit_Back.paa"};
	};
	
	//O_MRAP_02_hmg_F
	class mrp_g {
		displayName = "Зеленый";
		texture[] = {"a3\soft_f\MRAP_02\data\mrap_02_ext_01_co.paa","a3\soft_f\MRAP_02\data\mrap_02_ext_02_co.paa"};
	};
	class mrp_sba1 {
		displayName = "SBA1";
		texture[] = {"\sunrise_textures\ifrit\Ifrit_sba1_1.paa","\sunrise_textures\ifrit\Ifrit_sba1_2.paa"};
	};
	class mrp_sba2 {
		displayName = "SBA2";
		texture[] = {"\sunrise_textures\ifrit\Ifrit_sba2_1.paa","\sunrise_textures\ifrit\Ifrit_sba2_2.paa"};
	};	
	class mrp_med {
		displayName = "Медик";
		texture[] = {"\sunrise_textures\medic\ifrit_medic2_front.paa","\sunrise_textures\medic\ifrit_medic2_hinten.paa"};
	};
	class mrp_cg {
		displayName = "Гражданские банды";
		texture[] = {"\sunrise_textures\ifrit_civ_1.paa","\sunrise_textures\ifrit_civ_2.paa","\sunrise_textures\ifrit_civ_2.paa"};
	};
	class mrp_ur {
		displayName = "Urban";
		texture[] = {"\sunrise_textures\vip1\ifrit_urban_1.paa","\sunrise_textures\vip1\ifrit_urban_2.paa"};
	};
	class mrp_swat {
		displayName = "ЦСН'Альфа'";
		texture[] = {"\sunrise_textures\swat\swat_ifrit_0.paa","\sunrise_textures\swat\swat_ifrit_1.paa"};
	};
	class mrp_dea {
		displayName = "DEA";
		texture[] = {"\sunrise_veh_t\data\dea\dea_ifrit1.paa","\sunrise_veh_t\data\dea\dea_ifrit2.paa"};
	};

	//B_mas_HMMWV_UNA
	class hmmv_reb {
		displayName = "Повстанческий";
		texture[] = {"\mas_cars\hmmwv\data\hmmwv_body_co.paa"};
	};
	class hmmv_fed {
		displayName = "ЦСН'Альфа'/СВР";
		texture[] = {"\sunrise_textures\swat\HMMWV\hmmwv_body_co.paa"};
	};

	//B_Heli_Light_01_F

	//C_Heli_Light_01_civil_F
	class humm_tgr {
		displayName = "Tiger";
		texture[] = {"\sunrise_vehicles\data\sunrise_c_heli_light_01_civil_f_civ_2.paa"};
	};
	class humm_rnbw {
		displayName = "Rainbow";
		texture[] = {"\sunrise_vehicles\data\sunrise_c_heli_light_01_civil_f_civ_3.paa"};
	};
	class humm_plxe {
		displayName = "Plexi";
		texture[] = {"\sunrise_vehicles\data\sunrise_c_heli_light_01_civil_f_civ_4.paa"};
	};
	class humm_sky {
		displayName = "Sky";
		texture[] = {"\sunrise_vehicles\data\sunrise_c_heli_light_01_civil_f_civ_5.paa"};
	};		
	
	class humm_cop {
		displayName = "Полиция";
		texture[] = {"\sunrise_textures\police_heli.paa"};
	};
	class humm_cia {
		displayName = "СВР";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"};
	};
	class humm_dea {
		displayName = "DEA";
		texture[] = {"\sunrise_veh_t\data\dea\dea_humming.paa"};
	};
	class humm_bl {
		displayName = "Синий";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"};
	};
	class humm_r {
		displayName = "Красный";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"};
	};
	class humm_vme {
		displayName = "VIP Monster Energy";
		texture[] = {"\sunrise_textures\vip\limousine_sport_monster.paa"};
	};
	class humm_bln {
		displayName = "Синяя линия";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"};
	};
	class humm_llp {
		displayName = "Эллиптический";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"};
	};
	class humm_fr {
		displayName = "Яростный";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"};
	};
	class humm_bj {
		displayName = "Голубые джинсы";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"};
	};
	class humm_rl {
		displayName = "Красная лента";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"};
	};
	class humm_sn {
		displayName = "Закат";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"};
	};
	class humm_vrn {
		displayName = "Ворон";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"};
	};
	class humm_wv {
		displayName = "Голубые волны";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"};
	};
	class humm_reb {
		displayName = "Повстанческий";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"};
	};
	class humm_rg {
		displayName = "Повстанческая группировка";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"};
	};
	class humm_swt {
		displayName = "ЦСН'Альфа'";
		texture[] = {"\sunrise_PoliceN\Textures\Vehicles\FSBhumming.paa"};
	};
	class humm_gra {
		displayName = "Серый";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"};
	};
	class humm_lg {
		displayName = "Светлый";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"};
	};
	class humm_shd {
		displayName = "Тень";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"};
	};
	class humm_shr {
		displayName = "Шериф";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"};
	};
	class humm_wsp {
		displayName = "Оса";
		texture[] = {"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"};
	};
	class humm_tx {
		displayName = "Такси";
		texture[] = {"\sunrise_textures\taxi_heli.paa"};
	};

	//B_mas_UH1Y_UNA_F
	class uh1y_fed {
		displayName = "Полиция";
		texture[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
	};
	class uh1y_reb {
		displayName = "Группировки";
		texture[] = {"mas_eli\UH1Y\data\uh1y_ext_co.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};
	class uh1y_dea {
		displayName = "DEA";
		texture[] = {"\sunrise_veh_t\data\dea\dea_uh1y.paa","mas_eli\UH1Y\data\uh1y_int_co.paa"};
	};

	//I_Heli_light_03_unarmed_F
	class hllc_cia {
		displayName = "СВР";
		texture[] = {"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)"};
	};
	class hllc_g {
		displayName = "Зеленый";
		texture[] = {"\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_co.paa"};
	};
	class hllc_rg {
		displayName = "Повстанческая группировка";
		texture[] = {"\a3\air_f_epb\Heli_Light_03\Data\heli_light_03_base_indp_co.paa"};
	};
	class hllc_cop {
		displayName = "Полиция";
		texture[] = {"\sunrise_PoliceN\Textures\Vehicles\hellcatPolice.paa"};
	};

	//B_Heli_Transport_03_unarmed_F
	class hrn_fed {
		displayName = "Полиция/СВР";
		texture[] = {"\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext01_black_co.paa","\a3\air_f_heli\Heli_Transport_03\Data\heli_transport_03_ext02_black_co.paa"};
	};

	//I_Heli_Transport_02_F
	class hltt_bw {
		displayName = "Черно-белый";
		texture[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_ion_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_ion_co.paa"};
	};
	class hltt_gw {
		displayName = "Зелено-белый";
		texture[] = {"\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_1_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_2_dahoman_co.paa","\a3\air_f_beta\Heli_Transport_02\Data\Skins\heli_transport_02_3_dahoman_co.paa"};
	};
	class hltt_cia {
		displayName = "СВР";
		texture[] = {"#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"};
	};

	//ext_sab_boat
	class xsb_s {
		displayName = "Sailing";
		texture[] = {"\sab_boat\data\texture.paa"};
	};
	class xsb_f {
		displayName = "Fuel";
		texture[] = {"\sab_boat\data\texture2.paa"};
	};
	class xsb_v {
		displayName = "Vrana";
		texture[] = {"\sab_boat\data\texture3.paa"};
	};
	class xsb_r {
		displayName = "rosetone";
		texture[] = {"\sab_boat\data\texture4.paa"};
	};

	//B_APC_Wheeled_01_cannon_F
	class apcw_fed {
		displayName = "Полиция";
		texture[] = {"\sunrise_textures\swat\Marshal\m_swat_base.paa","\sunrise_textures\swat\Marshal\m_swat_ads.paa","\sunrise_textures\swat\Marshal\m_swat_tows.paa"};
	};
	class apcw_civ {
		displayName = "Стандарт";
		texture[] = {"\a3\armor_f_beta\APC_Wheeled_01\Data\apc_wheeled_01_base_co.paa"};
	};

	//O_Heli_Light_02_unarmed_F
	class orc_cia {
		displayName = "СВР";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"};
	};
	class orc_wb {
		displayName = "Бело-синий";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"};
	};
	class orc_cm {
		displayName = "Камуфляж";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"};
	};
	class orc_reb {
		displayName = "Повстанческий";
		texture[] = {"\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"};
	};
	class orc_cop {
		displayName = "Полиция";
		texture[] = {"\sunrise_textures\police_orca.paa"};
	};
    //B_MRAP_01_hmg_F
	class ohotnikP_sba {
		displayName = "СВР";
		texture[] = {"\sunrise_textures\ohotnik\sba_hunter_1_1.paa","\sunrise_textures\ohotnik\sba_hunter_1_2.paa","\sunrise_textures\ohotnik\sba_hunter_1_2.paa"};
	};
	//B_MRAP_01_F
	class bmrp_cia {
		displayName = "СВР";
		texture[] = {"\sunrise_textures\ohotnik\sba_hunter_1_1.paa","\sunrise_textures\ohotnik\sba_hunter_1_2.paa"};
	};
	class bmrp_sba {
		displayName = "СБА2";
		texture[] = {"\sunrise_textures\ohotnik\sba_hunter_2_1.paa","\sunrise_textures\ohotnik\sba_hunter_2_2.paa"};
	};	
	class bmrp_ds {
		displayName = "Пустыный";
		texture[] = {"\a3\soft_f\MRAP_01\Data\mrap_01_base_co.paa"};
	};

	//I_MRAP_03_hmg_F
	class strdh_cop {
		displayName = "Полиция";
		texture[] = {"\sunrise_textures\striders\strider_police.paa","\sunrise_textures\striders\strider_police.paa"};
	};
	
	//I_MRAP_03_F
	class strd_cop {
		displayName = "Полиция";
		texture[] = {"\sunrise_textures\striders\strider_police.paa"};
	};
	class strd_reb {
		displayName = "Повстанческий";
		texture[] = {"\a3\soft_F_beta\MRAP_03\Data\mrap_03_ext_indp_co.paa"};
	};
	class strd_wd {
		displayName = "Лес";
		texture[] = {"\sunrise_textures\striders\Wald\mrap_03_ext_wd1_co.paa"};
	};
	class strd_swt {
		displayName = "ЦСН'Альфа'";
		texture[] = {"\sunrise_PoliceN\Textures\Vehicles\Strider_alf.paa"};
	};
	class strd_med {
		displayName = "EMS";
		texture[] = {"\sunrise_textures\striders\strider_medic.paa"};
	};
	class strd_dea {
		displayName = "DEA";
		texture[] = {"\sunrise_veh_t\data\dea\dea_strider.paa"};
	};
	class strd_sba1 {
		displayName = "СВР";
		texture[] = {"\sunrise_textures\striders\strider_sba_1.paa"};
	};
	class strd_sba2 {
		displayName = "СВР 2";
		texture[] = {"\sunrise_textures\striders\strider_sba_2.paa"};
	};
	
	//B_Truck_01_fuel_CIV_F
	class tfc_def {
		displayName = "Стандарт";
		texture[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa","\A3\Soft_F_Gamma\Truck_01\Data\truck_01_Fuel_CO.paa"};
	};
	class tfc_bl {
		displayName = "Синий";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_blue.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_blue.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_03_blue.paa"};
	};
	class tfc_gs {
		displayName = "Газон";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_grass.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_grass.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_03_grass.paa"};
	};
	class tfc_mh {
		displayName = "Болотный";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_marsh.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_marsh.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_03_marsh.paa"};
	};
	class tfc_or {
		displayName = "Оранжевый";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_orange.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_orange.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_03_orange.paa"};
	};
	class tfc_pr {
		displayName = "Фиолетовый";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_purple.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_purple.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_03_purple.paa"};
	};
	class tfc_r {
		displayName = "Красный";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_red.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_red.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_03_red.paa"};
	};
	class tfc_y {
		displayName = "Желтый";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_yellow.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_yellow.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_03_yellow.paa"};
	};

	//B_Truck_01_box_CIV_F
	//B_Truck_01_mover_F
	class hmt_def {
		displayName = "Стандарт";
		texture[] = {"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa","\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa"};
	};
	class hmt_bl {
		displayName = "Синий";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_blue.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_blue.paa"};
	};
	class hmt_gs {
		displayName = "Газон";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_grass.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_grass.paa"};
	};
	class hmt_mh {
		displayName = "Болотный";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_marsh.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_marsh.paa"};
	};
	class hmt_or {
		displayName = "Оранжевый";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_orange.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_orange.paa"};
	};
	class hmt_pr {
		displayName = "Фиолетовый";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_purple.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_purple.paa"};
	};
	class hmt_r {
		displayName = "Красный";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_red.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_red.paa"};
	};
	class hmt_y {
		displayName = "Желтый";
		texture[] = {"\sunrise_vehicles\data\hemtt\truck_01_ext_01_yellow.paa","\sunrise_vehicles\data\hemtt\truck_01_ext_02_yellow.paa"};
	};

	//I_Truck_02_covered_F
	class itc_cm {
		displayName = "Камо";
		texture[] = {"\A3\soft_f_beta\Truck_02\Data\Truck_02_kab_INDP_co.paa","\A3\soft_f_beta\Truck_02\Data\Truck_02_kuz_INDP_co.paa"};
	};
	class itc_cia {
		displayName = "СВР";
		texture[] = {"#(argb,8,8,3)color(0.5,0.5,0.5,0.085)","#(argb,8,8,3)color(0.5,0.5,0.5,0.085)"};
	};

	//I_Truck_02_covered_CIV_F
	class itcc_or {
		displayName = "Оранжевый";
		texture[] = {"\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"};
	};
	class itcc_r {
		displayName = "Красный";
		texture[] = {"\sunrise_vehicles\data\zamak\zk_red_f.paa","\sunrise_vehicles\data\zamak\zk_red_t.paa"};
	};
	class itcc_s {
		displayName = "Небесный";
		texture[] = {"\sunrise_vehicles\data\zamak\zk_sky_f.paa","\sunrise_vehicles\data\zamak\zk_sky_t.paa"};
	};
	class itcc_w {
		displayName = "Белый";
		texture[] = {"\sunrise_vehicles\data\zamak\zk_white_f.paa","\sunrise_vehicles\data\zamak\zk_white_t.paa"};
	};
	class itcc_y {
		displayName = "Желтый";
		texture[] = {"\sunrise_vehicles\data\zamak\zk_yellow_f.paa","\sunrise_vehicles\data\zamak\zk_yellow_t.paa"};
	};

	//O_Heli_Transport_04_bench_F
	class htb_cia {
		displayName = "СВР";
		texture[] = {"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_bench_black_CO.paa"};
	};

	//shounka
	class white {
		displayName = "Белый";
		texture[] = {"shounka_a3_base\couleurs\blanc.paa"};
	};
	class red {
		displayName = "Красный";
		texture[] = {"shounka_a3_base\couleurs\rouge.paa"};
	};
	class dblue {
		displayName = "Тёмно-синий";
		texture[] = {"shounka_a3_base\couleurs\bleufonce.paa"};
	};
	class grey {
		displayName = "Серый";
		texture[] = {"shounka_a3_base\couleurs\gris.paa"};
	};
	class yelow {
		displayName = "Желтый";
		texture[] = {"shounka_a3_base\couleurs\jaune.paa"};
	};
	class noir {
		displayName = "Тёмно-коричневый";
		texture[] = {"shounka_a3_base\couleurs\noir.paa"};
	};
	class orange {
		displayName = "Оранжевый";
		texture[] = {"shounka_a3_base\couleurs\orange.paa"};
	};
	class rose {
		displayName = "Розовый";
		texture[] = {"shounka_a3_base\couleurs\rose.paa"};
	};
	class fiol {
		displayName = "Фиолетовый";
		texture[] = {"shounka_a3_base\couleurs\violet.paa"};
	};
	class blue {
		displayName = "Синий";
		texture[] = {"shounka_a3_base\couleurs\bleu.paa"};
	};
	class dred {
		displayName = "Тёмно-красный";
		texture[] = {"shounka_a3_base\couleurs\rougefonce.paa"};
	};
	class green {
		displayName = "Зеленый";
		texture[] = {"shounka_a3_base\couleurs\vert.paa"};
	};
	class dgreen {
		displayName = "Тёмно-зеленый";
		texture[] = {"shounka_a3_base\couleurs\vertfonce.paa"};
	};
	class black {
		displayName = "Чёрный";
		texture[] = {"#(argb,8,8,3)color(0.02,0.02,0.02,1.0,co)"};
	};
	class shnk_bT {
		displayName = "Чёрный (Тонировка)";
		texture[] = {"#(argb,8,8,3)color(0.02,0.02,0.02,1.0,co)","","dkp_gelik_sa\mercedes_g65amg_hq\quiet_vitre_rv\quiet_vitre_toned_full.paa"};
	};
	class shnk_vr {
		displayName = "Красный Sunrise rally";
		texture[] = {"shounka_a3_base\couleurs\sport_r.paa"};
	};
	class shnk_vg {
		displayName = "Зеленый Sunrise rally";
		texture[] = {"shounka_a3_base\couleurs\sport_g.paa"};
	};
	class shnk_vbl {
		displayName = "Синий Sunrise rally";
		texture[] = {"shounka_a3_base\couleurs\sport_b.paa"};
	};
	class shnk_vfc {
		displayName = "Sunrise forest camo";
		texture[] = {"shounka_a3_base\couleurs\forest_camo.paa"};
	};
	class shnk_vuc {
		displayName = "Sunrise urban camo";
		texture[] = {"shounka_a3_base\couleurs\urban_camo.paa"};
	};
	class shnk_vdc {
		displayName = "Sunrise desert camo";
		texture[] = {"shounka_a3_base\couleurs\desert_camo.paa"};
	};

	//C_Offroad_02_unarmed_F
	class codu_w {
		displayName = "Белый";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_white_co.paa"};
	};
	class codu_r {
		displayName = "Красный";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_red_co.paa"};
	};
	class codu_o {
		displayName = "Оранжевый";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_orange_co.paa"};
	};
	class codu_bl {
		displayName = "Синий";
		texture[] = {"a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_ext_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa","a3\soft_f_exp\offroad_02\data\offroad_02_int_blue_co.paa"};
	};

	//C_Plane_Civil_01_F
	class cpc_wbl {
		displayName = "Бело-синий";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_wave_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_wave_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};
	class cpc_bly {
		displayName = "Сине-желтый";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_racer_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_racer_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};
	class cpc_gw {
		displayName = "Зелено-белый";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_tribal_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_tribal_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};
	class cpc_r {
		displayName = "Красный";
		texture[] = {"a3\air_f_exp\plane_civil_01\data\btt_ext_01_redline_co.paa","a3\air_f_exp\plane_civil_01\data\btt_ext_02_redline_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_01_co.paa","a3\air_f_exp\plane_civil_01\data\btt_int_02_co.paa"};
	};

	//custom
	class cxc_1 {
		displayName = "2017 Aliceblue";
		texture[] = {"\sunrise_veh_t\data\colors\aliceblue.paa"};
	};
	class cxc_2 {
		displayName = "2017 Banana";
		texture[] = {"\sunrise_veh_t\data\colors\banana.paa"};
	};
	class cxc_3 {
		displayName = "2017 Blueviolet";
		texture[] = {"\sunrise_veh_t\data\colors\blueviolet.paa"};
	};
	class cxc_4 {
		displayName = "2017 Brick";
		texture[] = {"\sunrise_veh_t\data\colors\brick.paa"};
	};
	class cxc_5 {
		displayName = "2017 Brown";
		texture[] = {"\sunrise_veh_t\data\colors\brown.paa"};
	};
	class cxc_6 {
		displayName = "2017 Burlywood";
		texture[] = {"\sunrise_veh_t\data\colors\burlywood.paa"};
	};
	class cxc_7 {
		displayName = "2017 Cadmiumorange";
		texture[] = {"\sunrise_veh_t\data\colors\cadmiumorange.paa"};
	};
	class cxc_8 {
		displayName = "2017 Cadmiumyellow";
		texture[] = {"\sunrise_veh_t\data\colors\cadmiumyellow.paa"};
	};
	class cxc_9 {
		displayName = "2017 Carrot";
		texture[] = {"\sunrise_veh_t\data\colors\carrot.paa"};
	};
	class cxc_10 {
		displayName = "2017 Chocolate";
		texture[] = {"\sunrise_veh_t\data\colors\chocolate.paa"};
	};
	class cxc_11 {
		displayName = "2017 Cobalt";
		texture[] = {"\sunrise_veh_t\data\colors\cobalt.paa"};
	};
	class cxc_12 {
		displayName = "2017 Coldgrey";
		texture[] = {"\sunrise_veh_t\data\colors\coldgrey.paa"};
	};
	class cxc_13 {
		displayName = "2017 Coral";
		texture[] = {"\sunrise_veh_t\data\colors\coral.paa"};
	};
	class cxc_14 {
		displayName = "2017 Cyan";
		texture[] = {"\sunrise_veh_t\data\colors\cyan.paa"};
	};
	class cxc_15 {
		displayName = "2017 Darkseagreen";
		texture[] = {"\sunrise_veh_t\data\colors\darkseagreen.paa"};
	};
	class cxc_16 {
		displayName = "2017 Darkslateblue";
		texture[] = {"\sunrise_veh_t\data\colors\darkslateblue.paa"};
	};
	class cxc_17 {
		displayName = "2017 Darkturquoise";
		texture[] = {"\sunrise_veh_t\data\colors\darkturquoise.paa"};
	};
	class cxc_18 {
		displayName = "2017 Darkviolet";
		texture[] = {"\sunrise_veh_t\data\colors\darkviolet.paa"};
	};
	class cxc_19 {
		displayName = "2017 Dodgerblue";
		texture[] = {"\sunrise_veh_t\data\colors\dodgerblue.paa"};
	};
	class cxc_20 {
		displayName = "2017 Emeraldgreen";
		texture[] = {"\sunrise_veh_t\data\colors\emeraldgreen.paa"};
	};
	class cxc_21 {
		displayName = "2017 Flesh";
		texture[] = {"\sunrise_veh_t\data\colors\flesh.paa"};
	};
	class cxc_22 {
		displayName = "2017 Ghostwhite";
		texture[] = {"\sunrise_veh_t\data\colors\ghostwhite.paa"};
	};
	class cxc_23 {
		displayName = "2017 Gold";
		texture[] = {"\sunrise_veh_t\data\colors\gold.paa"};
	};
	class cxc_24 {
		displayName = "2017 Goldenrod";
		texture[] = {"\sunrise_veh_t\data\colors\goldenrod.paa"};
	};
	class cxc_25 {
		displayName = "2017 Indigo";
		texture[] = {"\sunrise_veh_t\data\colors\indigo.paa"};
	};
	class cxc_26 {
		displayName = "2017 Khaki";
		texture[] = {"\sunrise_veh_t\data\colors\khaki.paa"};
	};
	class cxc_27 {
		displayName = "2017 Lightskyblue";
		texture[] = {"\sunrise_veh_t\data\colors\lightskyblue.paa"};
	};
	class cxc_28 {
		displayName = "2017 Limegreen";
		texture[] = {"\sunrise_veh_t\data\colors\limegreen.paa"};
	};
	class cxc_29 {
		displayName = "2017 Melon";
		texture[] = {"\sunrise_veh_t\data\colors\melon.paa"};
	};
	class cxc_30 {
		displayName = "2017 Moccasin";
		texture[] = {"\sunrise_veh_t\data\colors\moccasin.paa"};
	};
	class cxc_31 {
		displayName = "2017 Olive";
		texture[] = {"\sunrise_veh_t\data\colors\olive.paa"};
	};
	class cxc_32 {
		displayName = "2017 Olivedrab";
		texture[] = {"\sunrise_veh_t\data\colors\olivedrab.paa"};
	};
	class cxc_33 {
		displayName = "2017 Orange";
		texture[] = {"\sunrise_veh_t\data\colors\orange.paa"};
	};
	class cxc_34 {
		displayName = "2017 Peacock";
		texture[] = {"\sunrise_veh_t\data\colors\peacock.paa"};
	};
	class cxc_35 {
		displayName = "2017 Purple";
		texture[] = {"\sunrise_veh_t\data\colors\purple.paa"};
	};
	class cxc_36 {
		displayName = "2017 Royalblue";
		texture[] = {"\sunrise_veh_t\data\colors\royalblue.paa"};
	};
	class cxc_37 {
		displayName = "2017 Saddlebrown";
		texture[] = {"\sunrise_veh_t\data\colors\saddlebrown.paa"};
	};
	class cxc_38 {
		displayName = "2017 Sepia";
		texture[] = {"\sunrise_veh_t\data\colors\sepia.paa"};
	};
	class cxc_39 {
		displayName = "2017 Slateblue";
		texture[] = {"\sunrise_veh_t\data\colors\slateblue.paa"};
	};
	class cxc_40 {
		displayName = "2017 Slategray";
		texture[] = {"\sunrise_veh_t\data\colors\slategray.paa"};
	};
	class cxc_41 {
		displayName = "2017 Steelblue";
		texture[] = {"\sunrise_veh_t\data\colors\steelblue.paa"};
	};
	class cxc_42 {
		displayName = "2017 Tan";
		texture[] = {"\sunrise_veh_t\data\colors\tan.paa"};
	};
	class cxc_43 {
		displayName = "2017 Teal";
		texture[] = {"\sunrise_veh_t\data\colors\teal.paa"};
	};
	class cxc_44 {
		displayName = "2017 Tomato";
		texture[] = {"\sunrise_veh_t\data\colors\tomato.paa"};
	};
	class cxc_45 {
		displayName = "2017 Turquoiseblue";
		texture[] = {"\sunrise_veh_t\data\colors\turquoiseblue.paa"};
	};
	
	// D3S Cars 
	//d3s_fpace_17_r
	class fpace1 {
		displayName = "White";
		texture[] = {"d3s_fpace_17\data\skins\F_AO_co.paa"};
	};
	class fpace2 {
		displayName = "Polaris White";
		texture[] = {"d3s_fpace_17\data\skins\F_Polaris_White.paa"};
    };
	class fpace3 {
		displayName = "Ingot";
		texture[] = {"d3s_fpace_17\data\skins\F_Ingot.paa"};
    };
	class fpace4 {
		displayName = "Osmium Blue";
		texture[] = {"d3s_fpace_17\data\skins\F_Osmium_Blue.paa"};
    };
	class fpace5 {
		displayName = "Rhodium Silver";
		texture[] = {"d3s_fpace_17\data\skins\F_Rhodium_Silver.paa"};
    };
	class fpace6 {
		displayName = "Quartzite";
		texture[] = {"d3s_fpace_17\data\skins\F_Quartzite.paa"};
    };
	class fpace7 {
		displayName = "Tempest Grey";
		texture[] = {"d3s_fpace_17\data\skins\F_Tempest_Grey.paa"};
    };
	class fpace8 {
		displayName = "Ammonite Grey";
		texture[] = {"d3s_fpace_17\data\skins\F_Ammonite_Grey.paa"};
    };
	class fpace9 {
		displayName = "Italian Racing Red";
		texture[] = {"d3s_fpace_17\data\skins\F_Italian_Racing_Red.paa"};
    };
	class fpace10 {
		displayName = "Odyssey Red";
		texture[] = {"d3s_fpace_17\data\skins\F_Odyssey_Red.paa"};
    };
	class fpace11 {
		displayName = "Bluefire";
		texture[] = {"d3s_fpace_17\data\skins\F_Bluefire.paa"};
    };
	class fpace12 {
		displayName = "dark Sapphire";
		texture[] = {"d3s_fpace_17\data\skins\F_Dark_Sapphire.paa"};
    };
	class fpace13 {
		displayName = "Celestian_Black";
		texture[] = {"d3s_fpace_17\data\skins\F_Celestian_Black.paa"};
    };
	class fpace14 {
		displayName = "British Racing Green";
		texture[] = {"d3s_fpace_17\data\skins\F_British_Racing_Green.paa"};
    };
	class fpace15 {
		displayName = "Storm Grey";
		texture[] = {"d3s_fpace_17\data\skins\F_Storm_Grey.paa"};
    };
	class fpace16 {
		displayName = "Black Cherry";
		texture[] = {"d3s_fpace_17\data\skins\F_Black_Cherry.paa"};
    };
	class fpace17 {
		displayName = "Ultimate Black";
		texture[] = {"d3s_fpace_17\data\skins\F_Ultimate_Black.paa"};
	};
	//d3s_fpace_17_fe
	class fpacefe1 {
		displayName = "White";
		texture[] = {"d3s_fpace_17\data\skins\FS_AO_co.paa"};
	};
	class fpacefe2 {
		displayName = "Yellow";
		texture[] = {"d3s_fpace_17\data\skins\FS_Yellow.paa"};
    };
	class fpacefe3 {
		displayName = "Orange";
		texture[] = {"d3s_fpace_17\data\skins\FS_Orange.paa"};
    };
	class fpacefe4 {
		displayName = "Green";
		texture[] = {"d3s_fpace_17\data\skins\FS_Green.paa"};
    };
	class fpacefe5 {
		displayName = "Pearl";
		texture[] = {"d3s_fpace_17\data\skins\FS_Pearl.paa"};
    };
	class fpacefe6 {
		displayName = "Rocks";
		texture[] = {"d3s_fpace_17\data\skins\FS_Rocks.paa"};
    };
	class fpacefe7 {
		displayName = "Ocean";
		texture[] = {"d3s_fpace_17\data\skins\FS_Ocean.paa"};
    };
	class fpacefe8 {
		displayName = "Blue";
		texture[] = {"d3s_fpace_17\data\skins\FS_Blue.paa"};
    };
	class fpacefe9 {
		displayName = "Violette";
		texture[] = {"d3s_fpace_17\data\skins\FS_Violette.paa"};
    };
	class fpacefe10 {
		displayName = "Pink";
		texture[] = {"d3s_fpace_17\data\skins\FS_Pink.paa"};
    };
	class fpacefe11 {
		displayName = "Red";
		texture[] = {"d3s_fpace_17\data\skins\FS_Red.paa"};
    };
	class fpacefe12 {
		displayName = "Dark Red";
		texture[] = {"d3s_fpace_17\data\skins\FS_Dark_Red.paa"};
    };
	//d3s_vklasse_17
    class vklasse1 {
		displayName = "Arctic White";
		texture[] = {"d3s_vklasse_17\data\skins\Arctic_White.paa"};
	};
	class vklasse2 {
		displayName = "Brilliant Silver";
		texture[] = {"d3s_vklasse_17\data\skins\Brilliant_Silver.paa"};
    };
	class vklasse3 {
		displayName = "Cavansit Blue";
		texture[] = {"d3s_vklasse_17\data\skins\Cavansit_Blue.paa"};
    };
	class vklasse4 {
		displayName = "Dolomit Brown";
		texture[] = {"d3s_vklasse_17\data\skins\Dolomit_Brown.paa"};
    };
	class vklasse5 {
		displayName = "Flint Gray";
		texture[] = {"d3s_vklasse_17\data\skins\Flint_Gray.paa"};
    };
	class vklasse6 {
		displayName = "Granite Green";
		texture[] = {"d3s_vklasse_17\data\skins\Granite_Green.paa"};
    };
	class vklasse7 {
		displayName = "Indium Gray";
		texture[] = {"d3s_vklasse_17\data\skins\Indium_Gray.paa"};
    };
	class vklasse8 {
		displayName = "Jupiter Red";
		texture[] = {"d3s_vklasse_17\data\skins\Jupiter_Red.paa"};
    };
	class vklasse9 {
		displayName = "Navy Blue";
		texture[] = {"d3s_vklasse_17\data\skins\Navy_Blue.paa"};
    };
	class vklasse10 {
		displayName = "Obsidiant Black";
		texture[] = {"d3s_vklasse_17\data\skins\Obsidiant_Black.paa"};
    };
	class vklasse11 {
		displayName = "Pebble Gray";
		texture[] = {"d3s_vklasse_17\data\skins\Pebble_Gray.paa"};
    };
    //d3s_ctsv_16
    class ctsv1 {
		displayName = "Individual";
		texture[] = {"d3s_ctsv_16\data_18\skins\ctsv_individual.paa"};
	};
	class ctsv2 {
		displayName = "White";
		texture[] = {"d3s_ctsv_16\data_18\skins\CTSV_AO_co.paa"};
    };
	class ctsv3 {
		displayName = "Latte";
		texture[] = {"d3s_ctsv_16\data_18\skins\CTS_AO_latte_co.paa"};
    };
	class ctsv4 {
		displayName = "Silver";
		texture[] = {"d3s_ctsv_16\data_18\skins\CTS_AO_silver_co.paa"};
    };
	class ctsv5 {
		displayName = "Red";
		texture[] = {"d3s_ctsv_16\data_18\skins\CTS_AO_red_co.paa"};
    };
	class ctsv6 {
		displayName = "Blue";
		texture[] = {"d3s_ctsv_16\data_18\skins\CTS_AO_blue_co.paa"};
    };
	class ctsv7 {
		displayName = "Black";
		texture[] = {"d3s_ctsv_16\data_18\skins\CTS_AO_black_co.paa"};
    };
	//d3s_boss_15
    class d3boss1 {
		displayName = "1";
		texture[] = {"d3s_boss_15\data\skins\01.paa"};
	};
    class d3boss2 {
		displayName = "2";
		texture[] = {"d3s_boss_15\data\skins\02.paa"};
	};
	class d3boss3 {
		displayName = "3";
		texture[] = {"d3s_boss_15\data\skins\03.paa"};
	};
	class d3boss4 {
		displayName = "4";
		texture[] = {"d3s_boss_15\data\skins\04.paa"};
	};
	class d3boss5 {
		displayName = "5";
		texture[] = {"d3s_boss_15\data\skins\05.paa"};
	};
	class d3boss6 {
		displayName = "6";
		texture[] = {"d3s_boss_15\data\skins\06.paa"};
	};
	class d3boss7 {
		displayName = "7";
		texture[] = {"d3s_boss_15\data\skins\07.paa"};
	};
	class d3boss8 {
		displayName = "8";
		texture[] = {"d3s_boss_15\data\skins\08.paa"};
	};
	class d3boss9 {
		displayName = "9";
		texture[] = {"d3s_boss_15\data\skins\09.paa"};
	};
	class d3boss10 {
		displayName = "10";
		texture[] = {"d3s_boss_15\data\skins\10.paa"};
	};
	class d3boss11 {
		displayName = "11";
		texture[] = {"d3s_boss_15\data\skins\11.paa"};
	};
	class d3boss12 {
		displayName = "12";
		texture[] = {"d3s_boss_15\data\skins\12.paa"};
	};
	class d3boss13 {
		displayName = "13";
		texture[] = {"d3s_boss_15\data\skins\13.paa"};
	};
	class d3boss14 {
		displayName = "14";
		texture[] = {"d3s_boss_15\data\skins\14.paa"};
	};
	class d3boss15 {
		displayName = "15";
		texture[] = {"d3s_boss_15\data\skins\15.paa"};
	};
	class d3boss16 {
		displayName = "16";
		texture[] = {"d3s_boss_15\data\skins\16.paa"};
	};
	class d3boss17 {
		displayName = "17";
		texture[] = {"d3s_boss_15\data\skins\17.paa"};
	};
	class d3boss18 {
		displayName = "18";
		texture[] = {"d3s_boss_15\data\skins\18.paa"};
	};
	class d3boss19 {
		displayName = "19";
		texture[] = {"d3s_boss_15\data\skins\19.paa"};
	};
	class d3boss20 {
		displayName = "20";
		texture[] = {"d3s_boss_15\data\skins\20.paa"};
	};
	class d3boss21 {
		displayName = "21";
		texture[] = {"d3s_boss_15\data\skins\21.paa"};
	};
	class d3boss22 {
		displayName = "22";
		texture[] = {"d3s_boss_15\data\skins\22.paa"};
	};
	class d3boss23 {
		displayName = "23";
		texture[] = {"d3s_boss_15\data\skins\23.paa"};
	};
	class d3boss24 {
		displayName = "24";
		texture[] = {"d3s_boss_15\data\skins\24.paa"};
	};
	class d3boss25 {
		displayName = "25";
		texture[] = {"d3s_boss_15\data\skins\25.paa"};
	};
	class d3boss26 {
		displayName = "26";
		texture[] = {"d3s_boss_15\data\skins\26.paa"};
	};
	class d3boss27 {
		displayName = "27";
		texture[] = {"d3s_boss_15\data\skins\27.paa"};
	};
	class d3boss28 {
		displayName = "28";
		texture[] = {"d3s_boss_15\data\skins\28.paa"};
	};
	class d3boss29 {
		displayName = "29";
		texture[] = {"d3s_boss_15\data\skins\29.paa"};
	};
	class d3boss30 {
		displayName = "30";
		texture[] = {"d3s_boss_15\data\skins\30.paa"};
	};
	class d3boss31 {
		displayName = "31";
		texture[] = {"d3s_boss_15\data\skins\31.paa"};
	};
	class d3boss32 {
		displayName = "32";
		texture[] = {"d3s_boss_15\data\skins\32.paa"};
	};
	class d3boss33 {
		displayName = "33";
		texture[] = {"d3s_boss_15\data\skins\33.paa"};
	};
	class d3boss34 {
		displayName = "34";
		texture[] = {"d3s_boss_15\data\skins\34.paa"};
	};
	class d3boss35 {
		displayName = "35";
		texture[] = {"d3s_boss_15\data\skins\35.paa"};
	};
	class d3boss36 {
		displayName = "36";
		texture[] = {"d3s_boss_15\data\skins\36.paa"};
	};
	class d3boss37 {
		displayName = "37";
		texture[] = {"d3s_boss_15\data\skins\37.paa"};
	};
	class d3boss38 {
		displayName = "38";
		texture[] = {"d3s_boss_15\data\skins\38.paa"};
	};
	class d3boss39 {
		displayName = "39";
		texture[] = {"d3s_boss_15\data\skins\39.paa"};
	};
	class d3boss40 {
		displayName = "40";
		texture[] = {"d3s_boss_15\data\skins\40.paa"};
	};
	class d3boss41 {
		displayName = "41";
		texture[] = {"d3s_boss_15\data\skins\41.paa"};
	};
	class d3boss42 {
		displayName = "42";
		texture[] = {"d3s_boss_15\data\skins\42.paa"};
	};
	class d3boss43 {
		displayName = "43";
		texture[] = {"d3s_boss_15\data\skins\43.paa"};
	};
	class d3boss44 {
		displayName = "44";
		texture[] = {"d3s_boss_15\data\skins\44.paa"};
	};
	class d3boss45 {
		displayName = "45";
		texture[] = {"d3s_boss_15\data\skins\45.paa"};
	};
	class d3boss46 {
		displayName = "46";
		texture[] = {"d3s_boss_15\data\skins\46.paa"};
	};
	class d3boss47 {
		displayName = "47";
		texture[] = {"d3s_boss_15\data\skins\47.paa"};
	};
	class d3boss48 {
		displayName = "48";
		texture[] = {"d3s_boss_15\data\skins\48.paa"};
	};
	class d3boss49 {
		displayName = "49";
		texture[] = {"d3s_boss_15\data\skins\49.paa"};
	};
	class d3boss50 {
		displayName = "50";
		texture[] = {"d3s_boss_15\data\skins\50.paa"};
	};
	class d3boss51 {
		displayName = "51";
		texture[] = {"d3s_boss_15\data\skins\51.paa"};
	};
	class d3boss52 {
		displayName = "52";
		texture[] = {"d3s_boss_15\data\skins\52.paa"};
	};
	class d3boss53 {
		displayName = "53";
		texture[] = {"d3s_boss_15\data\skins\53.paa"};
	};
	class d3boss54 {
		displayName = "54";
		texture[] = {"d3s_boss_15\data\skins\54.paa"};
	};
	class d3boss55 {
		displayName = "55";
		texture[] = {"d3s_boss_15\data\skins\55.paa"};
	};
    //d3s_g850_17
    class g8501 {
		displayName = "White";
		texture[] = {"d3s_g65amg_16\data\skins\G850_AO_co.paa"};
	};
	class g8502 {
		displayName = "Citrin Brown";
		texture[] = {"d3s_g65amg_16\data\skins\G850_Citrin_Brown.paa"};
    };
	class g8503 {
		displayName = "Hyacinth Red";
		texture[] = {"d3s_g65amg_16\data\skins\G850_Hyacinth_Red.paa"};
    };
	class g8504 {
		displayName = "Obsidian Black";
		texture[] = {"d3s_g65amg_16\data\skins\G850_Obsidian_Black.paa"};
    };
	class g8505 {
		displayName = "Tansanite Blue";
		texture[] = {"d3s_g65amg_16\data\skins\G850_Tansanite_Blue.paa"};
    };
	class g8506 {
		displayName = "TenoriteGrey";
		texture[] = {"d3s_g65amg_16\data\skins\G850_Tenorite_Grey.paa"};
    };
	
	//d3s_focus_17
    class focus_17_1 {
		displayName = "White";
		texture[] = {"d3s_focus_17\data\skins\Focus_AO_co.paa"};
	};
	class focus_17_2 {
		displayName = "Blazer Blue";
		texture[] = {"d3s_focus_17\data\skins\Focus_Blazer_Blue.paa"};
    };
	class focus_17_3 {
		displayName = "Blue Wave";
		texture[] = {"d3s_focus_17\data\skins\Focus_Blue_Wave.paa"};
    };
	class focus_17_4 {
		displayName = "Bohai Bay Mint";
		texture[] = {"d3s_focus_17\data\skins\Focus_Bohai_Bay_Mint.paa"};
    };
	class focus_17_5 {
		displayName = "Deep Impact Blue";
		texture[] = {"d3s_focus_17\data\skins\Focus_Deep_Impact_Blue.paa"};
    };
	class focus_17_6 {
		displayName = "Indic Blue";
		texture[] = {"d3s_focus_17\data\skins\Focus_Indic_Blue.paa"};
    };
	class focus_17_7 {
		displayName = "Iridium Black";
		texture[] = {"d3s_focus_17\data\skins\Focus_Iridium_Black.paa"};
    };
	class focus_17_8 {
		displayName = "Magnetic";
		texture[] = {"d3s_focus_17\data\skins\Focus_Magnetic.paa"};
    };
	class focus_17_9 {
		displayName = "Magnetic Grey";
		texture[] = {"d3s_focus_17\data\skins\Focus_Magnetic_Grey.paa"};
    };
	class focus_17_10 {
		displayName = "Moondust Silver";
		texture[] = {"d3s_focus_17\data\skins\Focus_Moondust_Silver.paa"};
    };
	class focus_17_11 {
		displayName = "Race Red";
		texture[] = {"d3s_focus_17\data\skins\Focus_Race_Red.paa"};
    };
	class focus_17_12 {
		displayName = "Ruby Red";
		texture[] = {"d3s_focus_17\data\skins\Focus_Ruby_Red.paa"};
    };
	class focus_17_13 {
		displayName = "Shadow Black";
		texture[] = {"d3s_focus_17\data\skins\Focus_Shadow_Black.paa"};
    };
	//d3s_focus_14
    class focus_14_1 {
		displayName = "White";
		texture[] = {"d3s_focus_14\data\skins\ST_AO_co.paa"};
	};
	class focus_14_2 {
		displayName = "Blazer Blue";
		texture[] = {"d3s_focus_14\data\skins\ST_Blazer_Blue.paa"};
    };
	class focus_14_3 {
		displayName = "Blue Wave";
		texture[] = {"d3s_focus_14\data\skins\ST_Blue_Wave.paa"};
    };
	class focus_14_4 {
		displayName = "Bohai Bay Mint";
		texture[] = {"d3s_focus_14\data\skins\ST_Bohai_Bay_Mint.paa"};
    };
	class focus_14_5 {
		displayName = "Deep Impact Blue";
		texture[] = {"d3s_focus_14\data\skins\ST_Deep_Impact_Blue.paa"};
    };
	class focus_14_6 {
		displayName = "Indic Blue";
		texture[] = {"d3s_focus_14\data\skins\ST_Indic_Blue.paa"};
    };
	class focus_14_7 {
		displayName = "Iridium Black";
		texture[] = {"d3s_focus_14\data\skins\ST_Iridium_Black.paa"};
    };
	class focus_14_8 {
		displayName = "Magnetic";
		texture[] = {"d3s_focus_14\data\skins\ST_Magnetic.paa"};
    };
	class focus_14_9 {
		displayName = "Magnetic Grey";
		texture[] = {"d3s_focus_14\data\skins\ST_Magnetic_Grey.paa"};
    };
	class focus_14_10 {
		displayName = "Moondust Silver";
		texture[] = {"d3s_focus_14\data\skins\ST_Moondust_Silver.paa"};
    };
	class focus_14_11 {
		displayName = "Race Red";
		texture[] = {"d3s_focus_14\data\skins\ST_Race_Red.paa"};
    };
	class focus_14_12 {
		displayName = "Ruby Red";
		texture[] = {"d3s_focus_14\data\skins\ST_Ruby_Red.paa"};
    };
	class focus_14_13 {
		displayName = "Shadow Black";
		texture[] = {"d3s_focus_14\data\skins\ST_Shadow_Black.paa"};
    };
	
	//d3s_maz_6317
	class maz_white {
		displayName = "Белый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_AO_co.paa"};
	};
	class maz_blue {
		displayName = "Синий";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Blue.paa"};
	};
	class maz_green {
		displayName = "Зелёный";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Green.paa"};
	};
	class maz_khaki {
		displayName = "Хаки";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Khaki.paa"};
	};
	class maz_orange {
		displayName = "Оранжевый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Orange.paa"};
	};
	class maz_red {
		displayName = "Красный";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Red.paa"};
	};
	class maz_violet {
		displayName = "Фиолтеовый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Violet.paa"};
	};
	class maz_yellow {
		displayName = "Желтый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Yellow.paa"};
	};
	class maz_camo1 {
		displayName = "Camo1";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo1.paa"};
	};
	class maz_camo2 {
		displayName = "Camo2";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo2.paa"};
	};
	class maz_camo3 {
		displayName = "Camo3";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo3.paa"};
	};
	class maz_camo4 {
		displayName = "Camo4";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo4.paa"};
	};
	class maz_camo5 {
		displayName = "Camo5";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo5.paa"};
	};
	class maz_camo6 {
		displayName = "Camo6";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo6.paa"};
	};
	class maz_camo7 {
		displayName = "Camo7";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo7.paa"};
	};
	
	//d3s_maz_6317_tent
	class mazt_white {
		displayName = "Белый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_AO_co.paa"};
	};
	class mazt_blue {
		displayName = "Синий";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Blue.paa"};
	};
	class mazt_green {
		displayName = "Зелёный";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Green.paa"};
	};
	class mazt_khaki {
		displayName = "Хаки";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Khaki.paa"};
	};
	class mazt_orange {
		displayName = "Оранжевый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Orange.paa"};
	};
	class mazt_red {
		displayName = "Красный";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Red.paa"};
	};
	class mazt_violet {
		displayName = "Фиолтеовый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Violet.paa"};
	};
	class mazt_yellow {
		displayName = "Желтый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Yellow.paa"};
	};
	class mazt_camo1 {
		displayName = "Camo1";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo1.paa"};
	};
	class mazt_camo2 {
		displayName = "Camo2";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo2.paa"};
	};
	class mazt_camo3 {
		displayName = "Camo3";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo3.paa"};
	};
	class mazt_camo4 {
		displayName = "Camo4";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo4.paa"};
	};
	class mazt_camo5 {
		displayName = "Camo5";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo5.paa"};
	};
	class mazt_camo6 {
		displayName = "Camo6";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo6.paa"};
	};
	class mazt_camo7 {
		displayName = "Camo7";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo7.paa"};
	};
	
	//d3s_maz_6317_cistern
	class mazc_white {
		displayName = "Белый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_AO_co.paa"};
	};
	class mazc_blue {
		displayName = "Синий";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Blue.paa"};
	};
	class mazc_green {
		displayName = "Зелёный";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Green.paa"};
	};
	class mazc_khaki {
		displayName = "Хаки";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Khaki.paa"};
	};
	class mazc_orange {
		displayName = "Оранжевый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Orange.paa"};
	};
	class mazc_red {
		displayName = "Красный";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Red.paa"};
	};
	class mazc_violet {
		displayName = "Фиолтеовый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Violet.paa"};
	};
	class mazc_yellow {
		displayName = "Желтый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Yellow.paa"};
	};
	class mazc_camo1 {
		displayName = "Camo1";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo1.paa"};
	};
	class mazc_camo2 {
		displayName = "Camo2";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo2.paa"};
	};
	class mazc_camo3 {
		displayName = "Camo3";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo3.paa"};
	};
	class mazc_camo4 {
		displayName = "Camo4";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo4.paa"};
	};
	class mazc_camo5 {
		displayName = "Camo5";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo5.paa"};
	};
	class mazc_camo6 {
		displayName = "Camo6";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo6.paa"};
	};
	class mazc_camo7 {
		displayName = "Camo7";
		texture[] = {"\d3s_maz_pack\data\skins\VIP\6317_Camo7.paa"};
	};
	
	//d3s_maz_7429
	class mzk_white {
		displayName = "Белый";
		texture[] = {"\d3s_maz_pack\data\skins\7429_AO_co.paa"};
	};
	class mzk_blue {
		displayName = "Синий";
		texture[] = {"\d3s_maz_pack\data\skins\7429_1.paa"};
	};
	class mzk_green {
		displayName = "Зелёный";
		texture[] = {"\d3s_maz_pack\data\skins\7429_3.paa"};
	};
	class mzk_yellow {
		displayName = "Желтый";
		texture[] = {"\d3s_maz_pack\data\skins\7429_2.paa"};
	};
	class mzk_orange {
		displayName = "Оранжевый";
		texture[] = {"\d3s_maz_pack\data\skins\6317_Orange.paa"};
	};
	class mzk_red {
		displayName = "Красный";
		texture[] = {"\d3s_maz_pack\data\skins\7429_4.paa"};
	};
	class mzk_brown {
		displayName = "Коричневый";
		texture[] = {"\d3s_maz_pack\data\skins\7429_5.paa"};
	};
	class mzk_sea {
		displayName = "Морской";
		texture[] = {"\d3s_maz_pack\data\skins\7429_6.paa"};
	};
	class mzk_blue_black {
		displayName = "Сине-чёрный";
		texture[] = {"\d3s_maz_pack\data\skins\7429_7.paa"};
	};
	class mzk_mosaic {
		displayName = "Мозаика";
		texture[] = {"\d3s_maz_pack\data\skins\7429_8.paa"};
	};
	class mzk_girl {
		displayName = "Аниме";
		texture[] = {"\d3s_maz_pack\data\skins\7429_9.paa"};
	};
	//d3s_f90_18
	class bmw5_cia_bel {
		displayName = "Белая";
		texture[] = {"\d3s_f90_18\data\skins\F90_AO_co.paa"};
	};
	
	class bmw5_cia_korch {
		displayName = "Коричневая";
		texture[] = {"\d3s_f90_18\data\skins\F90_Atlas_Cedar.paa"};
	};
	
	class bmw5_cia_black {
		displayName = "Черная";
		texture[] = {"\d3s_f90_18\data\skins\F90_Black_Uni.paa"};
	};
	
	class bmw5_cia_blue {
		displayName = "Серая";
		texture[] = {"\d3s_f90_18\data\skins\F90_Bluestone.paa"};
	};
	
	class bmw5_cia_silver1 {
		displayName = "Серебро-тусклое";
		texture[] = {"\d3s_f90_18\data\skins\F90_Cashmere_Silver.paa"};
	};
	
	class bmw5_cia_silver2 {
		displayName = "Туча";
		texture[] = {"\d3s_f90_18\data\skins\F90_Glacier_Silver.paa"};
	};
	
	class bmw5_cia_blue_imp {
		displayName = "Тьма";
		texture[] = {"\d3s_f90_18\data\skins\F90_Imperial_Blue.paa"};
	};
	
	class bmw5_cia_yellou {
		displayName = "Шоколад";
		texture[] = {"\d3s_f90_18\data\skins\F90_Jatoba.paa"};
	};
	
	class bmw5_cia_1 {
		displayName = "Океан";
		texture[] = {"\d3s_f90_18\data\skins\F90_Mediterranean_Blue.paa"};
	};
	
	class bmw5_cia_2 {
		displayName = "Горчичная";
		texture[] = {"\d3s_f90_18\data\skins\F90_Sophisto_Grey.paa"};
	};
	
    // //d3s_f90_18 VIP
	class bmw5_vip_1 {
		displayName = "Горчичная2";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Almandine_Brown.paa"};
	};
	class bmw5_vip_2 {
		displayName = "Белая VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Alpine_White.paa"};
	};
	class bmw5_vip_3 {
		displayName = "White VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_AOM_co.paa"};
	};
	class bmw5_vip_4 {
		displayName = "Желтая VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Austin_Yellow.paa"};
	};
	class bmw5_vip_5 {
		displayName = "Ночь VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Azurite_Black.paa"};
	};
	class bmw5_vip_6 {
		displayName = "Сумерки VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Black_Sapphire.paa"};
	};
	class bmw5_vip_7 {
		displayName = "Мороженное VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Champagne_Quartz.paa"};
	};
	class bmw5_vip_8 {
		displayName = "Серебро VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Donington_Gray.paa"};
	};
	class bmw5_vip_9 {
		displayName = "Черешня VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Frozen_Dark_Red.paa"};
	};
	class bmw5_vip_10 {
		displayName = "Зеленая VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Green_Pearl.paa"};
	};
	class bmw5_vip_12 {
		displayName = "Синяя VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Marina_Bay_Blue.paa"};
	};
	class bmw5_vip_13 {
		displayName = "Ночаня Фурия VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Mineral_Grey.paa"};
	};
	class bmw5_vip_14 {
		displayName = "M5 Белая VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_MPower.paa"};
	};
	class bmw5_vip_15 {
		displayName = "Белая VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Rhodonite_Silver.paa"};
	};
	class bmw5_vip_16 {
		displayName = "Красная VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Sakhir_Orange.paa"};
	};
	class bmw5_vip_17 {
		displayName = "Черная VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Sapphire_Black.paa"};
	};
	class bmw5_vip_18 {
		displayName = "Снежная VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Silverstone.paa"};
	};
	class bmw5_vip_19 {
		displayName = "Темная VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Singapore_Gray.paa"};
	};
	class bmw5_vip_20 {
		displayName = "Лазурная VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Snapper_Rocks_Blue.paa"};
	};
	class bmw5_vip_21 {
		displayName = "Небесная VIP";
		texture[] = {"\d3s_f90_18\data\skins\vip\F90_Yas_Marina_Blue.paa"};
	};
	
	//d3s_gl63amg_12
	class gl63amg_1 {
		displayName = "Океан";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Blue_co.paa"};
	};
	class gl63amg_2 {
		displayName = "Снежная";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_BW_co.paa"};
	};
	class gl63amg_3 {
		displayName = "Снежная AMG";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_BW_mat_co.paa"};
	};
	class gl63amg_4 {
		displayName = "Сумеречная";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Cavansit_co.paa"};
	};
	class gl63amg_5 {
		displayName = "Тьма";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Obsidian_co.paa"};
	};
	class gl63amg_6 {
		displayName = "Тусклая";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Palladium_co.paa"};
	};
	class gl63amg_7 {
		displayName = "Серебро";
		texture[] = {"\d3s_gl63amg_12\data\skins\GL_AO_Selenite_co.paa"};
	};
	//d3s_gls63amg_17
	class gls63amg_1 {
		displayName = "Черная";
		texture[] = {"\d3s_gls63amg_17\data\skins\Black.paa"};
	};
	class gls63amg_2 {
		displayName = "Океан";
		texture[] = {"\d3s_gls63amg_17\data\skins\Cavnsit_Blue.paa"};
	};
	class gls63amg_3 {
		displayName = "Коричневый цитрин";
		texture[] = {"\d3s_gls63amg_17\data\skins\Citrin_Brown.paa"};
	};
	class gls63amg_4 {
		displayName = "Серебро";
		texture[] = {"\d3s_gls63amg_17\data\skins\Diamond_White.paa"};
	};
	class gls63amg_5 {
		displayName = "Снажная";
		texture[] = {"\d3s_gls63amg_17\data\skins\GLS_AO_co.paa"};
	};
	class gls63amg_6 {
		displayName = "Бордовая";
		texture[] = {"\d3s_gls63amg_17\data\skins\Hyazinth_Red.paa"};
	};
	class gls63amg_7 {
		displayName = "Иридий";
		texture[] = {"\d3s_gls63amg_17\data\skins\Iridium_Silver.paa"};
	};
	class gls63amg_8 {
		displayName = "Обсидиан";
		texture[] = {"\d3s_gls63amg_17\data\skins\Obsidian_Black.paa"};
	};
	class gls63amg_9 {
		displayName = "Мокрый асфальт";
		texture[] = {"\d3s_gls63amg_17\data\skins\Palladium_Silver.paa"};
	};
	class gls63amg_10 {
		displayName = "Рудный";
		texture[] = {"\d3s_gls63amg_17\data\skins\Polar_White.paa"};
	};
	class gls63amg_11 {
		displayName = "Сумеречный";
		texture[] = {"\d3s_gls63amg_17\data\skins\Tenorite_Grey.paa"};
	};

	//d3s_g65amg_16_2
	class g65amg_1 {
		displayName = "Белый/черный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\G63_AO_co.paa"};
	};
	class g65amg_2 {
		displayName = "Белый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_AO_co.paa"};
	};
	class g65amg_3 {
		displayName = "Красный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_Colour_Red.paa"};
	};
	class g65amg_4 {
		displayName = "Белый/черный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_Colour_White.paa"};
	};
	class g65amg_5 {
		displayName = "Желтый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_colour_yellow.paa"};
	};
	class g65amg_6 {
		displayName = "Песочный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_desert_sand.paa"};
	};
	class g65amg_7 {
		displayName = "Жаркий";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_hyacinth_red.paa"};
	};
	class g65amg_8 {
		displayName = "Обсидиан";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_1_obsidian_black.paa"};
	};
	class g65amg_9 {
		displayName = "Снежный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_AO_co.paa"};
	};
	class g65amg_10 {
		displayName = "Тьма";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_Black.paa"};
	};
	class g65amg_11 {
		displayName = "Красный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_colour_red.paa"};
	};
	class g65amg_12 {
		displayName = "Белый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_colour_white.paa"};
	};
	class g65amg_13 {
		displayName = "Желтый";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_colour_yellow.paa"};
	};
	class g65amg_14 {
		displayName = "Песок";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_desert_sand.paa"};
	};
	class g65amg_15 {
		displayName = "Красный";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_hyacinth_red.paa"};
	};
	class g65amg_16 {
		displayName = "Ночь";
		texture[] = {"\d3s_g65amg_16_2\data\skins\Mans_obsidian_black.paa"};
	};
	//d3s_raptor_17
	class rap_1 {
		displayName = "Белая";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_AO_co.paa"};
	};
	class rap_2 {
		displayName = "Черная";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Black.paa"};
	};
	class rap_3 {
		displayName = "Черный Гранит";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Black_Granite.paa"};
	};
	class rap_4 {
		displayName = "Синяя";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Blue.paa"};
	};
	class rap_5 {
		displayName = "Морской бриз";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Breeze.paa"};
	};
	class rap_6 {
		displayName = "Кристально красный";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Crystal_Red.paa"};
	};
	class rap_7 {
		displayName = "Песочная";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Gold_Mist.paa"};
	};
	class rap_8 {
		displayName = "Серая";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Gray.paa"};
	};
	class rap_9 {
		displayName = "Зеленая";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Green.paa"};
	};
	class rap_10 {
		displayName = "Лайм";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Lime.paa"};
	};
	class rap_11 {
		displayName = "Мокрая сталь";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Mocha_Steel.paa"};
	};
	class rap_12 {
		displayName = "Неон";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Neon.paa"};
	};
	class rap_13 {
		displayName = "Апельсин";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Orange.paa"};
	};
	class rap_15 {
		displayName = "Красная";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Red.paa"};
	};
	class rap_16 {
		displayName = "F150";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_SCR_co.paa"};
	};
	class rap_17 {
		displayName = "Ледяное серебро";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Silver_Ice.paa"};
	};
	class rap_18 {
		displayName = "Фиолетовый";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Violette.paa"};
	};
	class rap_19 {
		displayName = "Белая";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_White.paa"};
	};
	class rap_20 {
		displayName = "Желтая";
		texture[] = {"\d3s_raptor_17\data\skins\RAPTOR_Yellow.paa"};
	};
	/////////////////
	class rap_vip_1 {
		displayName = "F22";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\F22.paa"};
	};
	class rap_vip_2 {
		displayName = "Fabtech";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\Fabtech.paa"};
	};
	class rap_vip_3 {
		displayName = "FX4";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\FX4.paa"};
	};
	class rap_vip_4 {
		displayName = "Roush";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\Roush.paa"};
	};
	class rap_vip_5 {
		displayName = "Shelby";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\Shelby.paa"};
	};
	class rap_vip_6 {
		displayName = "TSDesigns";
		texture[] = {"\d3s_raptor_17\data\skins\VIP\TSDesigns.paa"};
	};
	
	//d3s_x222_18
	class may_3 {
		displayName = "Серая";
		texture[] = {"\d3s_x222_18\data\skins\X222_Allanit_Gray.paa"};
	};
	class may_4 {
		displayName = "Luxe";
		texture[] = {"\d3s_x222_18\data\skins\X222_Anthracite_Blue.paa"};
	};
	class may_5 {
		displayName = "Luxe 2";
		texture[] = {"\d3s_x222_18\data\skins\X222_Anthracite_Blue_1.paa"};
	};
	class may_6 {
		displayName = "Белая";
		texture[] = {"\d3s_x222_18\data\skins\X222_Cashmere_White.paa"};
	};
	class may_7 {
		displayName = "Белая 2";
		texture[] = {"\d3s_x222_18\data\skins\X222_Cashmere_White_3.paa"};
	};
	class may_8 {
		displayName = "Синяя";
		texture[] = {"\d3s_x222_18\data\skins\X222_Cavansit_Blue.paa"};
	};
	class may_9 {
		displayName = "Коричневая";
		texture[] = {"\d3s_x222_18\data\skins\X222_Citrin_Brown.paa"};
	};
	class may_10 {
		displayName = "Коричневая 2";
		texture[] = {"\d3s_x222_18\data\skins\X222_Citrin_Brown_2.paa"};
	};
	class may_11 {
		displayName = "Серебро";
		texture[] = {"\d3s_x222_18\data\skins\X222_Diamond_Silver.paa"};
	};
	class may_12 {
		displayName = "Снежная";
		texture[] = {"\d3s_x222_18\data\skins\X222_Diamond_White.paa"};
	};
	class may_13 {
		displayName = "Изумрудная";
		texture[] = {"\d3s_x222_18\data\skins\X222_Emerald_Green.paa"};
	};
	class may_14 {
		displayName = "Мокрая";
		texture[] = {"\d3s_x222_18\data\skins\X222_Mokka_Schwarz.paa"};
	};
	
	//d3s_ctsv_16
	class ctsv_1 {
		displayName = "Arctic White";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_black_co.paa"};
	};
	class ctsv_2 {
		displayName = "Brilliant Silver";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_blue_co.paa"};
	};
	class ctsv_3 {
		displayName = "Cavansit Blue";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_latte_co.paa"};
	};
	class ctsv_4 {
		displayName = "Dolomit Brown";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTS_AO_silver_co.paa"};
	};
	class ctsv_5 {
		displayName = "Flint Gray 2";
		texture[] = {"\d3s_ctsv_16\data_18\skins\CTSV_AO_co.paa"};
	};
	
	//d3s_wrx_17
	class wrx_1 {
		displayName = "Crystal Black";
		texture[] = {"\d3s_wrx_17\data\skins\Crystal_Black.paa"};
	};
	class wrx_2 {
		displayName = "Crystal White";
		texture[] = {"\d3s_wrx_17\data\skins\Crystal_White.paa"};
	};
	class wrx_3 {
		displayName = "Dark Grey";
		texture[] = {"\d3s_wrx_17\data\skins\Dark_Grey.paa"};
	};
	class wrx_4 {
		displayName = "Galaxy Blue";
		texture[] = {"\d3s_wrx_17\data\skins\Galaxy_Blue.paa"};
	};
	class wrx_5 {
		displayName = "Ice Silver";
		texture[] = {"\d3s_wrx_17\data\skins\Ice_Silver.paa"};
	};
	class wrx_6 {
		displayName = "Crystal Black";
		texture[] = {"\d3s_wrx_17\data\skins\STI_AO_co.paa"};
	};
	class wrx_7 {
		displayName = "White";
		texture[] = {"\d3s_wrx_17\data\skins\Crystal_White.paa"};
	};
	class wrx_8 {
		displayName = "WR Blue";
		texture[] = {"\d3s_wrx_17\data\skins\WR_Blue.paa"};
	};
};