/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*/
class VirtualShops {
    class market {
        name = "STR_Shops_Market";
        side = "civ";
        conditions = "";
        items[] = {"cprKit", "bandage", "stabilizer", "protest", "timber", "pdrill", "hardenedpickaxe", "toolkit", "fuelFull", "peach", "cloth", "storagesmall", "storagebig", "waterBottle", "apple", "pepsi", "cocaCola", "monsterEnergy", "doritos", "kfc", "redgull", "tbacon" };
    };

    class med_market {
        name = "STR_Shops_Market";
        side = "med";
        conditions = "";
        items[] = {"splint", "morphine", "bandage", "stabilizer", "cprKit", "waterBottle", "apple", "redgull", "tbacon", "toolkit", "fuelFull", "peach" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        conditions = "";
        items[] = {"bandage", "protest", "waterBottle", "apple", "redgull", "tbacon", "hardenedpickaxe", "toolkit", "fuelFull", "peach", "blastingcharge" };
    };

	  class bar {
		    name = "STR_Shops_Bar";
		    side = "civ";
        conditions = "";
        items[] = { "beer","vodka","jimbeam","waterBottle","redgull" };
	  };

  	class illegal {
  		name = "STR_Shops_illegal";
  		side = "civ";
      conditions = "";
      items[] = { "seeds","EncyrptedUSB", "DecryptedUSB" };
	  };

    class wongs {
        name = "STR_Shops_Wongs";
        side = "civ";
        conditions = "";
        items[] = { "turtle_soup", "turtle_raw" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        conditions = "";
        items[] = { "coffee", "donuts" };
    };

    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        conditions = "";
        items[] = { "coffee", "donuts", "redgull", "bandage", "toolkit", "fuelFull"};
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        conditions = "";
        items[] = { "cocaine_processed", "heroin_processed", "marijuana", "LSD", "meth"};
    };

    class IllegalTrader {
        name = "STR_Shops_IllegalDealer";
        side = "civ";
        conditions = "";
        items[] = { "seeds"};
    };

    class oil {
        name = "STR_Shops_Oil";
        side = "civ";
        conditions = "";
        items[] = { "rubber", "oil_processed", "hardenedpickaxe", "fuelFull" };
    };

    class fishmarket {
        name = "STR_Shops_FishMarket";
        side = "civ";
        conditions = "";
        items[] = { "salema_raw", "salema", "ornate_raw", "ornate", "mackerel_raw", "mackerel", "tuna_raw", "tuna", "mullet_raw", "mullet", "catshark_raw", "catshark" };
    };

    class coal {
        name = "STR_Shops_Coal";
        side = "civ";
        conditions = "";
        items[] = {"coal"};
    };

    class iron  {
        name = "STR_Shops_Minerals";
        side = "civ";
        conditions = "";
        items[] = { "iron" };
    };

    class diamond {
        name = "STR_Shops_Diamond";
        side = "civ";
        conditions = "";
        items[] = { "diamond" };
    };

    class jeweler {
        name = "STR_Shops_Jeweler";
        side = "civ";
        conditions = "";
        items[] = { "rubyC" };
    };

    class cement {
        name = "STR_Shops_Cement";
        side = "civ";
        conditions = "";
        items[] = { "cement" };
    };

    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        conditions = "";
        items[] = {"panicbutton", "keyCard", "gpstracker", "lockpick", "stabilizer", "cprKit", "bandage", "donuts", "coffee", "spikeStrip", "waterBottle", "apple", "redgull", "toolkit", "fuelFull", "defusekit","enginedisable", "doorc4", "drone" };
    };

    class uranium {
        name = "STR_Shops_uranium";
        side = "civ";
        conditions = "";
        items[] = {"uranium"};
    };

    class archeologist {
        name = "STR_Shops_archeologist";
        side = "civ";
        conditions = "(player getVariable ['mav_ttm_var_relicReward2',false]) isEqualTo true";
        items[] = {"excavator"};
    };
	
    class sellart {
        name = "STR_Shops_archeologist";
        side = "civ";
        conditions = "";
        items[] = {"spainting", "painting"};
    };

    class cia {
        name = "STR_Shops_cia";
        side = "civ";
        conditions = "(player getVariable ['mav_ttm_var_ciaReward',false]) isEqualTo true";
        items[] = {"excavator"};
    };

    class unknown {
        name = "STR_Shops_unknown";
        side = "civ";
        conditions = "";
        items[] = {"unknown"};
    };

    class burglary {
        name = "STR_Shops_burglary";
        side = "civ";
        conditions = "";
        items[] = {"lockpick","crowbar","gloves","rubyJewelery","diamondJewelery","sapphireJewelery","amethystJewelery","antiqueCoin","boxers","bra","cards","gnome","iphonex","noose","paintingMona","panties","remote","samsungs9","trash","bag"};
    };

