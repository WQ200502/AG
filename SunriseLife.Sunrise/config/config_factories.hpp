#define true 1
#define false 0


class LifeCfgFactories {
	class car {
		displayName = "Автомобильный завод";
		orderDescription = "Тут можно заказать поставку машин в ваш магазин. Цена: $%1 за ед.";
		legal = true;
		conditions = "";
		items[] = {"bronze","copper","silver","iron","woodp"};
		order[] = {{"metal",50}, {"woodp",25}};
	};
	class food {
		displayName = "Продуктовый комбинат";
		orderDescription = "Тут можно заказать поставку продовольствия в ваш магазин. Цена: $%1 за ед.";
		legal = true;
		conditions = "";
		items[] = {"turtle","meat","fish_meat","apple","peach","rue","cannabis"};
		order[] = {{"food",20}};
	};
	class gun {
		displayName = "Оружейный завод";
		orderDescription = "Тут можно заказать поставку оружия в ваш магазин. Цена: $%1 за ед.";
		legal = true;
		conditions = "";
		items[] = {"bronze","copper","silver","iron","woodp"};
		order[] = {{"metal",20}, {"woodp",10}};
	};
	class oil {
		displayName = "Нефтеперерабатывающий завод";
		orderDescription = "На этом заводе можно заказать поставку нефти в ваш магазин";
		legal = true;
		conditions = "";
		items[] = {"oil"};
		order[] = {{"oil",2}};
	};
};

class LifeCfgFactoriesResources {
	class iron_ore {
		conditions = "life_currentExpLevel > 1";
		conditionsMessage = "Добыча этого ресурса доступна с 2 уровня";
	};
	class copper_ore {
		conditions = "life_currentExpLevel > 2";
		conditionsMessage = "Добыча этого ресурса доступна с 3 уровня";
	};
	class bronze_ore {
		conditions = "life_currentExpLevel > 3";
		conditionsMessage = "Добыча этого ресурса доступна с 4 уровня";
	};
	class silver_ore {
		conditions = "life_currentExpLevel > 4";
		conditionsMessage = "Добыча этого ресурса доступна с 5 уровня";
	};
	class wood {
		conditions = "life_currentExpLevel > 5";
		conditionsMessage = "Добыча этого ресурса доступна с 6 уровня";
	};
	class rue_unpr {
		conditions = "life_currentExpLevel > 6";
		conditionsMessage = "Добыча этого ресурса доступна с 7 уровня";
	};
	class cannabis_unpr {
		conditions = "life_currentExpLevel > 11";
		conditionsMessage = "Добыча этого ресурса доступна с 12 уровня";
	};
	class oil {
		conditions = "life_currentExpLevel > 20";
		conditionsMessage = "Добыча этого ресурса доступна с 21 уровня";
	};
};
class LifeCfgFactoriesProcessing {
	class iron_ore {
		processedItem = "iron";
	};
	class bronze_ore {
		processedItem = "bronze";
	}; 
	class copper_ore {
		processedItem = "copper";
	};
	class silver_ore {
		processedItem = "silver";
	};
	class diamond {
		processedItem = "diamondc";
	};

	class sand {
		processedItem = "glass";
	};
	class wood {
		processedItem = "woodp";
	};
	class fish {
		processedItem = "fish_meat";
	};
	
	class oil {
		processedItem = "oilp";
	};
	class petrol {
		processedItem = "petrol";
	};
	// НЕЛЕГАЛ
	class cannabis_unpr {
		processedItem = "cannabis";
	};
	class meth {
		processedItem = "methp";
	};
	class cocaine {
		processedItem = "cocainep";
	};
	class heroin {
		processedItem = "heroinp";
	};
	
	// АЛКОГОЛЬ
	class glassbottle {
		processedItem = "bottles";
	};
};
class LifeCfgFactoriesShops {
	3_gun = "sparta_weap";
	4_gun = "vl_weap";
	5_gun = "lsd_weap";
	6_gun = "nkvd_weap";
	7_gun = "sektor_weap";
	8_gun = "arb_weap";
	9_gun = "mod_weap";
	10_gun = "tpj_weap";
	
	3_car = "sparta_car";
	4_car = "vl_car";
	5_car = "lsd_car";
	6_car = "nkvd_car";
	7_car = "sektor_car";
	8_car = "arb_car";
	9_car = "mod_car";
	10_car = "tpj_car";
};