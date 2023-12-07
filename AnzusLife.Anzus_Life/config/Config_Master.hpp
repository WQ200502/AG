class CfgMaster {
    class Branch {
        //服务器版本
        serverVersion = 0.036;

        //开发服务器
        devServerName = "babababa";

        //主-实时，开发-构建
        currentBranch = "main";
    };

    class Security {
        //播放器的UID可以绕过addon检查
        bypassAddonCheck[] = {"76561198365244788","76561198006225826","76561198807379761","76561198143977922","76561198890553411","76561198978158050","76561199063859158"};

        //要确认正在运行的CfgPatches列表
        patchesToVerify[] = {"KA_Vityaz"};

        //打开以阻止人们在作战日志中保存装备（*在测试中*）
        combatLogFix = false;
    };

    class Jail {
        class Settings {
            //最短和最长监禁时间（分钟）。
            minTime = 5;
            maxTime = 550;

            //如果是真的，它会把库存里的东西拿走，否则如果警察忘了摊牌，它会保留装备
            jail_autoSeizeInv = true;

            //要扣押的虚拟项目
            jail_seize_vItems[] = { "zipties", "blindfold", "codeCracker", "spikeStrip","lockpick","goldenbarz3","blastingcharge","boltcutter","heroin_unprocessed","heroin_processed","cannabis","marijuana","cocaine_unprocessed","cocaine_processed","turtle_raw","jaws","meth","seeds" };

            //如果是真的，强迫囚犯在监狱里行走
            jail_forceWalk = true;

            //当玩家被送进监狱时
            class Loadout {
                uniform  = "AG_Prisoner_Uniform";
                backpack = "";
                headgear = "";
                goggles  = "";
                vest = "";
            };
        };

        class Locations {
            class KamdanPrison {
                name        = "Department of Corrections";
                description = "The Department of Corrections is the national prison of Kamdan and is known for its security.";
                icon        = "";

                class JailCellLocations {
                    //使用modelToWorld作为监狱位置
                    useModelToWorld = true;

                    //囚犯的产卵点
                    jailPositions[] = {{5.33594,-22.0313,0.221439},{5.67578,-18.4316,0.221439},{6.03711,-14.584,0.221439},{6.01758,-10.8086,0.221439},{5.90625,-7.08398,0.221439},{5.7793,0.421875,0.221439},{6.37695,3.04297,0.221439},{6.93164,7.06836,0.221439},{5.63672,10.8223,0.221439},{6.30078,14.7148,0.221439},{-5.79492,14.5957,0.221439},{-5.64648,10.9492,0.221439},{-5.82227,7.01563,0.221439},{-6.33594,3.23047,0.221439},{-5.85156,-3.63672,0.221439},{-5.92383,-7.14844,0.221439},{-6.4375,-10.8145,0.221439},{-5.72852,-14.7051,0.221439},{-6.52734,-18.3516,0.221439},{-6.18164,-22.1289,0.221439}};
                };

                class ReleaseArea {
                    //释放它们的方向（getDir player）
                    direction = 310;

                    //释放它们的位置（getPosATL player）
                    positionATL[] = {7629.833, 2365.984, 0};
                };
            };
        };
    };

    class MajorCrimes {
        //玩家出售被盗黄金后不能存款的时间（分钟）。
        noatm_timer = 1;
        blacklistedWeapons[] = {"TR8_Mining_Drill","Mr_Camera_News","Mr_Micro_News","Binocular","taser","XZ_CamRecorder_1","XZ_CamRecorder_2","Xnooz_micro2","Xnooz_AppareilPhoto"};

        class Bank {
            items[] = {"bank_bag"};
            amount = 4;
            time = 700;
            displayName = "Bank";
            requiredItem = "codeCracker";
            bank_amount = 200000;
            bigbank_amount = 200000;
            Gold_amount = 105;
        };

        class Fed {
            items[] = {"bank_bag"};
            amount = 30;
            time = 60;
            displayName = "Federal Reserve";
            requiredItem = "blastingcharge";
            Cash_amount = 140000;
            Gold_amount = 90;
        };

        class Casino {
            items[] = {"bank_bag"};
            amount = 3;
            time = 600;
            displayName = "Casino";
            requiredItem = "codeCracker";
        };
    };

    class Medical {
        //出血和死亡前出血的持续时间，以秒为单位。
        bleedoutDuration = 350;

        //玩家必须支付的复活费和医疗费，只有EMS会得到这个数额的奖励。
        revivalFee = 7500;

		    medicBonus = 1000;

        //在医院治疗的费用
        hospitalFee = 150;
    };

    class Saving {
        //保存虚拟项
        save_virtualItems = true;

        //保存非法物品
        save_illeagalItems = false;

        //节约食物和水？
        save_playerStats = true;

        //拯救平民场所
        save_civilianPosition = true;

        //保存车辆虚拟项
        save_vehicle_virtualItems = true;

        //将非法物品保存在车内
        save_vehicle_illeagalItems = false;

        //在车辆中保存arma库存项目
        save_vehicle_inventory = false;

        //节省车辆燃油和损坏
        save_vehicle_fuel = true;
        save_vehicle_damage = true;
    };

    class GameSettings {
        //设置为false可禁用ARMA 3疲劳系统。
        enable_fatigue = true;

        //错误-组领导可以访问指挥官视图。true[默认值]-组领导无法访问commander视图。
        disableCommanderView = true;

        //在数据库中启用捐赠者级别集（var=life\u donor level；levels=0,1,2,3,4,5）。注意！启用之前，请阅读：https://www.bistudio.com/community/game-content-usage-rules&https://www.bistudio.com/monetization
        donor_level = true;

        //如果玩家在steam name中有服务器名，则允许支付奖金
        paycheck_bonus = true;
        paycheck_serverName = "www.anzus.life";

        class Player {
            //双方的现金数额以
            bank_cop = 80000;
            bank_civ = 80000;
            bank_med = 80000;

            //玩家从自动取款机转账时支付的税款。税=金额*乘数
            bank_transferTax = .05;

            //玩家可以拥有的最大房屋数量。
            house_limit = 10;

            //不带背包的最大重量
            nobag_maxWeight = 50;
        };

        class GovFactions {
            //最大警察白名单级别
            cop_maxLevel = 7;

            //警察等级显示名称
            cop_rankArray[] = {"无等级","一级警员","二级警员","三级警员","四级警员","五级警员","六级警员","七级警员","八级警员","副局长","局长"};

            //警察要求的白名单级别
            cop_whitelistLevel = 7;

            //警察部门违约金额：7
            cop_departmentsCount = 7;

            //警察部门名称默认值：（无-0，文件-1，巡逻-2，联邦调查局-3，法警-4，联邦调查局-5，特警-6，指挥部-7，州指挥部-8）
            cop_departmentsArray[] = {"无部门","惩戒部","巡警","联邦调查局","法警","刑事调查处","战术部队","命令","国家指挥部"};

            //最高医疗白名单级别
            med_maxLevel = 8;

            //医疗军衔显示名称
            med_rankArray[] = {"无等级","一级医生","二级医生","三级医生","四级医生","五级医生","六级医生","副院长","院长"};

            //白名单所需的医疗水平
            med_whitelistLevel = 7;

            //医疗部门违约金额：1
            med_departmentsCount = 2;

            //医疗部门名称默认值：（无-0，EMS部门-1）
            med_departmentsArray[] = {"无部门","急救服务", "消防部门"};
        };

        class Gangs {
            //帮派创作价
            gang_price = 75000;

            //在一个帮派中购买额外职位的基本成本
            gang_upgradeBase = 4000;

            //乘数乘以基础升级价格
            gang_upgradeMultiplier = 2.5;
        };

        class EscapeMenu {
            //单击“退出”菜单中的“中止”按钮所需的时间。
            escapeMenu_timer = 10;

            //在转义菜单中显示下面指定的播放器UID和服务器名。
            escapeMenu_displayExtras = true;

            //显示在转义菜单中的文本。缩短时间。。大约20个字符。
            escapeMenu_displayText = "AG模组生活服团队期待您的再次游玩";
        };
    };

    class Events {
        class SupplyCrate {
            //启用供应箱事件
            enable_supplyCrate = true;

            //下降时间
            supply_minTime = 30;
            supply_maxTime = 60;

            //板条箱将产生的最大武器数量
            supply_maxWeapons = 2;

            //武器，附件，稀有（使用selectRandomWeighted）
            supply_weapons[] = {{"hlc_rifle_bcmjack", {""}},0.1,{"hlc_rifle_honeybadger", {""}},0.1,{"hlc_rifle_Bushmaster300", {""}},0.1,{"arifle_AKM_F", {""}},0.1,{"RH_Deaglem", {""}},0.1};
            supply_items[] = {};
        };

        class Maverick {
            //武器，附件，稀有（使用selectRandomWeighted）
            enable_doubleXP = false;
        };

        class WeaponTransport {
            //启动武器运输任务。
            enable_weaponTransport = true;

            //运输卡车将在那里产卵。
                spawn_points[] = {"event_transport_spawn1","event_transport_spawn2","event_transport_spawn3"};

            //运输卡车类名称。
            truck_class[] = {"O_Truck_03_ammo_f"};

            //这辆车需要修理。
            truck_startBroken = true;

            //它会给你多少奖励。
            reward_amount = 4;

            //奖励放在这里。（可以是VItem、类名或现金）
            cop_reward[] = {{"moneycop",6500}};
            cartel_reward[] = {{"money",150000}, {"KA_Galil_35rnd_Mk318_SOST_mag",2}, {"arifle_SPAR_01_blk_F",2}, {"arifle_KA_SKS_F",2}, {"hlc_smg_mp510",1}, {"hlc_rifle_bcmjack",1}, {"marijuana",20}, {"heroin_processed",20}, {"cocaine_processed",20}};
            mafia_reward[] = {{"money",150000}, {"KA_Galil_35rnd_Mk318_SOST_mag",2}, {"arifle_SPAR_01_blk_F",2}, {"arifle_KA_SKS_F",2}, {"hlc_smg_mp510",1}, {"hlc_rifle_bcmjack",1}, {"codeCracker",1}, {"bank_bag",1}};


            //如果你在这个时候交货，你会得到一笔奖金。（以秒为单位的时间）
            special_rewardtime = 2200;
            special_rewardamount = 6;

        };
    };

    class Shops {
        class Fuel {
            //加油站每升燃油的成本（如果尚未定义车辆）。
            fuel_cost = 2;

            //在加油站泵处为空的燃料罐加油的费用。（注意燃料罐的买卖价格，以防被利用……）
            fuelCan_refuel = 400;
        };

        class Vehicle {
            //只能租不能买的车辆
            vehicleShop_rentalOnly[] = {};

            //车辆价格（车辆价格*乘数）
            vehicle_purchase_multiplier_CIVILIAN = 1;
            vehicle_purchase_multiplier_COP = .5;
            vehicle_purchase_multiplier_MEDIC = .75;

            //车辆租赁价格（车辆租赁价格*乘数）
            vehicle_rental_multiplier_CIVILIAN = .80;
            vehicle_rental_multiplier_COP = .5;
            vehicle_rental_multiplier_MEDIC = .55;

            //车辆售价（车辆售价*乘数）
            vehicle_sell_multiplier_CIVILIAN = .5;
            vehicle_sell_multiplier_COP = .5;
            vehicle_sell_multiplier_MEDIC = .5;

            //车辆的削价。为了避免漏洞永远不会设置高于购买/租赁乘数！支付=配置车辆价格*乘数
            vehicle_chopShop_multiplier = .45;

            //车库成本（买价*乘数）
            vehicle_storage_fee_multiplier = .01;

            //扣押乘数*切勿设置高于cop乘数*（配置车辆价格*乘数）
            vehicle_cop_impound_multiplier = .01;

            //这只会掩护车辆爆炸。
            vehicle_insurnace_price_l1 = 0.25;

            //这将包括以前的水平，但也斩波的车辆。
            vehicle_insurnace_price_l2 = 0.5;
        };
    };

    CarShopSpawns[] = {"impoundPoint1","impoundPoint2","impoundPoint3","impoundPoint4","impoundPoint5","impoundPoint6","impoundPoint7","civcar1","civcar2","civcar3","civcar4","civcar5","civcar6","civcar7","civcar8","civcar9","civcar10","civcar11","civcar12","civcar13","civcar14","civcar15","civcar16","civcar17","civcar18","civcar19","civcar20","civcar21","rebcar","rebcar_1","rebcar_2","civcarlux1","civcarlux2","civcarlux3","civcarlux4","civtruck1","civtruck2","civtruck3","car_g_1","car_g_2","car_g_3","car_g_4","car_g_5","civcar5_1","car_g_6","car_g_7","car_g_8","car_g_9","car_g_10","car_g_11","car_g_12","car_g_13","car_g_14","car_g_15","car_g_16","car_g_17","car_g_22","car_g_18","car_g_19","car_g_20","cop_car_3","cop_car_4","cop_car_5","cop_car_6","cop_car_7","cop_car_8","cop_car_9","cop_car_11","cop_car_12","cop_car_13","med_car_1","med_car_2","med_car_3","med_car_4","civcar22"};
    AirShopSpawns[] = {"civair1","civair2","civair2_1","civair3","civair4","copair1","copair2","copair3","copair4","copair5","medair1","medair2","airg1","airg2"};
    BoatShopSpawns[] = { "civ_ship_1", "civ_ship_2", "civ_ship_3", "civ_ship_4", "civ_ship_5", "civ_ship_6", "cop_ship_5", "cop_ship_6", "cop_ship_7", "cop_ship_8", "cop_ship_9", "medic_ship_1", "civ_ship_7" };

    /*狩猎和捕鱼系统配置*/
    animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" }; //你能钓到的鱼的类名

    /*采矿*/
    MiningAreas[] = {
           "mining_area",
           "mining_area_1",
           "mining_area_2",
           "mining_area_3",
           "mining_area_4"
    };
};

#include "Config_Weapons.hpp"
#include "Config_Clothing.hpp"
#include "Config_Licenses.hpp"
#include "Config_Vehicles.hpp"
#include "Config_vItems.hpp"
#include "Config_Gather.hpp"
#include "Config_SpawnPoints.hpp"
#include "Config_Process.hpp"
#include "Config_Housing.hpp"
#include "Config_HouseLoot.hpp"
#include "Config_Interactions.hpp"
#include "Config_Phone.hpp"
#include "Config_Jail.hpp"
#include "Config_Gangs.hpp"
#include "Config_HelpGuide.hpp"