    class jail {
        name = "STR_Shops_jail";
        side = "civ";
        conditions = "";
        items[] = {"shank","zipties","lockpick","trash", "keyCard", "spoon"};
    };

	class prison {
        name = "STR_Shops_prison";
        side = "civ";
        conditions = "";
        items[] = {"lockpick","apple","waterBottle"};
    };

    class goldtrader {
          name = "STR_Shops_gold";
          side = "civ";
          conditions = "";
          items[] = {"gold_bag"};
      };


    class goldcoin {
        name = "STR_Shops_goldcoin";
        side = "civ";
        conditions = "";
        items[] = {"goldcoin"};
    };

    class bunnings {
        name = "Bunnings";
        side = "civ";
        conditions = "";
        items[] = { "protest", "toolkit", "hardenedpickaxe", "waterBottle", "snag", "fuelFull", "bag", "jaws", "zipties" };
    };

    class rebel {
        name = "STR_Shops_Illegal";
        side = "civ";
        conditions = "(missionNamespace getVariable ['mav_ttm_var_rebel',0]) isEqualTo 1";
        items[] = {"bandage", "protest", "cprKit", "stabilizer", "boltcutter", "lockpick","codeCracker", "vehnos", "zipties", "blindfold", "waterBottle", "apple", "redgull", "tbacon", "toolkit", "fuelFull", "peach", "VirusUSB", "bunkerdoorc4","blastingcharge", "cyanideCapsule", "pliers", "boltLocker", "jaws", "seeds"};
    };
};

/*
*    CLASS:
*        variable = Variable Name
*        displayName = Item Name
*        weight = Item Weight
*        buyPrice = Item Buy Price
*        sellPrice = Item Sell Price
*        illegal = Illegal Item
*        edible = Item Edible (-1 = Disabled)
*        icon = Item Icon
*        processedItem = Processed Item
*/
class VirtualItems {

	class metal {
        variable = "metal";
        displayName = "STR_Item_metal";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\craft\metalplate.paa";
    };

	class nplate {
        variable = "nplate";
        displayName = "STR_Item_nplate";
        weight = 2;
        buyPrice = -1;
        sellPrice = 50;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\items\numberplate.paa";
    };

	class spoon {
        variable = "spoon";
        displayName = "STR_Item_spoon";
        weight = 2;
        buyPrice = 2000;
        sellPrice = 50;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\items\spoon.paa";
    };
	
	class yhk {
        variable = "yhk";
        displayName = "STR_Item_yhk";
        weight = 0;
        buyPrice = 250;
        sellPrice = 125;
        illegal = false;
        edible = -1;
        icon = "img\yinhangka.paa";
    };

    class rubyU {
        variable = "rubyU";
        displayName = "STR_Item_rubyU";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_rubyU.paa";
    };

    class rubyC {
        variable = "rubyC";
        displayName = "STR_Item_rubyC";
        weight = 1;
        buyPrice = -1;
        sellPrice = 280;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_rubyC.paa";
    };

    class timber {
        variable = "timber";
        displayName = "STR_Item_Timber";
        weight = 4;
        buyPrice = -1;
        sellPrice = 630;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_timber.paa";
    };

    class rubberU {
		variable = "rubberU";
		displayName = "STR_Item_rubberu";
		weight = 3;
		buyPrice = 225;
		sellPrice = 50;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\craft\rubberU.paa";
	};

	class rubber {
		variable = "rubber";
		displayName = "STR_Item_rubber";
		weight = 3;
		buyPrice = 325;
		sellPrice = 305;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\craft\rubber.paa";
	};

	class goldcoin {
		variable = "goldcoin";
		displayName = "STR_Item_goldcoin";
		weight = 2;
		buyPrice = -1;
		sellPrice = 180;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\craft\goldcoin.paa";
	};

	class wool {
		variable = "wool";
		displayName = "STR_Item_wool";
		weight = 3;
		buyPrice = 225;
		sellPrice = 80;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\craft\wool.paa";
	};

	class cloth {
		variable = "cloth";
		displayName = "STR_Item_cloth";
		weight = 2;
		buyPrice = 625;
		sellPrice = 170;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\craft\cloth.paa";
	};

	class sulfur {
		variable = "sulfur";
		displayName = "STR_Item_sulfur";
		weight = 2;
		buyPrice = 425;
		sellPrice = 380;
		illegal = true;
		edible = -1;
		icon = "anzuslifecore\images\icons\craft\sulfur.paa";
	};

    class oil_unprocessed {
        variable = "oil_unprocessed";
        displayName = "STR_Item_OilU";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_oilUnprocessed.paa";
    };

    class oil_processed {
        variable = "oil_processed";
        displayName = "STR_Item_OilP";
        weight = 4;
        buyPrice = -1;
        sellPrice = 610;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_oilProcessed.paa";
    };

