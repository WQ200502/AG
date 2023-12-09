#define true 1
#define false 0

class LifeCfgVirtualItemsShops {
	class fishmarket {
		displayName = "STR_MF_FishMarket";
		legal = true;
		conditions = "";
		items[] = {"salema_fried", "ornate_fried", "mackerel_fried", "tuna_fried", "mullet_fried", "catshark_fried", "shrimp_s", "royalcp","fish_meat"};
	};
	class market {
		displayName = "STR_MF_FoodMarket";
		legal = true;
		conditions = "";
		items[] = {"apple","peach","bottles","leather_r","hen_fried","rooster_fried","goat_fried","sheep_fried","olivep","coco","anana","banana","arwater","coffeep","cocomilk","dish","cacaop","meat"};
	};
	class wongs {
		displayName = "STR_MF_TurtleMeatShop";
		legal = true;
		conditions = "";
		items[] = {"turtle","shark"};
	};
	
	class alcotrade {
		displayName = "STR_MF_AlcoShop";
		legal = true;
		conditions = "";
		items[] = {"bottledbeer","bottledwhiskey","bottledshine"};
	};
	
	class oil {
		displayName = "STR_MF_OilGasShop";
		legal = true;
		conditions = "";
		items[] = {"oilp","petrol"};
	};
	class wood {
		displayName = "STR_MF_WoodShop";
		legal = true;
		conditions = "";
		items[] = {"wood","woodbp","woodp"};
	};
	
	class iron {
		displayName = "STR_MF_CopperIronShop";
		legal = true;
		conditions = "";
		items[] = {"iron","copper"};
	};
	class silver {
		displayName = "STR_MF_SilverShop";
		legal = true;
		conditions = "";
		items[] = {"silver","bronze"};
	};
	class glass {
		displayName = "STR_MF_GlassBotlShop";
		legal = true;
		conditions = "";
		items[] = {"glass","bottles"};
	};
	class rue {
		displayName = "STR_MF_RueShop";
		legal = true;
		conditions = "";
		items[] = {"rue"};
	};
	class diamond {
		displayName = "STR_MF_DiamondShop";
		legal = true;
		conditions = "";
		items[] = {"diamondc","jewelry","ruby_r","silver_r"};
	};
	
	
	class heroin {
		displayName = "STR_MF_DrugDealer";
		legal = false;
		conditions = "";
		items[] = {"cocainep","heroinp","cannabis","methp"};
	};
};