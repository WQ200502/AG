#define true 1
#define false 0

class LifeCfgAdac {
	class C_Van_01_transport_F {
		boxes = 1;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	class C_Offroad_01_F {
		boxes = 1;
		nitro = true;
		textures[] = {};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
	class C_Hatchback_01_sport_F {
		boxes = 0;
		nitro = true;
		textures[] = {};
		materials[] = {"glossy","matte","metallic"};
	};
	class C_Hatchback_01_F {
		boxes = 0;
		nitro = true;
		textures[] = {};
		materials[] = {"glossy","matte","metallic"};
	};
	class C_SUV_01_F {
		boxes = 0;
		nitro = true;
		textures[] = {};
		materials[] = {"glossy","matte","metallic"};
	};

	class B_Heli_Light_01_F {
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "humm_bl", "" },
			{ "humm_r", "" },
			{ "humm_vme", "(call life_donator) > 0" },
			{ "humm_bln", "" },
			{ "humm_llp", "" },
			{ "humm_fr", "" },
			{ "humm_bj", "" },
			{ "humm_rl", "" },
			{ "humm_sn", "" },
			{ "humm_vrn", "" },
			{ "humm_wv", "" },
			{ "humm_reb", "" }
		};
		materials[] = {};
	};

	class C_Heli_Light_01_civil_F {
		boxes = 0;
		nitro = false;
		textures[] = {
			{ "humm_bln", "" },
			{ "humm_reb", "" },
			{ "humm_llp", "" },
			{ "humm_fr", "" },
			{ "humm_gra", "" },
			{ "humm_bj", "" },
			{ "humm_lg", "" },
			{ "humm_shd", "" },
			{ "humm_shr", "" },
			{ "humm_rl", "(call life_donator) > 0" },
			{ "humm_sn", "(call life_donator) > 0" },
			{ "humm_vrn", "" },
			{ "humm_wsp", "(call life_donator) > 0" },
			{ "humm_wv", "" }
		};
		materials[] = {};
	};

	class O_MRAP_02_F {
		boxes = 0;
		nitro = true;
		textures[] = {};
		materials[] = {};
	};
	class I_MRAP_03_F: O_MRAP_02_F {};
	class B_MRAP_01_F: O_MRAP_02_F {};
	
	class I_Truck_02_transport_F {
		boxes = 2;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	
	class I_Truck_02_covered_F {
		boxes = 2;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	class O_Truck_03_transport_F: I_Truck_02_covered_F {};
	class O_Truck_03_covered_F: I_Truck_02_covered_F {};

	class I_Truck_02_covered_CIV_F {
		boxes = 2;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};

	class B_Truck_01_transport_F {
		boxes = 3;
		nitro = false;
		textures[] = {};
		materials[] = {};
	};
	class B_Truck_01_covered_F: B_Truck_01_transport_F {};

	class Mrshounka_a3_smart_Rework_blanche_f {
		boxes = 0;
		nitro = true;
		textures[] = {
			{ "shnk_w", "" },
			{ "shnk_r", "" },
			{ "shnk_bbl", "" },
			{ "shnk_gr", "" },
			{ "shnk_y", "" },
			{ "shnk_bbr", "" },
			{ "shnk_o", "" },
			{ "shnk_rs", "" },
			{ "shnk_vi", "" },
			{ "shnk_bl", "" },
			{ "shnk_blr", "" },
			{ "shnk_g", "" },
			{ "shnk_blg", "" },
			{ "shnk_b", "" }
		};
		materials[] = {"glossy","matte","metallic","chrome"};
	};

	class C_Offroad_02_unarmed_F {
		boxes = 1;
		nitro = true;
		textures[] = {};
		materials[] = {"glossy","matte","metallic","chrome"};
	};
};