    class diamondOre {
        variable = "diamondOre";
        displayName = "STR_Item_DiamondU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class diamond {
        variable = "diamond";
        displayName = "STR_Item_DiamondC";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1200;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class ironOre {
        variable = "ironOre";
        displayName = "STR_Item_IronOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class iron {
        variable = "iron";
        displayName = "STR_Item_IronIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class coalOre {
        variable = "coalOre";
        displayName = "STR_Item_CoalOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class coal {
        variable = "coal";
        displayName = "STR_Item_Coal";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1100;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class rock {
        variable = "rock";
        displayName = "STR_Item_Rock";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_rock.paa";
    };

    class cement {
        variable = "cement";
        displayName = "STR_Item_CementBag";
        weight = 5;
        buyPrice = -1;
        sellPrice = 945;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cement.paa";
    };

    //ILLEGAL
    class heroin_unprocessed {
        variable = "heroin_unprocessed";
        displayName = "STR_Item_HeroinU";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_heroinUnprocessed.paa";
        processedItem = "heroin_processed";
    };

    class heroin_processed {
        variable = "heroin_processed";
        displayName = "STR_Item_HeroinP";
        weight = 4;
        buyPrice = 1550;
        sellPrice = 920;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_heroinProcessed.paa";
    };

    class cannabis {
        variable = "cannabis";
        displayName = "STR_Item_Cannabis";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cannabis.paa";
        processedItem = "marijuana";
    };

    class marijuana {
        variable = "marijuana";
        displayName = "STR_Item_Marijuana";
        weight = 3;
        buyPrice = 1280;
        sellPrice = 935;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_marijuana.paa";
    };

    class cocaine_unprocessed {
        variable = "cocaine_unprocessed";
        displayName = "STR_Item_CocaineU";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cocaineUnprocessed.paa";
        processedItem = "cocaine_processed";
    };

    class cocaine_processed {
        variable = "cocaine_processed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = 1750;
        sellPrice = 855;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cocaineProcessed.paa";
    };

    class uraniumU {
        variable = "uraniumU";
        displayName = "STR_Item_uraniumU";
        weight = 7;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_uraniumU.paa";
    };

    class uranium {
        variable = "uranium";
        displayName = "STR_Item_uranium";
        weight = 6;
        buyPrice = -1;
        sellPrice = 2100;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_uraniumP.paa";
    };

    class mushrooms {
        variable = "mushrooms";
        displayName = "STR_Item_Mushrooms";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_mushrooms.paa";
    };

    class LSD {
        variable = "LSD";
        displayName = "STR_Item_LSD";
        weight = 4;
        buyPrice = 1750;
        sellPrice = 1005;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_LSD.paa";
    };

    //FISH
    class salema_raw {
        variable = "salemaRaw";
        displayName = "STR_Item_SalemaRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_salemaRaw.paa";
    };

    class salema {
        variable = "salema";
        displayName = "STR_Item_Salema";
        weight = 1;
        buyPrice = 7;
        sellPrice = 5;
        illegal = false;
        edible = 30;
        icon = "anzuslifecore\images\icons\ico_cookedFish.paa";
    };

    class ornate_raw {
        variable = "ornateRaw";
        displayName = "STR_Item_OrnateRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 4;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_ornateRaw.paa";
    };

    class ornate {
        variable = "ornate";
        displayName = "STR_Item_Ornate";
        weight = 1;
        buyPrice = 15;
        sellPrice = 10;
        illegal = false;
        edible = 25;
        icon = "anzuslifecore\images\icons\ico_cookedFish.paa";
    };

    class mackerel_raw {
        variable = "mackerelRaw";
        displayName = "STR_Item_MackerelRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 17;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_mackerelRaw.paa";
    };

    class mackerel {
        variable = "mackerel";
        displayName = "STR_Item_Mackerel";
        weight = 2;
        buyPrice = 25;
        sellPrice = 20;
        illegal = false;
        edible = 30;
        icon = "anzuslifecore\images\icons\ico_cookedFish.paa";
    };

    class tuna_raw {
        variable = "tunaRaw";
        displayName = "STR_Item_TunaRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 70;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_tunaRaw.paa";
    };

    class tuna {
        variable = "tuna";
        displayName = "STR_Item_Tuna";
        weight = 3;
        buyPrice = 120;
        sellPrice = 100;
        illegal = false;
        edible = 100;
        icon = "anzuslifecore\images\icons\ico_cookedFish.paa";
    };

    class mullet_raw {
        variable = "mulletRaw";
        displayName = "STR_Item_MulletRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 25;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_mulletRaw.paa";
    };

    class mullet {
        variable = "mullet";
        displayName = "STR_Item_Mullet";
        weight = 2;
        buyPrice = 60;
        sellPrice = 40;
        illegal = false;
        edible = 80;
        icon = "anzuslifecore\images\icons\ico_cookedFish.paa";
    };

    class catshark_raw {
        variable = "catsharkRaw";
        displayName = "STR_Item_CatSharkRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 30;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_catsharkRaw.paa";
    };

    class catshark {
        variable = "catshark";
        displayName = "STR_Item_CatShark";
        weight = 3;
        buyPrice = 75;
        sellPrice = 50;
        illegal = false;
        edible = 100;
        icon = "anzuslifecore\images\icons\ico_cookedFish.paa";
    };

    class turtle_raw {
        variable = "turtleRaw";
        displayName = "STR_Item_TurtleRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 300;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_turtleRaw.paa";
    };

    class turtle_soup {
        variable = "turtleSoup";
        displayName = "STR_Item_TurtleSoup";
        weight = 2;
        buyPrice = 100;
        sellPrice = 75;
        illegal = true;
        edible = 100;
        icon = "anzuslifecore\images\icons\ico_turtleSoup.paa";
    };

    //BURGLARY
    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 4;
        buyPrice = 700;
        sellPrice = 200;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_lockpick.paa";
    };
    class crowbar {
        variable = "crowbar";
        displayName = "STR_Item_crowbar";
        weight = 5;
        buyPrice = 2600;
        sellPrice = 450;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_crowbar.paa";
    };
    class gloves {
        variable = "gloves";
        displayName = "STR_Item_gloves";
        weight = 1;
        buyPrice = 80;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_gloves.paa";
    };
    //BURGLARY LOOT
    class rubyJewelery {
        variable = "rubyJewelery";
        displayName = "STR_Item_rubyJewelery";
        weight = 2;
        buyPrice = -1;
        sellPrice = 6500;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_rubyJewelery.paa";
    };
    class diamondJewelery {
        variable = "diamondJewelery";
        displayName = "STR_Item_diamondJewelery";
        weight = 2;
        buyPrice = -1;
        sellPrice = 7000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_diamondJewelery.paa";
    };
    class sapphireJewelery {
        variable = "sapphireJewelery";
        displayName = "STR_Item_sapphireJewelery";
        weight = 2;
        buyPrice = -1;
        sellPrice = 5000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_sapphireJewelery.paa";
    };
    class amethystJewelery {
        variable = "amethystJewelery";
        displayName = "STR_Item_amethystJewelery";
        weight = 2;
        buyPrice = -1;
        sellPrice = 5000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_amethystJewelery.paa";
    };
    class antiqueCoin {
        variable = "antiqueCoin";
        displayName = "STR_Item_antiqueCoin";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2500;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_antiqueCoin.paa";
    };
    class boxers {
        variable = "boxers";
        displayName = "STR_Item_boxers";
        weight = 2;
        buyPrice = -1;
        sellPrice = 20;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_boxers.paa";
    };
    class bra {
        variable = "bra";
        displayName = "STR_Item_bra";
        weight = 1;
        buyPrice = -1;
        sellPrice = 80;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_bra.paa";
    };
    class cards {
        variable = "cards";
        displayName = "STR_Item_cards";
        weight = 2;
        buyPrice = -1;
        sellPrice = 30;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cards.paa";
    };
    class gnome {
        variable = "gnome";
        displayName = "STR_Item_gnome";
        weight = 3;
        buyPrice = -1;
        sellPrice = 5;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_gnome.paa";
    };
    class iphonex {
        variable = "iphonex";
        displayName = "STR_Item_iphonex";
        weight = 2;
        buyPrice = -1;
        sellPrice = 800;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_iphonex.paa";
    };
    class noose {
        variable = "noose";
        displayName = "STR_Item_noose";
        weight = 3;
        buyPrice = -1;
        sellPrice = 50;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_noose.paa";
    };
    class paintingMona {
        variable = "paintingMona";
        displayName = "STR_Item_paintingMona";
        weight = 5;
        buyPrice = -1;
        sellPrice = 9000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_paintingMona.paa";
    };
    class panties {
        variable = "panties";
        displayName = "STR_Item_panties";
        weight = 1;
        buyPrice = -1;
        sellPrice = 100;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_panties.paa";
    };
    class remote {
        variable = "remote";
        displayName = "STR_Item_remote";
        weight = 2;
        buyPrice = -1;
        sellPrice = 20;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_remote.paa";
    };
    class samsungs9 {
        variable = "samsungs9";
        displayName = "STR_Item_samsungs9";
        weight = 2;
        buyPrice = -1;
        sellPrice = 600;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_samsungs9.paa";
    };
    class trash {
        variable = "trash";
        displayName = "STR_Item_trash";
        weight = 3;
        buyPrice = -1;
        sellPrice = 50;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_trash.paa";
    };

