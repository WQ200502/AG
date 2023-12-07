class cfgInteractions
{
	
	/*class Plant  {
		title = "植物";
		action = "[] call ANZUS_RandomPlant;";
		check = "surfaceType position player == '#soil_surface' && isNull objectParent player && !isOnRoad player && (playerSide isEqualTo civilian || call (life_copdept) == 3) && count (call ANZUS_HasSeeds) > 0";
	};

	class Harvest  {
		title = "收获";
		action = "[ANZUS_Interaction_Target, player,life_carryWeight,life_maxWeight] remoteExec ['ANZUS_HarvestPlant', 2];";
		check = "typeOf (ANZUS_Interaction_Target) IN ANZUS_AllowedPlants && player distance ANZUS_Interaction_Target < 5 && isNull (objectParent player) && (playerSide isEqualTo civilian || call (life_copdept) == 3)";
	};*/
	class OpenATM  {
		title = "使用ATM";
		action = "[] spawn ANZUS_fnc_atmMenu;";
		check = "(call ANZUS_fnc_nearATM || typeof cursorObject in ['Land_Atm_02_F','Land_ATM_01_malden_F','Land_ATM_02_malden_F','Land_Mattaust_ATM']) && player getVariable 'restrained' isEqualto false && player distance cursorobject < 8";
	};

	class OpenCustomisation  {
		title = "车辆定制";
		action = "createDialog 'AnzusLife_VehicleCustomisation';";
		check = "(vehicle player) != player && (vehicle player) in life_vehicles && (player distance TuningShop) < 10";
	};

	class OpenATMCom  {
		title = "使用ATM";
		action = "[] spawn ANZUS_fnc_atmMenu;";
		check = "typeof cursorObject IN ['Land_CommonwealthBank','Land_ANZUS_bank','Land_Centrelink'] && player getVariable 'restrained' isEqualto false && player distance cursorobject < 13 && CursorObject getVariable 'brobbery' isEqualto false";
	};

	class SpawnMenu  {
		title = "生成菜单";
		action = "[] call ANZUS_fnc_spawnMenu;";
		check = "(vehicleVarName cursorObject) find 'SpawnMenu' > -1 && player getVariable 'restrained' isEqualto false && alive player";
	};

	class SetName  {
		title = "设置备注";
		action = "[] call AnzusLife_SetName;";
		check = "cursorObject isKindOf 'Man' && player distance cursorObject <= 5 && alive cursorobject && isPlayer cursorObject";
	};

	class ArtifactTurnIn  {
			title = "上缴文物";
			action = "[] spawn ANZUS_fnc_artifactReward";
			check = "alive cursorobject && (vehicleVarName cursorObject) find 'RelicTrader' > -1 && player getVariable ['mav_ttm_var_artifactReward',false] isEqualTo false";
		};
	class Whitelist  {
		title = "设置职位";
		action = "[playerSide] call AnzusLife_OpenWhitelist;";
		check = "cursorObject isKindOf 'Man' && player distance cursorObject <= 5 && alive cursorobject && !(cursorobject getVariable ['restrained',false]) && (playerSide isEqualto west || playerSide isEqualto independent) && (call(life_coplevel) >= 6 || call(life_mediclevel) >= 7) && isPlayer cursorObject";
	};

	class Unknown {
		title = "不明";
		action = "[cursorobject,'','','unknown'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Unknown' > -1 && playerSide isEqualto civilian";
	};
	
  class artifact1  {
		title = "收集人工品";
		action = "[] spawn ANZUS_fnc_artifact1";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'artifact1' > -1 &&  life_inv_artifact1 isEqualto 0 && player distance cursorObject < 5";
	};

	class artifact2  {
		title = "收集人工品";
		action = "[] spawn ANZUS_fnc_artifact2";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'artifact2' > -1 &&  life_inv_artifact2 isEqualto 0 && player distance cursorObject < 5";
	};

	class artifact3  {
		title = "收集人工品";
		action = "[] spawn ANZUS_fnc_artifact3";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'artifact3' > -1 &&  life_inv_artifact3 isEqualto 0 && player distance cursorObject < 5";
	};
	class artifact4  {
		title = "收集人工品";
		action = "[] spawn ANZUS_fnc_artifact4";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'artifact4' > -1 &&  life_inv_artifact4 isEqualto 0 && player distance cursorObject < 5";
	};

	class artifact5  {
		title = "收集人工品";
		action = "[] spawn ANZUS_fnc_artifact5";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'artifact5' > -1 &&  life_inv_artifact5 isEqualto 0 && player distance cursorObject < 5";
	};

	class artifact6  {
		title = "收集人工品";
		action = "[] spawn ANZUS_fnc_artifact6";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'artifact6' > -1 &&  life_inv_artifact6 isEqualto 0 && player distance cursorObject < 5";
	};

	class Market  {
		title = "市场";
		action = "[cursorobject,'','','market'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Supermarket' > -1 && playerSide isEqualto civilian && player distance cursorObject <= 5";
	};

	class Bunnings  {
		title = "邦宁斯";
		action = "[cursorobject,'','','bunnings'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'BunningsStore' > -1 && playerSide isEqualto civilian && player distance cursorObject <= 5";
	};

	class bar  {
		title = "酒吧";
		action = "[cursorobject,'','','bar'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Bar' > -1 && playerSide isEqualto civilian";
	};

	class PrisonCook  {
		title = "囚犯食物";
		action = "[cursorobject,'','','prison'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'PrisonCook' > -1 && playerSide isEqualto civilian && player distance cursorObject <= 5";
	};

	class JailGoods  {
		title = "出售/购买物品";
		action = "[cursorobject,'','','jail'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'JailGoods' > -1 && playerSide isEqualto civilian && life_is_arrested";
	};

	class GoldTrader  {
		title = "交易金条";
		action = "[cursorobject,'','','goldtrader'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GoldBuyer' > -1 && playerSide isEqualto civilian && player distance cursorObject <= 5";
	};

	class JailWeapons  {
		title = "购买武器";
		action = "['jail'] spawn ANZUS_fnc_weaponShopMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'JailGoods' > -1 && playerSide isEqualto civilian";
	};

	class GoldCoinTrader  {
		title = "硬币交易员";
		action = "[cursorobject,'','','goldcoin'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GoldCoinTrader' > -1 && playerSide isEqualto civilian && player distance cursorObject <= 5";
	};

	class IllegalTrader  {
		title = "非法交易者";
		action = "[cursorobject,'','','illegal'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'IllegalTrader' > -1 && playerSide isEqualto civilian";
	};

	class GasMarket  {
		title = "车站市场";
		action = "[cursorobject,'','','f_station_coffee'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GasStation' > -1 && player distance cursorObject <= 5";
	};

	class LotteryTicket {
		title = "购买乐透彩票";
		action = "[player] remoteExec [""AnzusLife_CheckTick"",2];";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GasStation' > -1 && player distance cursorObject <= 5";
	};

	class WongsMarket  {
		title = "王氏市场";
		action = "[cursorobject,'','','wongs'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Wongs' > -1 && player distance cursorObject <= 5";
	};

	class FishMarket  {
		title = "海鲜市场";
		action = "[cursorobject,'','','fishmarket'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Fish' > -1 && playerSide isEqualto civilian && player distance cursorObject <= 5";
	};

	class BurglaryMarket  {
		title = "盗窃贼市场";
		action = "[cursorobject,'','','burglary'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Burglary' > -1 && playerSide isEqualto civilian && player distance cursorObject <= 5";
	};

	class BurglaryShop  {
		title = "盗窃贼商店";
		action = "['Burglary'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Burglary' > -1 && playerSide isEqualto civilian && player distance cursorobject < 5";
	};

	class DrugDealer  {
		title = "毒贩子";
		action = "[cursorobject,'','','drugdealer'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (cursorobject distance player) < 7.5  && (vehicleVarName cursorObject) find 'DrugDealer' > -1 && playerSide isEqualto civilian";
	};

	class CartelDrugDealer  {
		title = "Cartel Drug Dealer";
		action = "[cursorobject,'','','drugdealer'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (cursorobject distance player) < 7.5  && (vehicleVarName cursorObject) find 'CartelDealer' > -1 && playerSide isEqualto civilian";
	};

	class RelicTurnIn  {
		title = "上交文物";
		action = "[] spawn ANZUS_fnc_relicReward";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'RelicTrader' > -1 && player getVariable ['mav_ttm_var_relicReward',false] isEqualTo false";
	};

	class CIATurnIn  {
		title = "上交CIA包裹";
		action = "[] spawn ANZUS_fnc_ciareward";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Shady' > -1 && player getVariable ['mav_ttm_var_ciaReward',false] isEqualTo false";
	};

	class thepriest  {
		title = "上交天使任务";
		action = "[] spawn ANZUS_fnc_angelreward";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'thepriest' > -1 && player getVariable ['mav_ttm_var_angelReward',false] isEqualTo false";
	};

	class RelicTurnInFed  {
		title = "上交美联储文物";
		action = "[] spawn ANZUS_fnc_relicRewardFed";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'RelicTrader' > -1 && player getVariable ['mav_ttm_var_relicReward2',false] isEqualTo false";
	};

	class RelicTurnInSat  {
		title = "上交卫星";
		action = "[] spawn ANZUS_fnc_satelliteReward";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'RelicTrader' > -1 && player getVariable ['mav_ttm_var_satellite',false] isEqualTo false";
	};

	class Archeologist  {
		title = "考古学家";
		action = "[cursorobject,'','','archeologist'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'RelicTrader' > -1 && playerSide isEqualto civilian && player getVariable ['mav_ttm_var_relicReward2',false]";
	};
	
	class Artsell  {
		title = "出售艺术品";
		action = "[cursorobject,'','','sellart'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'RelicTrader' > -1 && playerSide isEqualto civilian && player distance cursorobject < 5";
	};

	class Relic1  {
		title = "收集遗物";
		action = "[] spawn ANZUS_fnc_relic1";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Relic1' > -1 &&  life_inv_relic1 isEqualto 0 && player distance cursorObject < 5";
	};

	class Relic2  {
		title = "收集遗物";
		action = "[] spawn ANZUS_fnc_relic2";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Relic2' > -1 &&  life_inv_relic2 isEqualto 0 && player distance cursorObject < 5";
	};

	class Relic3  {
		title = "收集遗物";
		action = "[] spawn ANZUS_fnc_relic3";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Relic3' > -1 &&  life_inv_relic3 isEqualto 0 && player distance cursorObject < 5";
	};

	class Relic4 {
		title = "收集遗物";
		action = "[] spawn ANZUS_fnc_relic4";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Relic4' > -1 && life_inv_relic4 isEqualto 0 && player distance cursorObject < 5";
	};

	class cia1  {
		title = "收集CIA包";
		action = "[] spawn ANZUS_fnc_cia1";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'cia1' > -1 &&  life_inv_cia1 isEqualto 0 && player distance cursorObject < 5";
	};

	class cia2  {
		title = "收集CIA包";
		action = "[] spawn ANZUS_fnc_cia2";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'cia2' > -1 &&  life_inv_cia2 isEqualto 0 && player distance cursorObject < 5";
	};

	class cia3  {
		title = "收集CIA包";
		action = "[] spawn ANZUS_fnc_cia3";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'cia3' > -1 &&  life_inv_cia3 isEqualto 0 && player distance cursorObject < 5";
	};

	class cia4 {
		title = "收集CIA包";
		action = "[] spawn ANZUS_fnc_cia4";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'cia4' > -1 && life_inv_cia4 isEqualto 0 && player distance cursorObject < 5";
	};

	class angel1  {
		title = "看到光芒.";
		action = "[] spawn ANZUS_fnc_angel1";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'angel1' > -1 &&  life_inv_angel1 isEqualto 0 && player distance cursorObject < 5";
	};

	class angel2  {
		title = "看到光芒.";
		action = "[] spawn ANZUS_fnc_angel2";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'angel2' > -1 &&  life_inv_angel2 isEqualto 0 && player distance cursorObject < 5";
	};

	class angel3  {
		title = "看到光芒.";
		action = "[] spawn ANZUS_fnc_angel3";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'angel3' > -1 &&  life_inv_angel3 isEqualto 0 && player distance cursorObject < 5";
	};

	class ResetScore {
		title = "重设分数";
		action = "[] spawn ANZUS_fnc_resetScore";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Scorer' > -1";
	};

	class Scorer {
		title = "检查分数";
		action = "[] spawn ANZUS_fnc_checkScore";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Scorer' > -1";
	};

	class BailMan {
		title = "保释";
		action = "[] spawn ANZUS_fnc_postBail";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'BailMan' > -1 && playerSide isEqualto civilian && life_canpay_bail && life_is_arrested";
	};

	class GatherUnknown {
		title = "收集未知";
		action = "[] spawn ANZUS_fnc_gatherResearch";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GatherQuestion' > -1 && playerSide isEqualto civilian && isNull (objectParent player) && player distance cursorObject < 4";
	};

	class DestroySatellite {
		title = "摧毁卫星";
		action = "[] spawn ANZUS_fnc_destroySatellite";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'DestroySatellite' > -1 && playerSide isEqualto civilian && isNull (objectParent player) && player distance cursorObject < 4";
	};

	class GeneralStore  {
		title = "普通商店";
		action = "['genstore'] spawn ANZUS_fnc_weaponShopMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Supermarket' > -1 && playerSide isEqualto civilian";
	};

	class GasGeneralStore  {
		title = "车站商店";
		action = "['f_station_store'] spawn ANZUS_fnc_weaponShopMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GasStation' > -1 && playerSide isEqualto civilian";
	};

	class RebelShop  {
		title = "武器店";
		action = "['rebel'] spawn ANZUS_fnc_weaponShopMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Rebel' > -1 && playerSide isEqualto civilian && player distance cursorobject < 5";
	};

	class AdvRebelShop  {
		title = "高级叛军";
		action = "['Advrebel'] spawn ANZUS_fnc_weaponShopMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Rebel' > -1 && playerSide isEqualto civilian && player distance cursorobject < 5";
	};

	class RebelClothingShop  {
		title = "叛军服装";
		action = "['rebel'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Rebel' > -1 && playerSide isEqualto civilian";
	};

	class GangsterClothing  {
		title = "黑帮服装";
		action = "['gangster'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GangsterClothing' > -1 && playerSide isEqualto civilian";
	};

	class RebelMarket  {
		title = "叛军市场";
		action = "[cursorobject,'','','rebel'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Rebel' > -1 && playerSide isEqualto civilian";
	};

	class WeaponShop  {
		title = "武器店";
		action = "['gun'] spawn ANZUS_fnc_weaponShopMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GunStore' > -1 && license_civ_gun && playerSide isEqualto civilian";
	};

	class GunClothing  {
		title = "高级服装";
		action = "['gun_clothing'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GunStore' > -1 && playerSide isEqualto civilian";
	};

	class WeaponShopLicense  {
		title = "枪证10000";
		action = "['','','','gun'] spawn ANZUS_fnc_buyLicense;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GunStore' > -1 && !license_civ_gun && playerSide isEqualto civilian";
	};

	class ClothingShop  {
		title = "布鲁斯的服装";
		action = "['bruce'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'ClothingShop' > -1 && playerSide isEqualto civilian";
	};

	class ClothingShopCID  {
		title = "便衣警察服装";
		action = "['bruce'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopShop' > -1 && playerSide isEqualto west";
	};

	class DivingGear  {
		title = "潜水装备";
		action = "['dive'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Boat' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && license_civ_dive";
	};

	class ChopShop  {
		title = "废车厂";
		action = "['','','','chop_shop_3'] call ANZUS_fnc_chopShopMenu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'ChopShop' > -1 && playerSide isEqualto civilian";
	};

	class VehicleShop  {
		title = "汽车商店";
		action = "['civ_car','civ',""Travis' New & Used Auto's""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'VehicleShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};
	class haohuaVehicleshop  {
		title = "豪华汽车商店";
		action = "['civ_haohua','civ',""haohua vehcile shop""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'haohuaVehShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};

	class DodgeVehicleShop  {
		title = "道奇汽车店";
		action = "['civ_dodge','civ',""Devo Dodge Dealer""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'DodgeVehShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};

	class ExoticVehicleShop  {
		title = "异国情调的车辆";
		action = "['civ_exotic','civ',""Dillons Exotic Car Dealership""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'ExoticVehShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};

	class MotorbikeVehicleShop  {
		title = "摩托车经销店";
		action = "['civ_motorbike','civ',""Mikes Motorbike Shop""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MotorbikeVehShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};
	
	class RebelVehicleShop  {
		title = "机动车行";
		action = "['rebel_car','civ',""Panini Vehicle Shop""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Rebel' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};

	class ChevVehicleShop  {
		title = "越野车";
		action = "['civ_chev','civ',""Jacks Chev Dealership""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'ChevVehShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};

	class JagVehicleShop  {
		title = "捷豹汽车";
		action = "['civ_jag','civ',""Jacks Jags""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'JagVehShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};

	class FordVehicleShop  {
		title = "福特汽车";
		action = "['civ_ford','civ',""Ford Dealership""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'FordVehShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};

	class MercVehicleShop  {
		title = "奔驰汽车";
		action = "['civ_merc','civ',""Mikes Merc Dealership""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MercVehShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};

	class BmwVehicleShop  {
		title = "宝马汽车";
		action = "['civ_bmw','civ',""BMW Dealership""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'BMWVehShop' > -1 && (playerSide isEqualto civilian || (call life_copdept) in [3,5,7])";
	};

	class TruckShop  {
		title = "卡车商店";
		action = "['civ_truck','civ',""New & Used Trucks""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Truck';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'TruckShop' > -1 && isNull (objectParent player) && playerSide isEqualto civilian";
	};

	class BoatShop  {
		title = "船商店";
		action = "['civ_ship','civ',""Lewis' Boat Rentals & Ownership""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Boat';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Boat' > -1 && isNull (objectParent player) && playerSide isEqualto civilian";
	};

	class BoatGarage  {
		title = "车库";
		action = "['Boat'] spawn AnzusLife_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Boat' > -1 && isNull (objectParent player) && playerSide isEqualto civilian";
	};

	class StoreBoat  {
		title = "存入船";
		action = "[] spawn ANZUS_fnc_storeVehicle;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Boat' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_garage_store";
	};

	class AirShop  {
		title = "飞机商店";
		action = "['civ_air','civ','Airial Autos'] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Air';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'AirShop' > -1 && isNull (objectParent player) && playerSide isEqualto civilian";
	};

	class AirGarage  {
		title = "飞机机库";
		action = "['Air'] spawn AnzusLife_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'AirShop' > -1 && isNull (objectParent player) && playerSide isEqualto civilian";
	};

	class StoreGarageAir  {
		title = "存放车辆";
		action = "[] spawn ANZUS_fnc_storeVehicle;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'AirShop' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_garage_store";
	};

	class Garage  {
		title = "车辆车库";
		action = "['Car'] spawn AnzusLife_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Garage' > -1 && isNull (objectParent player) && playerSide isEqualto civilian";
	};

	class RebGarage  {
		title = "车辆车库";
		action = "['Car'] spawn AnzusLife_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Rebel' > -1 && isNull (objectParent player) && playerSide isEqualto civilian";
	};

	class StoreGarage  {
		title = "存入车辆";
		action = "[] spawn ANZUS_fnc_storeVehicle;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Garage' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_garage_store";
	};

	class StoreGarage2  {
		title = "存入车辆";
		action = "[] spawn ANZUS_fnc_storeVehicle;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Rebel' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_garage_store";
	};

	class DriverLicense  {
		title = "驾驶证测试1000";
		action = "[] spawn ANZUS_fnc_licenseTestStart";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Licenses' > -1 && isNull (objectParent player) && !license_civ_driver && playerSide isEqualTo civilian";
	};

	class BoatLicense  {
		title = "船只驾驶执照100";
		action = "['','','','boat'] spawn ANZUS_fnc_buyLicense;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Licenses' > -1 && isNull (objectParent player) && !license_civ_boat && playerSide isEqualTo civilian";
	};

	class TruckLicense  {
		title = "卡车驾驶执照2000";
		action = "['','','','trucking'] spawn ANZUS_fnc_buyLicense;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Licenses' > -1 && isNull (objectParent player) && !license_civ_trucking && playerSide isEqualTo civilian";
	};

	class DivingLicense {
		title = "潜水执照200";
		action = "['','','','dive'] spawn ANZUS_fnc_buyLicense;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Boat' > -1 && isNull (objectParent player) && !license_civ_dive && playerSide isEqualTo civilian";
	};

	class ImpoundLot  {
		title = "扣押所";
		action = "['Impound'] spawn AnzusLife_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'ImpoundLot' > -1 && isNull (objectParent player)";
	};

	class RobStore  {
		title = "打劫商店";
		action = "[cursorObject,player] spawn ANZUS_fnc_robShops;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'GasStation' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian";
	};

	class RobArt  {
		title = "偷艺术品";
		action = "[cursorObject,player] spawn ANZUS_fnc_stealpainting;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'largep' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian";
	};

	class RobArt2  {
		title = "偷艺术品";
		action = "[cursorObject,player] spawn ANZUS_fnc_stealsmallpainting;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'smallp' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian";
	};

	class RobCasino  {
		title = "打劫赌场";
		action = "[cursorObject,player,'','Casino'] spawn ANZUS_fnc_majorGold";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CasinoVault' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian && player distance cursorObject < 5";
	};

	class DrillBank {
		title = "放置钻";
		action = "[cursorObject,player,'','Bank'] spawn ANZUS_fnc_placedrill;";
		check = "alive cursorobject && playerSide isEqualTo civilian && backpack player isEqualTo 'JD_Bag' && typeof cursorObject IN ['Land_CommonwealthBank','Land_ANZUS_bank','Land_buildingsCasino2'] && [cursorObject] call AnzusLife_GetDoor IN ['door11','vault_door','buildingcasino2_vaultdoor']";
	};

	class DrillBankFed {
		title = "放置钻";
		action = "[cursorObject,player,'','Fed'] spawn ANZUS_fnc_majorGold;";
		check = "alive cursorobject && playerSide isEqualTo civilian && backpack player isEqualTo 'JD_Bag' && typeof cursorObject isEqualTo 'Land_bludsatcombunker_v' && [cursorObject] call AnzusLife_GetDoor IN ['door_1']";
	};

	class CheckBank {
		title = "数钱";
		action = "['count'] spawn ANZUS_fnc_bankJobTake;";
		check = "alive cursorobject && playerSide isEqualTo civilian && player distance cursorObject < 2 && (cursorObject getVariable [""vault_money"",0]) > 0 && typeof cursorObject IN ['A3L_MoneyPile']";
	};

	class TakeBank {
		title = "填满袋子";
		action = "['take'] spawn ANZUS_fnc_bankJobTake;";
		check = "alive cursorobject && playerSide isEqualTo civilian && player distance cursorObject < 2 && (cursorObject getVariable [""vault_money"",0]) > 0 && typeof cursorObject IN ['A3L_MoneyPile']";
	};

	class CheckCasino {
		title = "数金子";
		action = "['count'] spawn ANZUS_fnc_CasinoJobTake;";
		check = "alive cursorobject && playerSide isEqualTo civilian && player distance cursorObject < 2 && (cursorObject getVariable [""vault_gold"",0]) > 0 && typeof cursorObject IN ['HL_Or']";
	};

	class TakCasino {
		title = "填满袋子";
		action = "['take'] spawn ANZUS_fnc_CasinoJobTake;";
		check = "alive cursorobject && playerSide isEqualTo civilian && player distance cursorObject < 2 && (cursorObject getVariable [""vault_gold"",0]) > 0 && typeof cursorObject IN ['HL_Or']";
	};

	class MoneyLaunder  {
		title = "洗钱";
		action = "[cursorObject] spawn ANZUS_fnc_launderMoney;";
		check = "alive player && (vehicleVarName cursorObject) find 'MoneyLaunder' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian";
	};

	class TransportMissions  {
		title = "开始任务";
		action = "['Update coming to this, please stand by for this.',true,'slow'] spawn ANZUS_fnc_notificationSystem";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'TransportMission' > -1 && isNull (objectParent player) && playerSide isEqualTo civilian";
	};

	class ItemShopCop  {
		title = "物品商店";
		action = "[cursorobject,'','','cop'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopShop' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class ClothingShopCop  {
		title = "警察制服";
		action = "['cop'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopShop' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class WeaponShopCop  {
		title = "警察武器";
		action = "['cop'] spawn ANZUS_fnc_weaponShopMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopShop' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class RefillMagsCop  {
		title = "填满子弹";
		action = "[] spawn ANZUS_fnc_refillMags;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopShop' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class RefillMagsCiv  {
		title = "填满子弹";
		action = "[] spawn ANZUS_fnc_refillMags;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'Rebel' > -1 && playerSide isEqualto civilian && player getVariable ['inHostage',false] isEqualTo false";
	};

	class VehicleShopCop  {
		title = "车辆商店";
		action = "['cop_car','cop',""Police Vehicle Shop""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopGarage' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class VehicleShopCopUC  {
		title = "便衣警察车店";
		action = "['uc_car','cop',""Police UC Shop""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopGarage' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class VehicleShopCopSWAT  {
		title = "特警车店";
		action = "['swat_car','cop',""SWAT Car Shop""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopGarage' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class SheriffCar  {
		title = "洲警察车店";
		action = "['sheriff_car','cop',""Sheriff Car Shop""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopGarage' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false && (call life_copdept) in [3]";
	};

	class GarageCop  {
		title = "车辆车库";
		action = "['Car'] spawn AnzusLife_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopGarage' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};
	

	class StoreGarageCop  {
		title = "存放车辆";
		action = "[] spawn ANZUS_fnc_storeVehicle;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopGarage' > -1 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && !life_garage_store";
	};

	class AirShopCop  {
		title = "警察飞机商店";
		action = "['cop_air','cop','Police Helis'] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Air';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopAir' > -1 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class AirGarageCop  {
		title = "飞机机库";
		action = "['Air'] spawn AnzusLife_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopAir' > -1 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class StoreGarageAirCop  {
		title = "存放车辆";
		action = "[] spawn ANZUS_fnc_storeVehicle;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopAir' > -1 && isNull (objectParent player) && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && !life_garage_store";
	};

	class BoatShopCop  {
		title = "警察船店";
		action = "['cop_boat','cop',""Police's Boats and Watercraft""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Boat';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopBoat' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class BoatShopMedic  {
		title = "救护船店";
		action = "['med_ship','cop',""Medic's Boats and Watercraft""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Boat';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MedicBoat' > -1 && playerSide isEqualto independent && player getVariable ['inHostage',false] isEqualTo false";
	};

	class BoatGarageCop  {
		title = "车库";
		action = "['Boat'] spawn AL_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopBoat' > -1 && playerSide isEqualto west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class CopDivingGear  {
		title = "潜水装备";
		action = "['cop_boat'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CopBoat' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false";
	};

	class DropFishingNet  {
		title = "落网";
		action = "[] spawn ANZUS_fnc_dropFishingNet;";
		check = "(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf ""Ship"") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped";
	};

	class PlaceSpike  {
		title = "放置针刺钉";
		action = "detach life_spikeStrip; life_spikeStrip = objNull;";
		check = "!isNull life_spikestrip && isNull (objectParent player)";
	};

	class PackupSpike  {
		title = "拿起针刺钉";
		action = "[] spawn ANZUS_fnc_packupSpikes";
		check = "_spikes = nearestObjects[getPos player,['Land_Razorwire_F'],8] select 0; !isNil ""_spikes"" && !isNil {(_spikes getVariable ""AnzusLife_DroppedItem"")}";
	};

	class HealHospital  {
		title = "医疗救助";
		action = "[cursorObject] spawn ANZUS_fnc_healHospital";
		check = "(vehicleVarName cursorObject) find 'MedicAssist' > -1 && player distance cursorobject < 5";
	};

	class ItemShopMedic  {
		title = "物品商店";
		action = "[cursorobject,'','','med_market'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MedicShop' > -1 && playerSide isEqualTo independent";
	};

	class MedicMission  {
		title = "器官运输";
		action = "[] spawn ANZUS_Fnc_MedMissionstart";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MedMission' > -1 && playerSide isEqualTo independent";
	};

	class WeaponShopMedic  {
		title = "实用商店";
		action = "['med_basic'] spawn ANZUS_fnc_weaponShopMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MedicShop' > -1 && playerSide isEqualTo independent";
	};

	class ClothingShopMedic  {
		title = "救护服装店";
		action = "['med_clothing'] spawn ANZUS_fnc_clothingMenu;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MedicShop' > -1 && playerSide isEqualTo independent";
	};

	class VehicleShopMedic  {
		title = "汽车商店";
		action = "['med_shop','med',""Medic Vehicle Shop""] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Car';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MedicGarage' > -1 && playerSide isEqualTo independent";
	};

	class GarageMedic  {
		title = "车辆车库";
		action = "['Car'] spawn AnzusLife_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MedicGarage' > -1 && playerSide isEqualTo independent";
	};

	class StoreGarageMedic  {
		title = "存放车辆";
		action = "[] spawn ANZUS_fnc_storeVehicle;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MedicGarage' > -1 && playerSide isEqualTo independent && !life_garage_store";
	};

	class AirMedShop  {
		title = "救护飞机店";
		action = "['med_air_hs','med','Medic Helis'] spawn ANZUS_fnc_vehicleShopMenu; AL_CurrentVehicleShop = 'Air';";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'AirMedShop' > -1 && playerSide isEqualTo independent";
	};

	class AirGarageMed  {
		title = "飞机机库";
		action = "['Air'] spawn AnzusLife_Garage;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'AirMedShop' > -1 && playerSide isEqualto independent";
	};

	class MafiaPerk  {
		title = "黑客通缉名单";
		action = "[] spawn AnzusLife_MafiaWantedList;";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MafiaPerk' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && ((group player) getVariable ['gang_id',-1]) isEqualto (missionNameSpace getVariable ['AnzusLife_Cartel',0])";
	};

	class HackmainframshipReset  {
		title = "重置访问密码";
		action = "[mainFrame] call ANZUS_fnc_resetCommandCodes;";
		check = "alive cursorobject && player distance cursorObject <= 3 && (vehicleVarName cursorObject) isEqualTo 'mainFrame' && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false";
	};

	class Hackmainframship  {
		title = "黑客主机架";
		action = "[mainFrame] call ANZUS_fnc_hackMainframe;";
		check = "alive cursorobject && player distance cursorObject <= 3 && (vehicleVarName cursorObject) isEqualTo 'mainFrame' && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false";
	};

	class Hackmship1  {
		title = "黑客电脑 1";
		action = "[1,computer1] call ANZUS_fnc_hackComputer;";
		check = "alive cursorobject && player distance cursorObject <= 3 && (vehicleVarName cursorObject) isEqualTo 'computer1' && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false";
	};

	class Hackmship2  {
		title = "黑客电脑 2";
		action = "[2,computer2] call ANZUS_fnc_hackComputer;";
		check = "alive cursorobject && player distance cursorObject <= 3 && (vehicleVarName cursorObject) isEqualTo 'computer2' && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false";
	};

	class Hackmship3  {
		title = "黑客电脑 3";
		action = "[3,computer3] call ANZUS_fnc_hackComputer;";
		check = "alive cursorobject && player distance cursorObject <= 3 && (vehicleVarName cursorObject) isEqualTo 'computer3' && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false";
	};

	class Hackmship4  {
		title = "黑客电脑 4";
		action = "[4,computer4] call ANZUS_fnc_hackComputer;";
		check = "alive cursorobject && player distance cursorObject <= 3 && (vehicleVarName cursorObject) isEqualTo 'computer4' && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false";
	};

	class Dodstationfed  {
		title = "黑客电脑";
		action = "[] spawn AnzusLife_HackDoD;";
		check = "alive cursorobject && player distance cursorObject <= 3 && (vehicleVarName cursorObject) isEqualTo 'dodlaptop' && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false";
	};

	class hackfed  {
		title = "黑客电脑";
		action = "[] spawn AnzusLife_HackFed;";
		check = "alive cursorobject && player distance cursorObject <= 3 && (vehicleVarName cursorObject) isEqualTo 'fedpcvault' && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false";
	};

	class TakeHostage  {
		title = "劫持人质";
		action = "[cursorobject] spawn AnzusLife_TakeHostage;";
		check = "isNil 'AnzusLife_EnableHostage' && isPlayer CursorObject && (handgunWeapon player != """") && cursorobject getVariable ['inHostage',false] isEqualto false && player getVariable ['inHostage',false] isEqualto false && (currentWeapon player != """") && currentWeapon player != primaryWeapon player && isPlayer cursorobject && (player distance cursorobject < 2) && (([cursorobject, player] call BIS_fnc_relativeDirTo) < 220) && (([cursorobject, player] call BIS_fnc_relativeDirTo) > 130) && cursorObject getVariable [""life_is_alive"",true] && playerSide isEqualto civilian && player getVariable 'restrained' isEqualto false";
	};

	class ReleaseHostage  {
		title = "释放人质";
		action = "AnzusLife_EnableHostage = false;";
		check = "!isNil 'AnzusLife_EnableHostage'";
	};

	class PointGunForward  {
		title = "把枪支指向前";
		action = "AnzusLife_HostageMode = 'shoot';";
		check = "!isNil 'AnzusLife_EnableHostage' && AnzusLife_HostageMode isEqualto 'hostage'";
	};

	class PointGunHostage  {
		title = "用枪指着人质";
		action = "AnzusLife_HostageMode = 'hostage';";
		check = "!isNil 'AnzusLife_EnableHostage' && AnzusLife_HostageMode isEqualto 'shoot'";
	};

	class OpenPump  {
		title = "使用泵";
		action = "[] spawn ANZUS_fnc_fuelStatOpen;";
		check = "player distance cursorObject < 15 && typeof cursorObject in ['land_pop_gasolinera','Land_FuelStation_01_pump_F','Land_FuelStation_02_pump_F']";
	};

	class CaptureMafia  {
		title = "占领黑手党基地";
		action = "['Mafia',cursorObject] spawn AnzusLife_CaptureBase";
		check = "playerSide isEqualTo civilian && !isNil {(group player) getVariable 'gang_owner'} && player distance cursorobject < 5 && (vehicleVarName cursorObject) find 'MafiaBase' > -1 && ((cursorobject getVariable [""owner"",0]) != (group player getVariable [""gang_id"",0])) && (group player getVariable [""gang_role"",[]] select 0) == 1 && (!(cursorobject getVariable [""inCapture"",false]))";
	};

	class DecaptureMafia  {
		title = "破坏黑手党基地";
		action = "['Mafia',cursorObject] spawn AnzusLife_DecaptureBase";
		check = "playerSide isEqualTo civilian && !isNil {(group player) getVariable 'gang_owner'} && player distance cursorobject < 5 && (vehicleVarName cursorObject) find 'MafiaBase' > -1 && (missionNamespace getVariable [""AnzusLife_Mafia"",0]) > 0 && ((cursorobject getVariable [""owner"",0]) != (group player getVariable [""gang_id"",0])) && (group player getVariable [""gang_role"",[]] select 0) != 1 && (!(cursorobject getVariable [""inCapture"",false]))";
	};

	class CaptureCartel  {
		title = "占领卡特尔基地";
		action = "['Cartel',cursorObject] spawn AnzusLife_CaptureBase";
		check = "playerSide isEqualTo civilian && !isNil {(group player) getVariable 'gang_owner'} && player distance cursorobject < 5 && (vehicleVarName cursorObject) find 'CartelBase' > -1 && ((cursorobject getVariable [""owner"",0]) != (group player getVariable [""gang_id"",0])) && (group player getVariable [""gang_role"",[]] select 0) == 2 && (!(cursorobject getVariable [""inCapture"",false]))";
	};

	class DecaptureCartel  {
		title = "破坏卡特尔基地";
		action = "['Cartel',cursorObject] spawn AnzusLife_DecaptureBase";
		check = "playerSide isEqualTo civilian && !isNil {(group player) getVariable 'gang_owner'} && player distance cursorobject < 5 && (vehicleVarName cursorObject) find 'CartelBase' > -1 && (missionNamespace getVariable [""AnzusLife_Cartel"",0]) > 0 && ((cursorobject getVariable [""owner"",0]) != (group player getVariable [""gang_id"",0])) && (group player getVariable [""gang_role"",[]] select 0) != 2 && (!(cursorobject getVariable [""inCapture"",false]))";
	};

	class TurninTruckMissionCartel {
		title = "卡车卸货";
		action = "['Cartel',cursorObject] spawn AnzusLife_HandIn";
		check = "playerSide isEqualTo civilian && !isNil {(group player) getVariable 'gang_owner'} && player distance cursorobject < 5 && (vehicleVarName cursorObject) find 'CartelStorageBox' > -1 && (missionNamespace getVariable [""AnzusLife_Cartel"",0]) > 0 && (group player getVariable [""gang_role"",[]] select 0) == 2 &&  !(isNull truckMissionVeh) && ((cursorobject distance truckMissionVeh) <= 40)";
	};

	class TurninTruckMissionMafia {
		title = "卡车卸货";
		action = "['Mafia',cursorObject] spawn AnzusLife_HandIn";
		check = "playerSide isEqualTo civilian && !isNil {(group player) getVariable 'gang_owner'} && player distance cursorobject < 5 && (vehicleVarName cursorObject) find 'MafiaStoragebox' > -1 && (missionNamespace getVariable [""AnzusLife_Cartel"",0]) > 0 && (group player getVariable [""gang_role"",[]] select 0) == 1 && !(isNull truckMissionVeh) && ((cursorobject distance truckMissionVeh) <= 40)";
	};

	class TurninTruckMissionCop {
		title = "卡车卸货";
		action = "['Cop',cursorObject] spawn AnzusLife_HandIn";
		check = "playerSide isEqualTo west && player distance cursorobject < 5 && (vehicleVarName cursorObject) find 'evidencelocker' > -1 && !(isNull truckMissionVeh) && ((cursorobject distance truckMissionVeh) <= 40)";
	};

	class JobMenu  {
		title = "工作菜单";
		action = "closeDialog 0; [] call AnzusLife_JobMenu;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && (typeof cursorObject isEqualTo 'Land_Centrelink') && {player distance cursorObject <= 6}";
	};

	class PickupPaycheck  {
		title = "拿取工资";
		action = "[] call AnzusLife_PickupPaycheck";
		check = "typeOf cursorObject isEqualto 'Land_Centrelink' && player distance cursorobject < 15";
	};

	class PickupItem  {
		title = "拿起物品";
		action = "CB = true; cbitem = cursorObject; cbitem enableSimulationGlobal true; cbitem attachTo [player,[0.2,2.2,1.3]]; cbitem setpos [getpos cbitem select 0,getpos cbitem select 1,0];";
		check = "player isKindOf 'Man' && alive player && player distance cursorObject <= 5 && cursorObject getVariable 'CB_Item_Owner' isEqualTo getPlayerUID player && CB isEqualTo false";
	};

	class PlaceItem  {
		title = "放置物品";
		action = "[getPosATL cbitem,vectorUp cbitem,vectorDir cbitem,typeOf cbitem] remoteExec ['AnzusLife_PlaceItem',2]; deleteVehicle cbitem; CB=false;";
		check = "player isKindOf 'Man' && alive player && CB";
	};

	class PlaceItemMethTable  {
		title = "放置物品";
		action = "[getPosATL cbitem,vectorUp cbitem,vectorDir cbitem,typeOf cbitem] remoteExec ['AnzusLife_PlaceItem',2]; deleteVehicle cbitem; MT=false;";
		check = "player isKindOf 'Man' && alive player && MT";
	};

	class RemoveItem  {
		title = "移除物品";
		action = "[cursorobject] call AnzusLife_CheckpointBuilderRemove;";
		check = "player isKindOf 'Man' && alive player && player distance cursorObject <= 5 && cursorObject getVariable 'CB_Item_Owner' isEqualto getPlayerUID player && CB isEqualTo false";
	};

	class SeizeItems  {
		title = "扣押物品";
		action = "[] spawn ANZUS_fnc_seizeWeapon;";
		check = "call(life_coplevel) > 0 && playerSide isEqualTo west && !(player getVariable ['inHostage',false]) && (count(nearestObjects [player,['weaponholder'],3])>0) && !(player getVariable ['playerSurrender',false]) && !(player getVariable ['restrained',false])";
	};

	class OpenDoor  {
		title = "撬大门";
		action = "[] spawn AnzusLife_OpenDoor;";
		check = "playerSide isEqualTo civilian && player getVariable ['restrained',false] isEqualTo false && player getVariable ['inHostage',false] isEqualTo false && life_inv_lockpick > 0 && (typeOf cursorObject) in ['Land_MainSection','Land_PoliceStation','Land_Gaol_Main','Land_prison','Land_Gate2','land_jf_sheriff_station_01','HL_Gendarmerie'] && !([cursorObject] call AnzusLife_GetDoor isEqualto '')";
	};
	class SearchEvidenceCop  {
		title = "搜索证据";
		action = "[cursorObject] spawn AnzusLife_SEARCHEVIDENCE;";
		check = "call(life_coplevel) > 0 && cursorObject getVariable ['isEvidence',false] && player distance cursorObject < 10 && ((playerSide) isEqualTo west)";
	};

	class SearchEvidenceCiv  {
		title = "毁灭证据";
		action = "[cursorObject] spawn AnzusLife_SEARCHEVIDENCE;";
		check = "cursorObject getVariable ['isEvidence',false] && player distance cursorObject < 10 && ((playerSide) isEqualTo civilian)";
	};

	class FixMajorSafe  {
		title = "固定保险箱";
		action = "closeDialog 0;[cursorObject] spawn ANZUS_fnc_safeFix;";
		check = "cursorObject getVariable ['bankOpen',false] && player distance cursorObject < 10 && ((playerSide) isEqualTo west)";
	};

	class seizeEvidence  {
		title = "扣押证据";
		action = "closeDialog 0;[cursorObject] spawn AnzusLife_seizeLoot;";
		check = "typeOf cursorObject IN ['HL_Or','A3L_MoneyPile'] && player distance cursorObject < 5 && ((playerSide) isEqualTo west)";
	};

	class RobEvidenceLocker  {
		title = "破开证据储物柜";
		action = "[cursorObject] spawn AnzusLife_RobEvidence;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && life_inv_boltcutter > 0 && typeOf cursorObject isEqualTo ""C_IDAP_supplyCrate_F"" && player distance cursorObject < 3 && cursorObject getVariable [""Robbed"",false] isEqualto false && (vehicleVarName cursorObject) find 'evidencelocker' > -1";
	};

	class LockEvidence  {
		title = "锁上证据储物柜";
		action = "['You have locked up the evidence locker.',true,'slow'] call ANZUS_fnc_notificationSystem; cursorObject setVariable ['Robbed',false,true];";
		check = "playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && typeOf cursorObject isEqualTo ""C_IDAP_supplyCrate_F"" && player distance cursorObject < 3 && cursorObject getVariable [""Robbed"",false]";
	};

	class SearchGarbage  {
		title = "搜索垃圾";
		action = "[] spawn AnzusLife_SearchGarbage;";
		check = "playerSide isEqualTo civilian && player getVariable ['restrained', false] isEqualTo false && player getVariable ['inHostage',false] isEqualTo false && player distance cursorObject < 3 && alive cursorobject && (vehicleVarName cursorObject) find 'anzuslife_Garbage' > -1";
	};

	class BreakDownDoor {
		title = "破门";
		action = "[cursorObject] spawn ANZUS_fnc_copBreakDoor; closeDialog 0;";
		check = "cursorObject isKindOf 'House' && call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && !isNil {cursorObject getVariable 'house_owner'} && player distance cursorObject <= 10";
	};

	class houseowner {
		title = "房子的主人";
		action = "[cursorObject] spawn ANZUS_fnc_copHouseOwner; closeDialog 0;";
		check = "cursorObject isKindOf 'House' && call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && !isNil {cursorObject getVariable 'house_owner'} && player distance cursorObject <= 10";
	};

	class SearchHouse {
		title = "搜索房屋";
		action = "[cursorObject] call ANZUS_fnc_raidHouse; closeDialog 0;";
		check = "cursorObject isKindOf 'House' && call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && !isNil {cursorObject getVariable 'house_owner'} && player distance cursorObject <= 10";
	};

	class LockupHouse {
		title = "锁上房屋";
		action = "[cursorObject] call ANZUS_fnc_lockupHouse; closeDialog 0;";
		check = "cursorObject isKindOf 'House' && call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && !isNil {cursorObject getVariable 'house_owner'} && player distance cursorObject <= 10";
	};

	class BuyHouse {
		title = "买房子";
		action = "closeDialog 0; [cursorObject] spawn ANZUS_fnc_buyHouse;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && isNil {cursorObject getVariable 'house_owner'} && !(cursorObject in life_vehicles) && player distance cursorObject <= 12 && (isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject)))";
	};

	class SellHouse {
		title = "卖房子";
		action = "closeDialog 0; [cursorObject] spawn ANZUS_fnc_sellHouse;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && ((cursorObject getVariable 'house_owner') select 0) isEqualTo (getPlayerUID player) && player distance cursorObject <= 15 && (isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject)))";
	};

	class PayHouse {
		title = "缴纳财产税";
		action = "closeDialog 0; [cursorObject] remoteExec ['AnzusLife_PropertyTaxCheck',2];";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && ((cursorObject getVariable 'house_owner') select 0) isEqualTo (getPlayerUID player) && player distance cursorObject <= 15 && (isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject))) && cursorobject getVariable ['house_tax',7] < 7";
	};

	class AccessGarageHouse {
		title = "存取车库";
		action = "['Car'] spawn AnzusLife_Garage;";
		check = "(isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject))) && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && ((cursorObject getVariable 'house_owner') select 0) isEqualTo (getPlayerUID player) && player distance cursorObject <= 15";
	};

	class StoreGarageHome {
		title = "存放车辆";
		action = "[cursorObject, player] spawn ANZUS_fnc_storeVehicle; closeDialog 0;";
		check = "(isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject))) && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && ((cursorObject getVariable 'house_owner') select 0) isEqualTo (getPlayerUID player) && player distance cursorObject <= 15";
	};

	class UnlockStorage {
		title = "解锁存储箱";
		action = "[cursorObject] spawn ANZUS_fnc_lockHouse; closeDialog 0;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && ((cursorObject getVariable 'house_owner') select 0) isEqualTo (getPlayerUID player) && cursorObject getVariable['locked',true] && player distance cursorObject <= 15 && (isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject)))";
	};

	class BlotUnlockStorage {
		title = "螺栓锁";
		action = "[cursorObject] spawn ANZUS_fnc_lockHouse; closeDialog 0;";
		check = "playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && cursorObject getVariable['locked',true] && player distance cursorObject <= 5 && life_inv_boltcutter >= 1 && typeof cursorObject in ['B_supplyCrate_F','Box_IND_Grenades_F']";
	};

	class LockStorage {
		title = "锁上存储箱";
		action = "[cursorObject] spawn ANZUS_fnc_lockHouse; closeDialog 0;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && ((cursorObject getVariable 'house_owner') select 0) isEqualTo (getPlayerUID player) && !(cursorObject getVariable ['locked',true]) && player distance cursorObject <= 15 && (isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject)))";
	};

	class LightsOn {
		title = "开灯";
		action = "[cursorObject] spawn ANZUS_fnc_lightHouseAction; closeDialog 0;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && ((cursorObject getVariable 'house_owner') select 0) isEqualTo (getPlayerUID player) && isNull (cursorObject getVariable ['lightSource',ObjNull]) && player distance cursorObject <= 15 && (isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject)))";
	};

	class LightsOff {
		title = "关灯";
		action = "[cursorObject] spawn ANZUS_fnc_lightHouseAction; closeDialog 0;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && ((cursorObject getVariable 'house_owner') select 0) isEqualTo (getPlayerUID player) && !isNull (cursorObject getVariable ['lightSource',ObjNull]) && player distance cursorObject <= 15 && (isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject)))";
	};

	class MutePlayer  {
		title = "静音玩家";
		action = "['Mute',cursorObject] spawn AnzusLife_PlayerVoice;";
		check = "player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && player distance cursorObject <= 6 && isNull (objectParent player) && cursorObject getVariable ['AnzusLife_Muted',false] isEqualto false && call(life_adminlevel) > 0";
	};

	class UnmutePlayer  {
		title = "取消静音玩家";
		action = "['Unmute',cursorObject] spawn AnzusLife_PlayerVoice;";
		check = "player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && player distance cursorObject <= 6 && isNull (objectParent player) && cursorObject getVariable ['AnzusLife_Muted',false] && call(life_adminlevel) > 0";
	};

	class StabilizePlayer {
		title = "稳定玩家";
		action = "closeDialog 0; [cursorObject] spawn AnzusLife_StabilizePlayer";
		check = "life_inv_stabilizer > 0 && player getVariable ['inHostage',false] isEqualTo false && !(alive cursorObject) && player distance cursorObject <= 3 && isNull (objectParent player)";
	};

	class RevivePlayer {
		title = "复活";
		action = "closeDialog 0; [cursorObject] call AnzusLife_BleedoutRevivePlayer";
		check = "cursorObject getVariable ['incapacitated', false] && playerSide isEqualto independent && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && player distance cursorObject <= 3 && isNull (objectParent player)";
	};

	class TiePerson {
		title = "绑起玩家";
		action = "[] spawn ANZUS_fnc_tieingAction; closeDialog 0;";
		check = "alive cursorObject && isPlayer cursorObject && !(cursorObject getVariable ['restrained', false]) && player distance cursorObject <= 3.5 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && life_inv_zipties > 0 && ((animationState cursorObject) == 'Incapacitated' || (animationState cursorObject) == 'unconscious' || (animationState cursorObject) == 'unconsciousoutprone' || cursorObject getVariable 'playerSurrender')";
	};

	class Unrestrain {
		title = "释放玩家";
		action = "[cursorObject] spawn ANZUS_fnc_unrestrain;";
		check = "((call(life_coplevel) > 0 && playerSide isEqualTo west) || (playerSide isEqualTo civilian && playerSide isEqualTo (cursorObject getVariable ['restrainType',sideEmpty]))) && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && cursorObject getVariable ['restrained',false] && player distance cursorObject <= 6 && isNull (objectParent player) && !(player getVariable ['restrained',false])";
	};

	class CheckLicences {
		title = "检查许可证";
		action = "[player] remoteExec [""ANZUS_fnc_licenseCheck"",cursorObject]";
		check = "((call(life_coplevel) > 0 && playerSide isEqualTo west) || (playerSide isEqualTo civilian && playerSide isEqualTo (cursorObject getVariable ['restrainType',sideEmpty]))) && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && cursorObject getVariable ['restrained',false] && player distance cursorObject <= 6 && isNull (objectParent player)";
	};

	class SearchPlayer {
		title = "玩家搜身";
		action = "[cursorObject] spawn ANZUS_fnc_searchAction; closeDialog 0;";
		check = "(call(life_coplevel)) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && cursorObject getVariable ['restrained',false] && player distance cursorObject <= 6 && isNull (objectParent player)  && !(player getVariable ['restrained',false])";
	};

	class SearchPlayerCiv {
		title = "玩家搜身";
		action = "[] remoteExecCall ['ANZUS_fnc_removeWeaponAction',cursorObject]; closeDialog 0;";
		check = " playerSide isEqualTo civilian && (playerSide isEqualTo (cursorObject getVariable ['restrainType',sideEmpty])) && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && cursorObject getVariable ['restrained',false] && player distance cursorObject <= 6 && isNull (objectParent player)  && !(player getVariable ['restrained',false])";
	};

	class EscortPlayer {
		title = "押送玩家";
		action = "[cursorObject] spawn ANZUS_fnc_escortAction; closeDialog 0;";
		check = "((call(life_coplevel) > 0 && playerSide isEqualTo west) || (playerSide isEqualTo civilian && playerSide isEqualTo (cursorObject getVariable ['restrainType',sideEmpty]))) && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && !(cursorObject getVariable ['Escorting',false]) && player distance cursorObject <= 6 && isNull (objectParent player) && ((cursorObject getVariable['restrained',false]))  && !(player getVariable ['restrained',false])";
	};

	class StopEscortPlayer {
		title = "停止押送";
		action = "[] call ANZUS_fnc_stopEscorting; closeDialog 0;";
		check = "player getVariable ['inHostage',false] isEqualTo false && player getVariable ['isEscorting',false] && isNull (objectParent player)";
	};

	class TicketPlayer {
		title = "给玩家罚单";
		action = "closeDialog 0; [cursorObject] call ANZUS_fnc_ticketAction;";
		check = "call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && player distance cursorObject <= 6 && isNull (objectParent player)";
	};

	class TakeBlood {
		title = "取血";
		action = "closeDialog 0; [cursorObject,player] remoteExec ['ANZUS_fnc_medBDinit',CursorTarget];";
		check = "call(life_mediclevel) > 0 && playerSide isEqualTo independent && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && player distance cursorObject <= 6 && isNull (objectParent player)";
	};

	class ArrestPlayer {
		title = "拘捕玩家";
		action = "closeDialog 0; [cursorObject] spawn ANZUS_fnc_openArrestMenu;";
		check = "call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && cursorObject getVariable ['restrained',false] && player distance cursorObject <= 6 && isNull (objectParent player) && player distance (getMarkerPos 'jail_marker') < 500 && !(player getVariable ['restrained',false])";
	};

	class PutInCar {
		title = "把玩家放入车辆";
		action = "[cursorObject] call ANZUS_fnc_putInCar;";
		check = "((call(life_coplevel) > 0 && playerSide isEqualTo west) || (playerSide isEqualTo civilian && playerSide isEqualTo (cursorObject getVariable ['restrainType',sideEmpty]))) && player getVariable ['inHostage',false] isEqualTo false && alive cursorObject && isPlayer cursorObject && cursorObject getVariable ['restrained',false] && player distance cursorObject <= 5 && !(player getVariable ['restrained',false])";
	};

	class RobPerson {
		title = "打劫玩家";
		action = "call ANZUS_fnc_robAction;";
		check = "alive cursorObject && isPlayer cursorObject && !(cursorObject getVariable ['robbed',false]) && player distance cursorObject <= 3.5 && ((animationState cursorObject) == 'Incapacitated' || (animationState cursorObject) == 'unconscious' || (animationState cursorObject) == 'unconsciousoutprone' || cursorObject getVariable ['playerSurrender',false] || (playerSide isEqualTo civilian && playerSide isEqualTo (cursorObject getVariable ['restrainType',sideEmpty]))) && !(player getVariable ['restrained',false])";
	};

	class PushVehicle {
		title = "推车辆";
		action = "[cursorObject] spawn ANZUS_fnc_pushVehicle; closeDialog 0;";
		check = "(cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 8 && local cursorObject && isNull (objectParent player)";
	};

	class RepairVehicle {
		title = "修理车辆";
		action = "[cursorObject] spawn ANZUS_fnc_repairTruck; closeDialog 0;";
		check = "(cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 8 && isNull (objectParent player)";
	};

	class LockpickVehicle {
		title = "撬开车辆";
		action = "[] spawn anzus_fnc_melockpick; closeDialog 0;";
		check = "(cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 8 && life_inv_lockpick > 0 && isNull (objectParent player) && alive cursorObject && locked cursorObject isEqualTo 2";
	};

	class GPSVehicle {
		title = "跟踪车辆";
		action = "[cursorObject] spawn ANZUS_fnc_gpsTracker; closeDialog 0;";
		check = "(cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 8 && life_inv_gpstracker > 0 && isNull (objectParent player) && alive cursorObject";
	};

	class FillVehicle {
		title = "车辆加油";
		action = "[cursorObject] spawn ANZUS_fnc_gangConvoyFill; closeDialog 0;";
		//check = "cursorObject isKindOf 'Car' && player distance cursorObject <= 8 && typeOf cursorObject isEqualto 'C_Truck_02_covered_F' && isNull (objectParent player) && alive cursorObject && cursorObject getVariable 'convoyFilled' isEqualto false && cursorObject getVariable 'notFilled' && cursorObject getVariable 'convoyFinished' isEqualto false && cursorObject getVariable 'convoyMid'";
		check = "cursorObject isKindOf 'Car' && player distance cursorObject <= 8 && typeOf cursorObject isEqualto 'C_Truck_02_covered_F' && isNull (objectParent player) && alive cursorObject && cursorObject getVariable 'convoyFilled' isEqualto false && cursorObject getVariable 'notFilled' && cursorObject getVariable 'convoyFinished' isEqualto false && cursorObject getVariable 'convoyMid'";
	};

	class DeliverSupplies {
		title = "运送物资";
		action = "[cursorObject] spawn ANZUS_fnc_gangConvoyFinish; closeDialog 0;";
		check = "cursorObject isKindOf 'Car' && player distance cursorObject <= 8 && typeOf cursorObject isEqualto 'C_Truck_02_covered_F' && isNull (objectParent player) && alive cursorObject && cursorObject getVariable 'convoyFilled' && cursorObject getVariable 'notFilled' isEqualto false && cursorObject getVariable 'convoyFinished' && cursorObject getVariable 'convoyEnd' isEqualto false";
	};

	class Registration {
		title = "车辆信息";
		action = "[cursorObject] spawn ANZUS_fnc_searchVehAction; closeDialog 0;";
		check = "call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && (cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 6 && isNull (objectParent player) &&  !(cursorobject isEqualTo truckMissionVeh)";
	};

	class SearchVehicle {
		title = "搜索车辆";
		action = "[cursorObject] spawn ANZUS_fnc_vehInvSearch; closeDialog 0;";
		check = "call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && (cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 6 && isNull (objectParent player)";
	};

	class PulloutPlayers {
		title = "拉出所有玩家";
		action = "[cursorObject] spawn ANZUS_fnc_pulloutAction; closeDialog 0;";
		check = "playerSide in [west,independent] && (cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 6 && isNull (objectParent player) && count crew cursorObject > 0 && !(player getVariable ['restrained',false])";
	};

	class ImpoundVehicle {
		title = "扣押车辆";
		action = "[cursorObject] spawn ANZUS_fnc_impoundAction; closeDialog 0;";
		check = "call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && (cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 6 && isNull (objectParent player) && !(cursorobject isEqualTo truckMissionVeh) && !(player getVariable ['restrained',false])";
	};

	class PulloutPlayersCiv {
		title = "拉出所有玩家";
		action = "[cursorObject] spawn ANZUS_fnc_pulloutAction; closeDialog 0;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && cursorObject in life_vehicles && (cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 6 && isNull (objectParent player) && count crew cursorObject > 0 && !(player getVariable ['restrained',false])";
	};

	class ImpoundVehicleMed {
		title = "扣押车辆";
		action = "[cursorObject] spawn ANZUS_fnc_impoundAction; closeDialog 0;";
		check = "call(life_mediclevel) > 0 && playerSide isEqualTo independent && (cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 6 && isNull (objectParent player) && !(cursorobject isEqualTo truckMissionVeh)";
	};

	class UnflipVehicle {
		title = "翻车";
		action = "[cursorObject] call ANZUS_fnc_unflipveh; closeDialog 0;";
		check = "(cursorObject isKindOf 'Car' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 6 && isNull (objectParent player) && !(player getVariable ['restrained',false])";
	};

	class CheckLicenceInCar {
		title = "检查驾驶执照";
		action = "[player] remoteExec [""ANZUS_fnc_licenseCheck"",cursorObject]; closeDialog 0;";
		check = "call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && (cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 6 && isNull (objectParent player)";
	};

	class TicketDriverInCar {
		title = "给司机开罚单";
		action = "closeDialog 0; [cursorObject] call ANZUS_fnc_ticketAction;";
		check = "call(life_coplevel) > 0 && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && (cursorObject isKindOf 'Car' || cursorObject isKindOf 'Air' || cursorObject isKindOf 'Ship') && player distance cursorObject <= 6 && isNull (objectParent player) && cursorobject getVariable 'isTicketed' isEqualto 0";
	};

	class RemoveContainer  {
		title = "移除集装箱";
		action = "cursorObject spawn ANZUS_fnc_removeContainer;";
		check = "typeOf cursorObject isEqualto 'B_supplyCrate_F' && {player distance cursorObject < 3} || typeOf cursorObject isEqualTo 'Box_IND_Grenades_F' && {player distance cursorObject < 3}";
	};

	class SearchContainer  {
		title = "搜索集装箱";
		action = "[life_container_activeObj] spawn ANZUS_fnc_containerInvSearch;";
		check =  "typeOf cursorObject isEqualto 'B_supplyCrate_F' && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && call (life_coplevel) > 0 || typeOf cursorObject isEqualto 'Box_IND_Grenades_F' && playerSide isEqualTo west && player getVariable ['inHostage',false] isEqualTo false && call (life_coplevel) > 0";
	};

	class CoalProcessing  {
		title = "工艺煤";
		action = "closeDialog 0; [cursorobject,'coal'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CoalProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_coalOre > 0";
	};

	class IronProcessing  {
		title = "加工铁";
		action = "closeDialog 0; [cursorobject,'iron'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'IronProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_ironOre > 0";
	};

	class DiamondProcessing  {
		title = "加工钻石";
		action = "closeDialog 0; [cursorobject,'diamond'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'DiamondProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_diamondOre > 0";
	};

	class OilProcessing  {
		title = "加工油";
		action = "closeDialog 0; [cursorobject,'oil'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'OilProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_oil_unprocessed > 0";
	};

	class RubberProcessing  {
		title = "加工橡胶";
		action = "closeDialog 0; [cursorobject,'rubber'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'RubberProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_rubberU > 0";
	};

	class ClothProcessing  {
		title = "加工羊毛";
		action = "closeDialog 0; [cursorobject,'cloth'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'ClothProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_wool > 0";
	};

	class LSDProcessing  {
		title = "加工蘑菇";
		action = "closeDialog 0; [cursorobject,'lsd'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'LSDProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_mushrooms > 0";
	};

	class RubyProcessing  {
		title = "切割红宝石";
		action = "closeDialog 0; [cursorobject,'ruby'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'RubyProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_rubyU > 0";
	};

	class UraniumProcessing  {
		title = "加工铀";
		action = "closeDialog 0; [cursorobject,'uranium'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'UraniumProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_uraniumU > 0";
	};

	class MarijuanaProcessing  {
		title = "加工大麻";
		action = "closeDialog 0; [cursorobject,'marijuana'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'MarijuanaProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_cannabis > 0";
	};

	class CocaineProcessing  {
		title = "加工可卡因";
		action = "closeDialog 0; [cursorobject,'cocaine'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CocaineProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_cocaine_unprocessed > 0";
	};

	class HeroinProcessing  {
		title = "加工海洛因";
		action = "closeDialog 0; [cursorobject,'heroin'] spawn ANZUS_fnc_processAction";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'HeroinProcess' > -1 && playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && !life_is_processing && !life_action_inUse && life_inv_heroin_unprocessed > 0";
	};

	class IronTrader  {
		title = "商人";
		action = "[cursorobject,'','','iron'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'IronTrader' > -1 && playerSide isEqualTo civilian";
	};

	class CoalTrader  {
		title = "商人";
		action = "[cursorobject,'','','coal'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'CoalTrader' > -1 && playerSide isEqualTo civilian";
	};

	class DiamondTrader  {
		title = "商人";
		action = "[cursorobject,'','','diamond'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'DiamondTrader' > -1 && playerSide isEqualTo civilian";
	};

	class OilTrader  {
		title = "商人";
		action = "[cursorobject,'','','oil'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'OilTrader' > -1 && playerSide isEqualTo civilian";
	};

	class RubyTrader  {
		title = "商人";
		action = "[cursorobject,'','','jeweler'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'RubyTrader' > -1 && playerSide isEqualTo civilian";
	};

	class UraniumTrader  {
		title = "商人";
		action = "[cursorobject,'','','uranium'] spawn ANZUS_fnc_virt_menu";
		check = "alive cursorobject && (vehicleVarName cursorObject) find 'UraniumTrader' > -1 && playerSide isEqualTo civilian";
	};

	class PickupItems  {
		title = "拾取物品";
		action = "[] spawn ANZUS_fnc_pickupItems;";
		check = "alive player && player getVariable ['inHostage',false] isEqualTo false && ((typeOf cursorObject) == 'Land_Suitcase_F') && !(player getVariable ['restrained',false])";
	};

	class PickupMoney  {
		title = "拾取金钱";
		action = "closeDialog 0; if (cursorObject getVariable [""inUse"",false] isEqualto false) then {[cursorObject,player,true] remoteExecCall [""TON_fnc_pickupAction"",2]};";
		check = "alive player && player getVariable ['inHostage',false] isEqualTo false && ((typeOf cursorObject) == ""Land_Money_F"") && {!(cursorObject getVariable [""inUse"",false])} && player distance cursorObject < 5";
	};

	class RobHouse {
		title = "破门而入";
		action = "[cursorObject] spawn ANZUS_fnc_breakDownHouse; closeDialog 0;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && cursorObject getVariable['locked',true] && player distance cursorObject <= 15 && (isClass (missionConfigFile >> 'Housing' >> 'Anzus_Life' >> (typeOf cursorObject))) && (!(getPlayerUID player IN (cursorObject getVariable ['house_owner',[]]))) && cursorObject getVariable ['AnzusLife_HouseRobbed',false] isEqualTo false";
	};

	class RobHouseCrate {
		title = "开锁箱";
		action = "[cursorObject] spawn anzus_fnc_melockpickChest; closeDialog 0;";
		check = "playerSide isEqualTo civilian && player getVariable ['inHostage',false] isEqualTo false && cursorObject getVariable['AnzusLife_HouseRobberyCrate',false] && cursorObject getVariable ['AnzusLife_HouseRobberyCrateRobbed',false] isEqualto false && player distance cursorObject <= 5 && typeOf cursorObject isEqualTo 'plp_ct_MilBoxBigBlack'";
	};

	class PlaceC4Charge {
		title = "放置炸药";
		action = "[cursorObject] spawn AnzusLife_SWATRaid; closeDialog 0;";
		check = "!(player getVariable ['inHostage',false]) && (((toLower ([cursorobject] call AnzusLife_GetDoor)) find 'door') > -1) && !(cursorobject getVariable [format ['%1c4charge',([cursorobject] call AnzusLife_GetDoor)],false]) && life_inv_doorc4 >= 1 && !(player getVariable ['restrained',false]) && !(typeOf cursorObject IN ['Land_bludsatcombunker_d','Land_bludsatcombunker_v','Land_bludsatcombunker_c'])";
	};

	class PlaceC4ChargeFed {
		title = "放置炸药";
		action = "[cursorObject] spawn AnzusLife_FedExplosive; closeDialog 0;";
		check = "!(player getVariable ['inHostage',false]) && (((toLower ([cursorobject] call AnzusLife_GetDoor)) find 'door') > -1) && !(cursorobject getVariable [format ['%1c4charge',([cursorobject] call AnzusLife_GetDoor)],false]) && life_inv_bunkerdoorc4 >= 1 && !(player getVariable ['restrained',false])";
	};

	class DoorBolt {
		title = "螺栓门";
		action = "[cursorObject] spawn AnzusLife_BoltLock; closeDialog 0;";
		check = "!(player getVariable ['inHostage',false]) && (((toLower ([cursorobject] call AnzusLife_GetDoor)) find 'door') > -1) && !(cursorobject getVariable [format ['%1boltLocked',([cursorobject] call AnzusLife_GetDoor)],false]) && life_inv_boltLocker >= 1 && !(typeOf cursorObject IN ['Land_bludsatcombunker_d','Land_bludsatcombunker_v','Land_bludsatcombunker_c'])";
	};

	class RemoveDoorBolt {
		title = "移除门螺栓";
		action = "[cursorObject] spawn AnzusLife_RemoveBoltLock; closeDialog 0;";
		check = "!(player getVariable ['inHostage',false]) && (((toLower ([cursorobject] call AnzusLife_GetDoor)) find 'door') > -1) && (cursorobject getVariable [format ['%1boltLocked',([cursorobject] call AnzusLife_GetDoor)],false]) && life_inv_boltcutter >= 1";
	};

	class RemoveBankDoorBolt {
		title = "移除门螺栓";
		action = "[cursorObject] spawn AnzusLife_BoltBank; closeDialog 0;";
		check = "!(player getVariable ['inHostage',false]) && (((toLower ([cursorobject] call AnzusLife_GetDoor)) find 'door') > -1) && !(cursorobject getVariable [format ['%1boltLocked',([cursorobject] call AnzusLife_GetDoor)],false]) && life_inv_boltcutter >= 1 && typeof cursorObject in ['Land_CommonwealthBank','Land_ANZUS_bank','Land_buildingsCasino2']";
	};

	class PrintCartelMoney {
		title = "印钞票";
		action = "[] spawn AnzusLife_wifi; closeDialog 0;";
		check = "(vehicleVarName cursorObject) find 'money_printer' > -1 && player getVariable 'restrained' isEqualto false && alive player && playerSide isEqualto civilian && player distance cursorobject < 4";
	};
	class JawPlane {
		title = "使用生命之爪";
		action = "[] spawn AnzusLife_JawsPlane; closeDialog 0;";
		check = "typeOf cursorObject isEqualto 'Land_UWreck_MV22_F' && player getVariable 'restrained' isEqualto false && alive player && cursorTarget getVariable 'opened' isEqualto false && player distance cursorobject < 10";
	};

	class OpenPlane {
		title = "搜索飞机";
		action = "[] spawn AnzusLife_openPlane; closeDialog 0;";
		check = "typeOf cursorObject isEqualto 'Land_UWreck_MV22_F' && player getVariable 'restrained' isEqualto false && alive player && cursorTarget getVariable 'opened' isEqualto true && player distance cursorobject < 10";
	};

	class cookmethvan {
		title = "煮冰毒";
		action = "[] spawn AnzusLife_MethVanCook; closeDialog 0;";
		check = "!(missionNamespace getVariable ['mething',false]) && vehicle player isEqualTo player && playerSide isEqualTo civilian && (typeOf cursorObject in ['d3s_savana_05']) && player distance cursorObject < 4 && cursorTarget getVariable 'methvan' isEqualto true";
	};

	class cookmethtable {
		title = "煮冰毒";
		action = "[] spawn AnzusLife_cookdrugtable; closeDialog 0;";
		check = "!(CursorObject getVariable ['mething',false]) && vehicle player isEqualTo player && typeOf cursorObject isEqualto 'Apolia_Diablo_TB_Methamphetamine_01_F' && player distance cursorObject < 4";
	};

	class cookmethtable1 {
		title = "混合丙酮";
		action = "['Acetone'] call AnzusLife_upmethcooking; closeDialog 0;";
		check = "(CursorObject getVariable ['mething',true]) && !(CursorObject getVariable ['Action1',false]) && vehicle player isEqualTo player && typeOf cursorObject isEqualto 'Apolia_Diablo_TB_Methamphetamine_01_F' && player distance cursorObject < 4";
	};

	class cookmethtable2 {
		title = "混合伪麻黄碱";
		action = "['Pseudo'] call AnzusLife_upmethcooking; closeDialog 0;";
		check = "(CursorObject getVariable ['mething',true]) && !(CursorObject getVariable ['Action2',false]) && vehicle player isEqualTo player && typeOf cursorObject isEqualto 'Apolia_Diablo_TB_Methamphetamine_01_F' && player distance cursorObject < 4";
	};

	class cookmethtable3 {
		title = "冷却冰毒";
		action = "['Cool'] call AnzusLife_upmethcooking; closeDialog 0;";
		check = "(CursorObject getVariable ['mething',true]) && !(CursorObject getVariable ['Action3',false]) && vehicle player isEqualTo player && typeOf cursorObject isEqualto 'Apolia_Diablo_TB_Methamphetamine_01_F' && player distance cursorObject < 4";
	};

	class cookmethtable4 {
		title = "加热冰毒";
		action = "['Heat'] call AnzusLife_upmethcooking; closeDialog 0;";
		check = "(CursorObject getVariable ['mething',true]) && !(CursorObject getVariable ['Action4',false]) && vehicle player isEqualTo player && typeOf cursorObject isEqualto 'Apolia_Diablo_TB_Methamphetamine_01_F' && player distance cursorObject < 4";
	};

	class cookmethtable5 {
		title = "释放压力";
		action = "['Release'] call AnzusLife_upmethcooking; closeDialog 0;";
		check = "(CursorObject getVariable ['mething',true]) && !(CursorObject getVariable ['Action5',false]) && vehicle player isEqualTo player && typeOf cursorObject isEqualto 'Apolia_Diablo_TB_Methamphetamine_01_F' && player distance cursorObject < 4";
	};

    class MainFrameVirus {
        title = "主机病毒";
        action = "[] spawn ANZUS_fnc_Shipmainframe;";
        check = "cursorobject isEqualTo ShipMainFrame && playerSide isEqualto civilian  && player distance cursorObject < 5";
    };

    class USAFSystems {
        title = "进入美国空军系统";
        action = "[] spawn ANZUS_fnc_usaf;";
        check = "USAFTerminalOpener getVariable ['TerminalUnlocked', false] && cursorobject isEqualTo ShipMainFrame && playerSide isEqualto civilian  && player distance cursorObject < 5";
    };

    class HackDataStorage {
        title = "输入数据存储";
        action = "[] spawn ANZUS_fnc_datastorage;";
        check = "cursorobject isEqualTo ShipDataStorage && playerSide isEqualto civilian  && player distance cursorObject < 5";
    };

    class DownloadDataStorage {
        title = "下载数据";
        action = "[] spawn ANZUS_fnc_terminal;";
        check = "cursorobject isEqualTo ShipDataTerminal && playerSide isEqualto civilian  && player distance cursorObject < 5";
    };

    class UnlockDecrypter {
        title = "解锁解密程序";
        action = "[] spawn ANZUS_fnc_dodstorage;";
        check = "cursorobject isEqualTo USAFTerminalOpener && playerSide isEqualto civilian  && player distance cursorObject < 5";
    };

    class DecryptStolenData {
        title = "解密数据";
        action = "[] spawn ANZUS_fnc_parsedata;";
        check = "cursorobject isEqualTo ShipDataTransfer && playerSide isEqualto civilian  && player distance cursorObject < 5";
    };
};
