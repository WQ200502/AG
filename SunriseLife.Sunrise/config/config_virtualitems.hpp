/*
	CLASS:
		variable = имя переменной
		displayName = название
		weight = вес
		conditions = условия, необходимые для действий с данным предметом (используется в vehStoreItem, чтобы не давать хранить уран в домах и авиа)
		icon = иконка
*/
class LifeCfgVirtualItems {
	// Яблоки Персики
	class apple {
		variable = "apple";
		displayName = "STR_Item_Apple";
		weight = 1;
		conditions = "";
		icon = "\sunrise_pack\icons\items\apple.paa";
	};
	class peach {
		variable = "peach";
		displayName = "STR_Item_Peach";
		weight = 1;
		conditions = "";
		icon = "\sunrise_pack\icons\items\peach.paa";
	};

	// Нефть - Бензин
	class oil {
		variable = "oil";
		displayName = "STR_Item_OilU";
		weight = 5;
		conditions = "";
		icon = "\sunrise_pack\icons\items\oil_unprocessed.paa";
	};
	class oilp {
		variable = "oilp";
		displayName = "STR_Item_OilP";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\oil_processed.paa";
	};
	class petrol {
		variable = "petrol";
		displayName = "STR_Item_Gasoline";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\fuel_can.paa";
	};

	// Черепаха
	class turtle {
		variable = "turtle";
		displayName = "STR_Item_TurtleMeat";
		weight = 6;
		conditions = "";
		icon = "\sunrise_pack\icons\items\turtle.paa";
	};

	// Медь
	class copper_ore {
		variable = "copper_ore";
		displayName = "STR_Item_CopperOre";
		weight = 4;
		conditions = "";
		icon = "\sunrise_pack\icons\items\copper_ore.paa";
	};
	class copper {
		variable = "copper";
		displayName = "STR_Item_CopperIngot";
		weight = 2;
		conditions = "";
		icon = "\sunrise_pack\icons\items\copper.paa";
	};

	// Бронза
	class bronze_ore {
		variable = "bronze_ore";
		displayName = "STR_MF_ResGathBronze";
		weight = 5;
		conditions = "";
		icon = "\sunrise_pack\icons\items\tanoa\bronze.paa";
	};
	class bronze {
		variable = "bronze";
		displayName = "STR_Item_BronzeP";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\tanoa\bronze_1.paa";
	};

	// Железо
	class iron_ore {
		variable = "iron_ore";
		displayName = "STR_Item_IronOre";
		weight = 4;
		conditions = "";
		icon = "\sunrise_pack\icons\items\iron_ore.paa";
	};
	class iron {
		variable = "iron";
		displayName = "STR_Item_IronIngot";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\ironore.paa";
	};

	// Серебро
	class silver_ore {
		variable = "silver_ore";
		displayName = "STR_Item_SilverOre";
		weight = 5;
		conditions = "";
		icon = "\sunrise_pack\icons\items\silverore.paa";
	};
	class silver {
		variable = "silver";
		displayName = "STR_Item_Silver";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\silverstack.paa";
	};
	
	// Алмаз
	class diamond {
		variable = "diamond";
		displayName = "STR_Item_DiamondU";
		weight = 5;
		conditions = "";
		icon = "\sunrise_pack\icons\items\diamond_unprocessed.paa";
	};

	class diamondc {
		variable = "diamondr";
		displayName = "STR_Item_DiamondC";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\diamond.paa";
	};
	// Ювелирка
	class jewelry {
		variable = "jewelry";
		displayName = "STR_Item_Jewelry";
		weight = 2;
		conditions = "";
		icon = "\sunrise_pack\icons\items\jewelry.paa";
	};

	// Дерево
	class wood {
		variable = "wood";
		displayName = "STR_MF_BlackWood";
		weight = 4;
		conditions = "";
		icon = "\sunrise_pack\icons\items\tanoa\woodb.paa";
	};
	class woodp {
		variable = "woodp";
		displayName = "STR_Item_RedWoodS";
		weight = 2;
		conditions = "";
		icon = "\sunrise_pack\icons\items\tanoa\woodr_1.paa";
	};
	
	// Мясо,Рыба
	class meat {
		variable = "meat";
		displayName = "STR_Item_Meat";
		weight = 1;
		conditions = "";
		icon = "\sunrise_pack\icons\items\meat_r.paa";
	};
	class fish {
		variable = "fish";
		displayName = "STR_Item_fish";
		weight = 1;
		conditions = "";
		icon = "\sunrise_pack\icons\items\fish.paa";
	};
	class fish_meat {
		variable = "fish_meat";
		displayName = "STR_Item_meat_fried";
		weight = 1;
		conditions = "";
		icon = "\sunrise_pack\icons\items\meat_fried.paa";
	};
	class fish_trap {
		variable = "fish_trap";
		displayName = "STR_Item_fish_trap";
		weight = 1;
		conditions = "";
		icon = "\sunrise_pack\icons\items\fish_fried.paa";
	};
	