    //MISC
    class pliers {
        variable = "pliers";
        displayName = "STR_Item_pliers";
        weight = 4;
        buyPrice = 840;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\craft\pliers.paa";
	};

    class gpstracker {
        variable = "gpstracker";
        displayName = "STR_Item_gpstracker";
        weight = 2;
        buyPrice = 400;
        sellPrice = 20;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_gps.paa";
    };

    class protest {
        variable = "protest";
        displayName = "STR_Item_protest";
        weight = 4;
        buyPrice = 600;
        sellPrice = 20;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_protest.paa";
    };

    class enginedisable {
        variable = "enginedisable";
        displayName = "STR_Item_enginedisable";
        weight = 10;
        buyPrice = 5000;
        sellPrice = 500;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_gps.paa";
    };

    class keyCard {
        variable = "keyCard";
        displayName = "STR_Item_keyCard";
        weight = 3;
        buyPrice = 1200;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_debit.paa";
    };

    class seeds {
        variable = "seeds";
        displayName = "STR_Item_Seeds";
        weight = 1;
        buyPrice = 1000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\seeds.paa";
    };

    class meth {
        variable = "meth";
        displayName = "STR_Item_Meth";
        weight = 2;
        buyPrice = 3250;
        sellPrice = 2000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\meth.paa";
    };

