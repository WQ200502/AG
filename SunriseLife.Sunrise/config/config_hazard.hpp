#define true 1
#define false 0

class LifeCfgHazard {
	spawn_points[] = {{9622.69,9398.21,0.00202942},{10222.8,10362.7,0.00149393},{10718.5,10369.4,0.00118065},{11184,10111.5,0.00140595},{11900.7,10372.8,0.00168037},{12359.5,9923.99,0.00135946},{12888.7,9810.12,0.00143862},{12701.1,9029.8,0.000654221},{12714.5,8149,0.000717163},{13943.6,6404.16,0.00025177},{12587.2,6574.96,0.00146103},{11626.1,6434.3,0.000402451},{10507.5,6662.04,0.00141144},{9583.17,6618.5,0.00138378},{9365.48,7328.49,0.00277519},{8296.43,7061.05,0.00274277},{8605.21,7371.9,0.00126266},{8884.97,8455.72,0.000902176},{9150.32,8771.07,0.00174904}};
	cloth_price = 10000; //стоимость радиационного костюма
	detectorItem = "sl_detektor"; //предмет который активирует детектор

	class HouseItems {
		items[] = {
			{ {"muzzle_snds_B","muzzle_snds_H","muzzle_snds_M"}, 5 },
			{ {{"launch_RPG7V","RPG7_PG7VR"},{"LMG_mas_M249_F","200Rnd_mas_556x45_Stanag"}}, 10 },
			{ {{"arifle_mas_hk416","30Rnd_mas_556x45_Stanag"},{"LMG_mas_m72_F","100Rnd_mas_762x39_mag"}}, 50 },
			{ {"Rangefinder","U_I_Protagonist_VR","U_C_Protagonist_VR"}, 60 },
			{ {{"sgun_HunterShotgun_01_sawedoff_F","2Rnd_12Gauge_Pellets"}}, 75 },
			{ {"VX_Leona_Headset_NVG","NVGoggles_mas_h","O_NVGoggles_ghex_F"}, 80 },
			{ {"Masque_Dallas","Masque_Chuck","Masque_Smiley"}, 85 },
			{ {"G_Bandanna_aviator","G_Bandanna_shades","G_mas_wpn_shemag_gog"}, 90 },
			{ {{"arifle_mas_lee","5Rnd_mas_762x51_Stanag"},"B_Bergen_tna_F","B_Bergen_hex_F"}, 100 }
		};
	};

	class Artifact {
		items[] = {
			{"sl_art_Tears", 10000},
			{"sl_art_Spikes", 10000},
			{"sl_art_Crystall", 10000},
			{"sl_art_Blood_of_stone", 10000},
			{"sl_art_Meat", 10000},
			{"sl_art_Medusa", 10000},
			{"sl_art_Fireball", 10000},
			{"sl_art_Empty", 10000},
			{"sl_art_Ameba", 10000},
			{"sl_art_Battery", 10000},
			{"sl_art_Gravi", 10000},
			{"sl_art_Soul", 10000},
			{"sl_art_Sparkler", 10000}
		};
	};
};