#define true 1
#define false 0

class LifeCfgGather {//не работает
	//яблоки
	class apple {
		amount = 2;
		tool = "sunrise_Tool_Hoe";
		zones[] = {"apple_1","apple_2"};
		zoneSize = 35;
		model = "acd_C_Sacks_goods_F";
		device = false;
		conditions = "";
		conditionsMessage = "";
	};
	//персики
	class peach {
		amount = 2;
		tool = "sunrise_Tool_Hoe";
		zones[] = {"peaches_1","peaches_2"};
		zoneSize = 35;
		model = "acd_C_Sacks_goods_F";
		device = false;
		conditions = "";
		conditionsMessage = "";
	};
	//хлопок
	class cotton {
		amount = 1;
		tool = "sunrise_Tool_Hoe";
		zones[] = {"cotton_1"};
		zoneSize = 35;
		model = "A3L_Cotton";
		device = false;
		conditions = "";
		conditionsMessage = "";
	};
	//Заготовка леса
	class wood {
		amount = 1;
		tool = "sunrise_Tool_Axe";
		zones[] = {"tree_1"};
		zoneSize = 200;
		model = "Land_WoodPile_F";
		device = false;
		conditions = "";
		conditionsMessage = "";
	};
	
	//Рудники
	// Медь
	class copper_ore {
		amount = 1;
		tool = "sunrise_Tool_PickAxe";
		zones[] = {"Mines_1"};
		zoneSize = 40;
		model = "A3L_Bits_Rock_L_Coal";
		device = true;
		conditions = "";
		conditionsMessage = "";	
	};
	// Железо
	class iron_ore : copper_ore{
		zones[] = {"Mines_2"};
		model = "A3L_Bits_Rock_L_Iron";
		conditions = "";
		conditionsMessage = "";
	};
	// Бронза
	class bronze_ore : copper_ore{
		zones[] = {"Mines_3"};
		model = "A3L_Normal_Rock_L";
		conditions = "";
		conditionsMessage = "";
	};
	// Серебро
	class silver_ore : copper_ore{
		zones[] = {"Mines_4"};
		model = "A3L_Bits_Rock_L_Iron";
		conditions = "";
		conditionsMessage = "";
	};
	class diamond {
		amount = 1;
		tool = "sunrise_Tool_PickAxe";
		zones[] = {};
		zoneSize = 40;
		model = "A3L_Bits_Rock_L_Iron";
		device = true;
		conditions = "";
		conditionsMessage = "";	
	};
	
	// Нефть
	class oil {
		amount = 1;
		tool = "sunrise_Tool_PickAxe";
		zones[] = {"Mines_8"};
		zoneSize = 40;
		model = "Land_MetalBarrel_F";
		device = true;
		conditions = "";
		conditionsMessage = "";
	};
	
	// Нелегал
	class cannabis_unpr {
		amount = 1;
		tool = "sunrise_Tool_Hoe";
		zones[] = {"Mines_7"};
		zoneSize = 40;
		model = "A3L_Cannabis";
		device = true;
		conditions = "";
		conditionsMessage = "";
	};
	class heroinu {
		amount = 1;
		tool = "sunrise_Tool_Hoe";
		zones[] = {"heroin_1"};
		zoneSize = 40;
		model = "plp_ctm_Sack";
		device = true;
		conditions = "";
		conditionsMessage = "";
	};
	class cocaine: heroinu {
		zones[] = {"cocaine_1"};
		conditions = "";
		conditionsMessage = "";
	};
	class methu: heroinu {
		zones[] = {"meth_1"};
		tool = "sunrise_Tool_Shovel";
		conditions = "";
		conditionsMessage = "";
	};
	
	// АЛКОГОЛЬ
	// Рожь
	class rue_unpr {
		amount = 1;
		tool = "sunrise_Tool_Hoe";
		zones[] = {"Mines_6"};
		zoneSize = 40;
		model = "plp_ctm_Sack";
		device = true;
		conditions = "";
		conditionsMessage = "";
	};
	// Дрожжи
	class yeast: rue_unpr {
		tool = "sunrise_Tool_Hoe";
		zones[] = {"Mines_10"};
	};
	// Хмель
	class hops: rue_unpr {
		zones[] = {"Mines_11"};
	};
	// Кукуруза
	class cornmeal: rue_unpr {
		zones[] = {"Mines_12"};
	};
	
	// Песок
	class sand: rue_unpr {
		tool = "sunrise_Tool_Shovel";
		zones[] = {"Mines_9"};
	};
	
};