    class jaws {
        variable = "jaws";
        displayName = "STR_Item_jaws";
        weight = 15;
        buyPrice = 2500;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\jaws.paa";
    };

    class drugs {
        variable = "drugs";
        displayName = "STR_Item_Drugs";
        weight = 4;
        buyPrice = -1;
        sellPrice = 195;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\drugs.paa";
    };

    class cyanideCapsule {
        variable = "cyanideCapsule";
        displayName = "STR_Item_CyanideCapsule";
        weight = 1;
        buyPrice = 200;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cyanideCapsule.paa";
    };

    class pdrill {
        variable = "pdrill";
        displayName = "STR_Item_drill";
        weight = 10;
        buyPrice = 900;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_pdrill.paa";
    };

    class redgull {
        variable = "redgull";
        displayName = "STR_Item_RedGull";
        weight = 1;
        buyPrice = 12;
        sellPrice = 5;
        illegal = false;
        edible = 65;
        icon = "anzuslifecore\images\icons\ico_redgull.paa";
    };

    class coffee {
        variable = "coffee";
        displayName = "STR_Item_Coffee";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 100;
        icon = "anzuslifecore\images\icons\ico_coffee.paa";
    };

    class waterBottle {
        variable = "waterBottle";
        displayName = "STR_Item_WaterBottle";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 65;
        icon = "anzuslifecore\images\icons\ico_waterBottle.paa";
    };
    class apple {
        variable = "apple";
        displayName = "STR_Item_Apple";
        weight = 1;
        buyPrice = 6;
        sellPrice = 5;
        illegal = false;
        edible = 10;
        icon = "anzuslifecore\images\icons\ico_apple.paa";
    };

    class peach {
        variable = "peach";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = 15;
        sellPrice = 5;
        illegal = false;
        edible = 10;
        icon = "anzuslifecore\images\icons\ico_peach.paa";
    };

    class tbacon {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 7;
        sellPrice = 2;
        illegal = false;
        edible = 40;
        icon = "anzuslifecore\images\icons\ico_tBacon.paa";
    };

    class donuts {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 12;
        sellPrice = 6;
        illegal = false;
        edible = 30;
        icon = "anzuslifecore\images\icons\ico_donuts.paa";
    };

    class doritos {
        variable = "doritos";
        displayName = "STR_Doritos";
        weight = 1;
        buyPrice = 10;
        sellPrice = 4;
        illegal = false;
        edible = 30;
        icon = "anzuslifecore\images\icons\ico_doritos.paa";
    };

    class pepsi {
        variable = "pepsi";
        displayName = "STR_Pepsi";
        weight = 1;
        buyPrice = 5;
        sellPrice = 3;
        illegal = false;
        edible = 50;
        icon = "anzuslifecore\images\icons\ico_pepsi.paa";
    };

    class cocacola {
        variable = "cocacola";
        displayName = "STR_CocaCola";
        weight = 1;
        buyPrice = 6;
        sellPrice = 3;
        illegal = false;
        edible = 50;
        icon = "anzuslifecore\images\icons\ico_cocacola.paa";
    };

    class monsterEnergy {
        variable = "monsterEnergy";
        displayName = "STR_MonsterEnergy";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 60;
        icon = "anzuslifecore\images\icons\ico_monsterEnergy.paa";
    };

    class kfc {
        variable = "kfc";
        displayName = "STR_KFC";
        weight = 1;
        buyPrice = 7;
        sellPrice = 3;
        illegal = false;
        edible = 70;
        icon = "anzuslifecore\images\icons\ico_kfc.paa";
    };