	/// НЕЛЕГАЛ
	// Маруха
	class cannabis_unpr {
		variable = "cannabis_unpr";
		displayName = "STR_Item_Cannabis_unpr";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\cannabis.paa";
	};
	class cannabis {
		variable = "cannabis";
		displayName = "STR_Item_Cannabis";
		weight = 2;
		conditions = "";
		icon = "\sunrise_pack\icons\items\marijuana.paa";
	};
	
	// Героин
	class heroinu {
		variable = "heroinu";
		displayName = "STR_Item_HeroinU";
		weight = 4;
		conditions = "";
		icon = "\sunrise_pack\icons\items\heroin_unprocessed.paa";
	};
	class heroinp {
		variable = "heroinp";
		displayName = "STR_Item_HeroinP";
		weight = 2;
		conditions = "";
		icon = "\sunrise_pack\icons\items\heroin_processed.paa";
	};
	
	// Кокаин
	class cocaine {
		variable = "cocaine";
		displayName = "STR_Item_CocaineU";
		weight = 5;
		conditions = "";
		icon = "\sunrise_pack\icons\items\cocain_unprocessed.paa";
	};
	class cocainep {
		variable = "cocainep";
		displayName = "STR_Item_CocaineP";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\cocain_processed.paa";
	};
	
	// Мет
	class methu {
		variable = "methu";
		displayName = "STR_Item_MethU";
		weight = 5;
		conditions = "";
		icon = "\sunrise_pack\icons\items\meth.paa";
	};
	class methp {
		variable = "methp";
		displayName = "STR_Item_MethP";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\meth.paa";
	};
	
	/// АЛКОГОЛЬ
	// Песок
	class sand {
		variable = "sand";
		displayName = "STR_Item_Sand";
		weight = 5;
		conditions = "";
		icon = "\sunrise_pack\icons\items\sand.paa";
	};
	// Стекло
	class glass {
		variable = "glass";
		displayName = "STR_Item_Glass";
		weight = 2;
		conditions = "";
		icon = "\sunrise_pack\icons\items\glass.paa";
	};
	// Бутылки
	class bottles {
		variable = "bottles";
		displayName = "STR_Item_Bottle";
		weight = 1;
		conditions = "";
		icon = "\sunrise_pack\icons\items\bottles.paa";
	};
	// Рожь
	class rue_unpr {
		variable = "rue_unpr";
		displayName = "STR_Item_Rye_unpr";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\rye.paa";
	};
	/*class rue {
		variable = "rue";
		displayName = "STR_Item_Rye";
		weight = 2;
		conditions = "";
		icon = "\sunrise_pack\icons\items\sand.paa";
	};*/
	// Дрожжи
	class yeast {
		variable = "yeast";
		displayName = "STR_Item_Yeast";
		weight = 2;
		conditions = "";
		icon = "\sunrise_pack\icons\items\yeast.paa";
	};
	// Хмель
	class hops {
		variable = "hops";
		displayName = "STR_Item_Hops";
		weight = 2;
		conditions = "";
		icon = "\sunrise_pack\icons\items\hops.paa";
	};
	// Кукурузная мука
	class cornmeal {
		variable = "cornmeal";
		displayName = "STR_Item_CornMeal";
		weight = 4;
		conditions = "";
		icon = "\sunrise_pack\icons\items\cornmeal.paa";
	};
	// Самогон
	class moonshine {
		variable = "moonshine";
		displayName = "STR_Item_MoonShine";
		weight = 4;
		conditions = "";
		icon = "\sunrise_pack\icons\items\alco.paa";
	};
	// Пиво
	class beerp {
		variable = "beerp";
		displayName = "STR_Item_BeerP";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\alco.paa";
	};
	// Виски
	class whiskey {
		variable = "whiskey";
		displayName = "STR_Item_Whiskey";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\alco.paa";
	};
	// Брага
	class mash {
		variable = "mash";
		displayName = "STR_Item_Mash";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\mash.paa";
	};
	// Бутылка самогона
	class bottledshine {
		variable = "bottledshine";
		displayName = "STR_Item_ShineBottle";
		weight = 4;
		conditions = "";
		icon = "\sunrise_pack\icons\items\alcob.paa";
	};
	// Бутылка пива
	class bottledbeer {
		variable = "bottledbeer";
		displayName = "STR_Item_BeerBottle";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\alcob.paa";
	};
	// Бутылка виски
	class bottledwhiskey {
		variable = "bottledwhiskey";
		displayName = "STR_Item_WhiskeyBottle";
		weight = 3;
		conditions = "";
		icon = "\sunrise_pack\icons\items\alcob.paa";
	};
	
};