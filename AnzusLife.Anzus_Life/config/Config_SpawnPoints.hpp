/*
*    Format:
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*/
class CfgSpawnPoints {
	class Anzus_Life {
        class Civilian {
			class Kamdan {
                displayName = "甘丹城中央";
                description = "甘丹城(中央)新手出生和举办活动地方严禁捣乱 捣乱者必定重罚.";
                spawnMarker[] = {"civ_spawn_metropolis","civ_spawn_metropolis_1","civ_spawn_metropolis_2"};
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "";
            };
            class CoulchesterEast {
                displayName = "阿什沃思东部";
                description = "阿什沃思东部：位于坎丹东北部地区，以黑手党活动闻名.";
                spawnMarker = "civ_spawn_downtown";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "";
            };
            class Huddersville {
                displayName = "哈德斯维尔";
                description = "哈德斯维尔：以美术馆闻名的地图西南魔幻.";
                spawnMarker = "civ_spawn_hd";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "";
            };
            class Redwick {
                displayName = "雷德威克";
                description = "雷德威克：卡姆丹最北部的魔幻，以其卡特尔活动而闻名.";
                spawnMarker = "civ_spawn_lawless";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "";
            };
            class Rebel {
                displayName = "叛军基地";
                description = "叛军基地內部嚴禁打架/綁架 違者BAN 3天.";
                spawnMarker = "civ_spawn_rebel";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "(missionNamespace getVariable ['mav_ttm_var_north',0]) isEqualTo 1";
            };
			class blackpiston {
                displayName = "黑活塞公司总部";
                description = "等待玩家發掘地方(我都不知道是有什麼用!!)";
                spawnMarker = "blackpiston";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "group player getVariable ['gang_id',-1] isEqualTo 2000";
            };
			class sc {
                displayName = "米奇钱总部";
                description = "等待玩家發掘地方(我都不知道是有什麼用!!)";
                spawnMarker = "sc";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "group player getVariable ['gang_id',-1] isEqualTo 1013";
            };
			class psiland {
                displayName = "普西兰";
                description = "等待玩家發掘地方(我都不知道是有什麼用!!).";
                spawnMarker = "psiland";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "group player getVariable ['gang_id',-1] isEqualTo 2129";
            };
			class waxland {
                displayName = "瓦克斯兰";
                description = "Drake for SWAT #FUCKSWAT.";
                spawnMarker = "waxland";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\spawn.paa";
                conditions = "group player getVariable ['gang_id',-1] isEqualTo 2095";
            };
        };

        class Cop {
            class KamdanHQ {
                displayName = "甘丹城警察总部";
                description = "Main Police Headquarters";
                spawnMarker = "cop_spawn_1";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
            };

            class CoulchesterHQ {
                displayName = "阿什沃思警察局";
                description = "Northern-Eastern Kamdan Police Station";
                spawnMarker = "cop_spawn_2";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
            };

            class RedwickHQ {
                displayName = "雷德威克警察局";
                description = "North-Western Kamdan Police Station";
                spawnMarker = "cop_spawn_3";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
            };

            class divisions {
                displayName = "特别行动总部";
                description = "特警和便衣警察总部";
                spawnMarker = "specops";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "(call life_copdept) in [3,5,6,7,8]";
            };

            class Training {
                displayName = "警察学院基地";
                description = "学警基楚训练学院";
                spawnMarker = "cop_spawn_10";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
            };

			class Sheriff {
				displayName = "洲警察办公室";
                description = "Sheriff Office";
                spawnMarker = "sheriff_spawn";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "(call life_copdept) in [3]";
            };
			class DOC {
				displayName = "金丹监狱";
                description = "DOC";
                spawnMarker = "doc_spawn";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "(call life_copdept) in [1,7]";
            };
        };

        class Medic {
            class KamdanHospital {
                displayName = "金丹医院(总院)";
                description = "King Dan Hospital General Hospital";
                spawnMarker = "medic_spawn_1";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
            };
			class HuddersvilleHospital {
                displayName = "哈德斯维尔医院";
                description = "Huddersville Hospital";
                spawnMarker = "medic_spawn_3";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
			};
			class RedwickHospital {
                displayName = "雷德威克医院";
                description = "Redwick Hospital";
                spawnMarker = "medic_spawn_4";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
			};
			class CoulchesterHospital {
                displayName = "阿什沃思医院";
                description = "Ashworth Hospital";
                spawnMarker = "medic_spawn_5";
                icon = "\AnzusLifeCore\images\displays\displaySpawns\TreeIcons\safehouse.paa";
                conditions = "";
			};
        };
    };
};