    class codeCracker {
        variable = "codeCracker";
        displayName = "STR_Item_codeCracker";
        weight = 2;
        buyPrice = 28000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\codeCracker.paa";
    };

    class zipties {
        variable = "zipties";
        displayName = "STR_Item_ZipTies";
        weight = 5;
        buyPrice = 600;
        sellPrice = 100;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ziptie.paa";
    };

    class shank {
        variable = "shank";
        displayName = "STR_Item_Shank";
        weight = 10;
        buyPrice = 6000;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_knife.paa";
    };

	class blindfold {
        variable = "blindfold";
        displayName = "STR_Item_Blindfold";
        weight = 0;
        buyPrice = 60;
        sellPrice = 20;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\blindfold.paa";
    };

    class panicbutton {
        variable = "panicbutton";
        displayName = "STR_Item_panicbutton";
        weight = 3;
        buyPrice = 15;
        sellPrice = 5;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_panicbutton.paa";
    };

    //Medical Things
    class cprKit {
        variable = "cprKit";
        displayName = "STR_Item_CPRMediKit";
        weight = 5;
        buyPrice = 500;
        sellPrice = 250;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_defib.paa";
    };

    class splint {
        variable = "splint";
        displayName = "STR_Item_Splint";
        weight = 2;
        buyPrice = 30;
        sellPrice = 5;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class morphine {
        variable = "morphine";
        displayName = "STR_Item_Morphine";
        weight = 2;
        buyPrice = 50;
        sellPrice = 5;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_LSD.paa";
    };

    class bandage {
        variable = "bandage";
        displayName = "STR_Item_Bandage";
        weight = 2;
        buyPrice = 150;
        sellPrice = 5;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_bandages.paa";
    };

    class stabilizer {
        variable = "stabilizer";
        displayName = "STR_Item_Stabilizer";
        weight = 5;
        buyPrice = 1000;
        sellPrice = 5;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_bloodbag.paa";
    };

    class hardenedpickaxe {
        variable = "hardenedpickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 75;
        sellPrice = 35;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_pickaxe.paa";
    };

    class toolkit {
        variable = "toolkit";
        displayName = "STR_Item_Toolkit";
        weight = 4;
        buyPrice = 35;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "\a3\weapons_f\items\data\UI\gear_toolkit_ca.paa";
    };

    class fuelEmpty {
        variable = "fuelEmpty";
        displayName = "STR_Item_FuelE";
        weight = 2;
        buyPrice = -1;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_fuelEmpty.paa";
    };

    class fuelFull {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 5;
        buyPrice = 85;
        sellPrice = 50;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_fuel.paa";
    };

    class spikeStrip {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 10;
        buyPrice = 250;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_spikeStrip.paa";
    };

    class markedmoney {
        variable = "markedmoney";
        displayName = "STR_Item_MarkedMoney";
        weight = 12;
        buyPrice = -1;
        sellPrice = 100000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_money.paa";
    };

    class bank_bag {
        variable = "bank_bag";
        displayName = "STR_Item_bank_bag";
        weight = 10;
        buyPrice = -1;
        sellPrice = 20000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\bag.paa";
    };

    class gold_bag {
        variable = "gold_bag";
        displayName = "STR_Item_goldbank_bag";
        weight = 25;
        buyPrice = -1;
        sellPrice = 36000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\bag.paa";
    };

    class bag {
        variable = "bag";
        displayName = "STR_Item_Bag";
        weight = 2;
        buyPrice = 10;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\bag.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 107500;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_blastingCharge.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 12750;
        sellPrice = 100;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_boltCutter.paa";
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "STR_Item_DefuseKit";
        weight = 2;
        buyPrice = 250;
        sellPrice = 200;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_defuseKit.paa";
    };

     class storagesmall {
        variable = "storageSmall";
		displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 15250;
        sellPrice = 550;
        varPrice = 1;
        maxPrice = 15500;
        minPrice = 15500;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 46500;
        sellPrice = 1370;
        varPrice = 1;
        maxPrice = 13700;
        minPrice = 13705;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_storageBig.paa";
    };

    //quest
    class relic1 {
        variable = "relic1";
        displayName = "STR_Item_relic1";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_relic1.paa";
    };
    class relic2 {
        variable = "relic2";
        displayName = "STR_Item_relic2";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_relic2.paa";
    };
    class relic3 {
        variable = "relic3";
        displayName = "STR_Item_relic3";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_relic3.paa";
    };
    class relic4 {
        variable = "relic4";
        displayName = "STR_Item_relic4";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_relic4.paa";
    };
    class artifact1 {
        variable = "artifact1";
        displayName = "STR_Item_artifact1";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "core\quests\questionmark.paa";
    };
    class artifact2 {
        variable = "artifact2";
        displayName = "STR_Item_artifact2";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "core\quests\questionmark.paa";
    };
    class artifact3 {
        variable = "artifact3";
        displayName = "STR_Item_artifact3";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "core\quests\questionmark.paa";
    };    
	class artifact4 {
        variable = "artifact4";
        displayName = "STR_Item_artifact4";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "core\quests\questionmark.paa";
    };
    class artifact5 {
        variable = "artifact5";
        displayName = "STR_Item_artifact5";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "core\quests\questionmark.paa";
    };
    class artifact6 {
        variable = "artifact6";
        displayName = "STR_Item_artifact6";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "core\quests\questionmark.paa";
    };

