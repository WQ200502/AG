class LifeCfgTraders {
	faces[] = {"PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20","WhiteHead_21","AfricanHead_01","AfricanHead_02","AfricanHead_03","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"};
	class Sunrise {
		//============ АПТЕКИ
		class KavMed { 
			className = "Sunrise_Trader_Medic";
			face = "";
			animations[] = {"HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"};
			position[] = {3652.36,12991.4,0.348577};
			direction = 282;
			actions[] = {
				"[localize 'STR_MF_Pharmacy',SunriseClient_system_weaponShopMenu,'apteka',0,false,false,'','',5]"
			};
		};
		class PirgMed: KavMed {
			position[] = {16812.9,12574.3,0.523001};
			direction = 178;
		};
		class AtirgMed: KavMed {
			position[] = {13936.6,18612.2,0.068985};
			direction = 296;
		};
		class SofiaMed: KavMed {
			position[] = {25665.8,21298,0.504999};
			direction = 310;
		};
		//============ АПТЕКИ
		
		//============ Магазин Грузовых Авто
		class KavTruck {
			className = "Sunrise_Trader_Basic";
			face = "";
			animations[] = {"HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"};
		    position[] = {3754.19,12377.2,0};
			direction = 132;
			actions[] = {
				"['Магазин грузовиков',SunriseClient_system_vehicleShopMenu,['avto_truck','car_truck','civ','Bruce New & Used Trucks',false],0,false,false,'','',5]"
			};
		};
		class PirgTruck: KavTruck {
		    position[] = {17182.6,13297.7,0};
			direction = 189;
			actions[] = {
				"['Магазин грузовиков',SunriseClient_system_vehicleShopMenu,['avto_truck','car_truck_1','civ','Bruce New & Used Trucks',false],0,false,false,'','',5]"
			};
		};
		//Магазин легковых авто
		class KavCar {
			className = "Sunrise_Trader_Basic";
			face = "";
			animations[] = {"HubStandingUC_idle1", "HubStandingUC_idle2", "HubStandingUC_idle3", "HubStandingUC_move1", "HubStandingUC_move2"};
			position[] = {3761.99,13020.5,0.220123};
			direction = 268;
			actions[] = {
				"[localize 'STR_MF_CarShop',SunriseClient_system_vehicleShopMenu,['avto_car',['car_kavala_1','car_kavala_2'],'civ','Bruce New & Used Auto',false],0,false,false,'','',5]"
			};
		};
		class AtirCar: KavCar {
			position[] = {13989.5,18828.7,0.163};
			direction = 173;
			actions[] = {
				"[localize 'STR_MF_CarShop',SunriseClient_system_vehicleShopMenu,['avto_car','car_atira_shop','civ','Bruce New & Used Auto',false],0,false,false,'','',5]"
			};
		};
		class PirgCar: KavCar {
			position[] = {16580.1,12715.5,0};
			direction = 46;
			actions[] = {
				"[localize 'STR_MF_CarShop',SunriseClient_system_vehicleShopMenu,['avto_car','car_pirgos_shop','civ','Bruce New & Used Auto',false],0,false,false,'','',5]"
			};
		};
		
		class RetroCar: KavCar {
			position[] = {13892.6,13547.8,0.141193};
			direction = 161;
			actions[] = {
				"[localize 'STR_MF_CarShop',SunriseClient_system_vehicleShopMenu,['retro_car','car_retro','civ','Bruce New & Used Auto',false],0,false,false,'','',5]"
			};
		};
		
		//============ МАГАЗИН ОДЕЖДЫ
		class KavCivCloth {
			className = "Sunrise_Trader_Basic";
			face = "";
			animations[] = {"AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"};
			position[] = {3689.38,13118.3,0.359535};
			direction = 313;
			actions[] = {				
				"[localize 'STR_MF_CivUniShop',SunriseClient_system_clothingMenu,'clothing',0,false,false,'','',5]"
			};
		};
		class PirgCivCloth: KavCivCloth {
			position[] = {16722.8,12759.9,0.45363};
			direction = 302;
		};
		class AtiraCivCloth: KavCivCloth {
			position[] = {14238.2,18769,0.0692158};
			direction = 28;
		};
		class IslandCivCloth: KavCivCloth {
			position[] = {14315.4,13020.4,0.153128};
			direction = 249;
		};
		
		// Одежда ополчения
		class ReblCivCloth: KavCivCloth {
			position[] = {21982.3,21026,1.06881};
			direction = 326;
			actions[] = {				
				"[localize 'STR_MF_ReblUniShop',SunriseClient_system_clothingMenu,'rebl_clot',0,false,false,'','',5]",
				"[localize 'STR_MF_ReblWeapShop',SunriseClient_system_weaponShopMenu,'rebl_gun',0,false,false,'','',5]"
			};
		};
		//============ МАГАЗИН ОДЕЖДЫ
		
		//============ УНИВЕРМАГИ
		class KavGenStore { 
			className = "Sunrise_Trader_Basic";
			face = "";
			animations[] = {"HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"};
			position[] = {3688.63,13101.5,0.618992};
			direction = 221;
			actions[] = {
				"[localize 'STR_MF_DepStore',SunriseClient_system_weaponShopMenu,'univermag',0,false,false,'','',5]"
			};
		};
		class AtirGenStore: KavGenStore {
			position[] = {14128.7,18725.1,0.27755};
			direction = 183;
		};
		class PirgGenStore: KavGenStore {
			position[] = {16664.2,12836.2,0.887772};
			direction = 24;
		}; 
		class SofiaGenStore: KavGenStore {
			position[] = {25781.3,21353.1,0.512331};
			direction = 307;
		};
		class IslandGenStore: KavGenStore {
			position[] = {14370,13108.2,0.0690002};
			direction = 341;
		};
		//============ УНИВЕРМАГИ

		//============ ЛИЦЕНЗИИ
		class KavalaLicense {
			className = "Sunrise_Trader_Basic";
			face = "";
			animations[] = {"HubBriefing_scratch", "HubBriefing_stretch", "HubBriefing_think", "HubBriefing_lookAround1", "HubBriefing_lookAround2"};
			position[] = {3698.24,12978.4,0.170896};
			direction = 85;
			actions[] = {
				"[localize 'STR_MF_LicShop',SunriseClient_system_licenseShop,'',0,true,true,'','playerSide == civilian',5]"
			};
		};
		class AtirLicense: KavalaLicense {
			position[] = {14049.4,18625.4,0.200001};
			direction = 116;
		};
		class PirgosLicense: KavalaLicense {
			position[] = {16828.9,12749.7,0.954};
			direction = 178;
		};	
		class SofiaLicense: KavalaLicense {
			position[] = {25646.4,21357.7,0.481001};
			direction = 312;
		};	
		//============ ЛИЦЕНЗИИ
		
		//============ Продуктовый магазин
		class KavProdShop {
			className = "Sunrise_Trader_Basic";
			face = "";
			animations[] = {"AidlPercMstpSnonWnonDnon_G01", "AidlPercMstpSnonWnonDnon_G02", "AidlPercMstpSnonWnonDnon_G03", "AidlPercMstpSnonWnonDnon_G04", "AidlPercMstpSnonWnonDnon_G05", "AidlPercMstpSnonWnonDnon_G06"};
			position[] = {3640.14,13069,0.250888};
			direction = 350;
			actions[] = {
				"[localize 'STR_MF_eatmarket1',SunriseClient_system_weaponShopMenu,'fastfood',0,false,false,'','',5]"
			};
		};
		class AtirProdShop: KavProdShop {
			position[] = {14207.3,18689.7,0.231503};
			direction = 208;
		};
		class PirgProdShop: KavProdShop {
			position[] = {16917,12751.1,0.576};
			direction = 313;
		};	
		class SofProdShop: KavProdShop {
			position[] = {25620.7,21298,0.326};
			direction = 125;
		};
		//============ Продуктовый магазин
	};
	class Tanoa {};
	class Malden {};
};