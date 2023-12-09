#define true 1
#define false 0

/*
	price - Стоимость дома
	numberCrates - Кол-во возможных слотов (0 - ГАРАЖ)
	restrictedPos[] - Черный список позиций в доме
	canGarage - Добавляем обычному дому с ящиками возможность гаража
	garageSpawnPos[] - worldToModel позиция спауна техники
	garageSpawnDir - насколько повернуть градусов относительно позиции дома
	garageBlacklists[] - дома, которым запрещено иметь гараж (координаты)
*/

class LifeCfgHousing {
	class Sunrise {
		class Land_i_Shed_ind_F {
			price = 6500000;
			numberCrates = 10;
			restrictedPos[] = {0,1,2,3,4};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {2,0,3.5};
			conditions = "";
		};
		
		class Land_i_House_Big_02_V1_F {
			price = 555000;
			numberCrates = 3;
			restrictedPos[] = {0,1,2,3,4};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {2,0,3.5};
			conditions = "";
		};

		class Land_i_House_Big_02_V2_F : Land_i_House_Big_02_V1_F{};
		class Land_i_House_Big_02_V3_F : Land_i_House_Big_02_V1_F{};

		class Land_i_House_Big_01_V1_F {
			price = 850000;
			numberCrates = 4;
			restrictedPos[] = {2,3};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {0,-2,3.8};
			conditions = "";
		};

		class Land_i_House_Big_01_V2_F : Land_i_House_Big_01_V1_F{};
		class Land_i_House_Big_01_V3_F : Land_i_House_Big_01_V1_F{};
		
		class Land_i_House_Big_01_b_yellow_F : Land_i_House_Big_01_V1_F{
			price = 1000000;
		};
		class Land_i_House_Big_01_b_pink_F : Land_i_House_Big_01_V1_F{};
		class Land_i_House_Big_01_b_blue_F : Land_i_House_Big_01_V1_F{};

		class Land_i_House_Small_01_V1_F {
			price = 350000;
			numberCrates = 2;
			restrictedPos[] = {};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {-1.5,0,2};
			conditions = "";
		};

		class Land_i_House_Small_01_V2_F : Land_i_House_Small_01_V1_F{};
		class Land_i_House_Small_01_V3_F : Land_i_House_Small_01_V1_F{};

		class Land_i_House_Small_02_V1_F {
			price = 200000;
			numberCrates = 2;
			restrictedPos[] = {};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {2,0,2.4};
			conditions = "";
		};

		class Land_i_House_Small_02_V2_F : Land_i_House_Small_02_V1_F{};
		class Land_i_House_Small_02_V3_F : Land_i_House_Small_02_V1_F{};

		class Land_i_House_Small_03_V1_F {
			price = 280000;
			numberCrates = 3;
			restrictedPos[] = {0,2,3,4};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {-3.3,1,2.5};
			conditions = "";
		};

		class Land_i_Stone_HouseSmall_V1_F {
			price = 120000;
			numberCrates = 1;
			restrictedPos[] = {0,1,3,4};
			canGarage = false;
			garageSpawnPos[] = {};
			garageSpawnDir = 0;
			garageBlacklists[] = {};
			lightPos[] = {0.90,2.3,4};
			conditions = "";
		};

		class Land_i_Stone_HouseSmall_V2_F : Land_i_Stone_HouseSmall_V1_F{};
		class Land_i_Stone_HouseSmall_V3_F : Land_i_Stone_HouseSmall_V1_F{};

		//Garages
		class Land_i_Garage_V1_F {
			price = 150000;
			numberCrates = 0;
			restrictedPos[] = {};
			canGarage = true;
			garageSpawnPos[] = {-11.5,0,0};
			garageSpawnDir = 90;
			garageBlacklists[] = {};
			lightPos[] = {};
			conditions = "";
		};

		class Land_i_Garage_V2_F : Land_i_Garage_V1_F{};
	};

};