    class cia1 {
        variable = "cia1";
        displayName = "STR_Item_cia1";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cia1.paa";
    };
    class cia2 {
        variable = "cia2";
        displayName = "STR_Item_cia2";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cia2.paa";
    };
    class cia3 {
        variable = "cia3";
        displayName = "STR_Item_cia3";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cia3.paa";
    };
    class cia4 {
        variable = "cia4";
        displayName = "STR_Item_cia4";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cia4.paa";
    };
    class angel1 {
        variable = "angel1";
        displayName = "STR_Item_angel1";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cia2.paa";
    };
    class angel2 {
        variable = "angel2";
        displayName = "STR_Item_angel2";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cia3.paa";
    };
    class angel3 {
        variable = "angel3";
        displayName = "STR_Item_angel3";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cia4.paa";
    };

    class relicFed {
        variable = "relicFed";
        displayName = "STR_Item_relicFed";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_relicFed.paa";
    };
    class Satellite {
        variable = "Satellite";
        displayName = "STR_Item_satellite";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_satellite.paa";
    };

    class unknown {
        variable = "unknown";
        displayName = "STR_Item_unknown";
        weight = 10;
        buyPrice = -1;
        sellPrice = 3000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_unknown.paa";
    };

    class oilSupplies {
        variable = "oilSupplies";
        displayName = "STR_Item_oilSupplies";
        weight = 20;
        buyPrice = -1;
        sellPrice = 9500;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_oilSupplies.paa";
    };

    class excavator {
        variable = "excavator";
        displayName = "STR_Item_excavator";
        weight = 10;
        buyPrice = 1400;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_excavator.paa";
    };

		class syringe {
		variable = "syringe";
		displayName = "STR_Item_Syringe";
		weight = 2;
		buyPrice = 5;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\syringe.paa";
	};

	class blood_vialo {
		variable = "blood_vialo";
		displayName = "STR_Item_Blood_bagu";
		weight = 2;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\blood_vial.paa";
	};

	class blood_viala {
		variable = "blood_viala";
		displayName = "STR_Item_Blood_bagu";
		weight = 2;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\blood_vial.paa";
	};

	class blood_vialb {
		variable = "blood_vialb";
		displayName = "STR_Item_Blood_bagu";
		weight = 2;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\blood_vial.paa";
	};

	class blood_bago {
		variable = "blood_bago";
		displayName = "STR_Item_Blood_bago";
		weight = 4;
		buyPrice = -1;
		sellPrice = 600;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\blood_bag.paa";
	};

	class blood_baga {
		variable = "blood_baga";
		displayName = "STR_Item_Blood_baga";
		weight = 4;
		buyPrice = -1;
		sellPrice = 480;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\blood_bag.paa";
	};

	class blood_bagb {
		variable = "blood_bagb";
		displayName = "STR_Item_Blood_bagb";
		weight = 4;
		buyPrice = -1;
		sellPrice = 480;
		illegal = false;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\blood_bag.paa";
	};

	class snag {
		variable = "snag";
		displayName = "STR_Item_Snag";
		weight = 1;
		buyPrice = 15;
		sellPrice = 5;
		illegal = false;
		edible = 60;
		icon = "anzuslifecore\images\icons\items\ico_snag.paa";
	};
	
	class vehnos {
		variable = "vehnos";
		displayName = "STR_Item_Fuelnos";
		weight = 1;
		buyPrice = 2000;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\nos.paa";
	};
	
    class doorc4 {
        variable = "doorc4";
        displayName = "STR_Item_doorc4";
        weight = 10;
        buyPrice = 5000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "A3\Weapons_F\Data\UI\gear_mine_AP_CA.paa";
        check = "(call life_copdept) in [6,7]";
    };

    class bunkerdoorc4 {
        variable = "bunkerdoorc4";
        displayName = "STR_Item_doorc4Bunker";
        weight = 10;
        buyPrice = 5000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "A3\Weapons_F\Data\UI\gear_mine_AP_CA.paa";
    };

    class beer {
        variable = "beer";
        displayName = "STR_Item_Beer";
        weight = 1;
        buyPrice = 5;
        sellPrice = 4;
		    illegal = false;
        edible = 100;
        icon = "anzuslifecore\images\icons\items\vb.paa";
    };

	class vodka {
        variable = "vodka";
        displayName = "STR_Item_Vodka";
        weight = 1;
        buyPrice = 5;
        sellPrice = 4;
        illegal = false;
        edible = 100;
        icon = "anzuslifecore\images\icons\items\grey.paa";
    };

	class jimbeam {
        variable = "jimbeam";
        displayName = "STR_Item_Jimbeam";
        weight = 1;
        buyPrice = 5;
        sellPrice = 4;
		illegal = false;
        edible = 100;
        icon = "anzuslifecore\images\icons\items\jimbeam.paa";
    };

	class head {
        variable = "head";
        displayName = "STR_Item_head";
        weight = 1;
        buyPrice = 5;
        sellPrice = 4;
		illegal = false;
        edible = 100;
        icon = "anzuslifecore\images\icons\items\head.paa";
    };

    class boltLocker {
        variable = "boltLocker";
        displayName = "STR_Item_boltLocker";
        weight = 10;
        buyPrice = 5000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "A3\ui_f\data\map\mapcontrol\cross_CA.paa";
        check = "";
    };

    class drone {
        variable = "drone";
        displayName = "STR_Item_drone";
        weight = 10;
        buyPrice = 8500;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "anzuslifecore\images\icons\drone.paa";
        check = "";
    };

    class methTable {
        variable = "methTable";
        displayName = "STR_Item_methTable";
        weight = 40;
        buyPrice = 10000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\methtable.paa";
        check = "";
    };

    class MethBag50 {
        variable = "cocaine_processed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = 1750;
        sellPrice = 855;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cocaineProcessed.paa";
    };

    class MethBag60 {
        variable = "cocaine_processed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = 1750;
        sellPrice = 855;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cocaineProcessed.paa";
    };

    class MethBag70 {
        variable = "cocaine_processed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = 1750;
        sellPrice = 855;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cocaineProcessed.paa";
    };

    class MethBag80 {
        variable = "cocaine_processed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = 1750;
        sellPrice = 855;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cocaineProcessed.paa";
    };

    class MethBag90 {
        variable = "cocaine_processed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = 1750;
        sellPrice = 855;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cocaineProcessed.paa";
    };

    class MethBag100 {
        variable = "cocaine_processed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = 1750;
        sellPrice = 855;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\ico_cocaineProcessed.paa";
    };

	class painting {
		variable = "painting";
		displayName = "STR_Item_Painting";
		weight = 8;
		buyPrice = -1;
		sellPrice = 250000;
		illegal = true;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\painting.paa";
	};

	class spainting {
		variable = "spainting";
		displayName = "STR_Item_sPainting";
		weight = 5;
		buyPrice = -1;
		sellPrice = 100000;
		illegal = true;
		edible = -1;
		icon = "anzuslifecore\images\icons\items\painting.paa";
	};

  class VirusUSB {
          variable = "VirusUSB";
          displayName = "STR_Item_Virus1";
          weight = 2;
          buyPrice = 10250;
          sellPrice = -1;
          illegal = true;
          edible = -1;
          icon = "anzuslifecore\images\icons\USB1.paa";
  	};
	
      class EncyrptedUSB {
          variable = "EncyrptedUSB";
          displayName = "STR_Item_Virus2";
          weight = 2;
          buyPrice = -1;
          sellPrice = 200000;
          illegal = true;
          edible = -1;
          icon = "anzuslifecore\images\icons\USB2.paa";
      };

      class DecryptedUSB {
          variable = "DecryptedUSB";
          displayName = "STR_Item_Virus3";
          weight = 2;
          buyPrice = -1;
          sellPrice = 400000;
          illegal = true;
          edible = -1;
          icon = "anzuslifecore\images\icons\USB2.paa";
      };

class USB1 {
        variable = "USB1";
        displayName = "STR_Item_USB1";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\USB1.paa";
	};

	class USB2 {
        variable = "USB2";
        displayName = "STR_Item_USB2";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\USB1.paa";
	};

	class USB3 {
        variable = "USB3";
        displayName = "STR_Item_USB3";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\USB1.paa";
	};

	class USB4 {
        variable = "USB4";
        displayName = "STR_Item_USB4";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\USB1.paa";
	};

		class USB5 {
        variable = "USB5";
        displayName = "STR_Item_USB5";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\USB1.paa";
	};

	class USB6 {
        variable = "USB6";
        displayName = "STR_Item_USB6";
        weight = 2;
        buyPrice = -1;
        sellPrice = 500000;
        illegal = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\USB2.paa";
	};

	class regularUSB {
        variable = "regularUSB";
        displayName = "STR_Item_regularUSB";
        weight = 2;
        buyPrice = 3000;
        sellPrice = -1;
        illegal = true;
		savable = true;
        edible = -1;
        icon = "anzuslifecore\images\icons\USB2.paa";
	};
};
