class perk_civilian_master {
	displayName = "平民福利";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "解锁此技能需要1点";
	description = "学习和提高针对平民的津贴";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {0,0.6,0,1};
};

class perk_gather_1 {
	displayName = "采集速度";
	requiredPerkPoints = 5;
	requiredLevel = 12;
	requiredPerk = "perk_civilian_master";
	subtitle = "需要等级12，5点技能点";
	description = "加強你的钻头挖矿山，就像从来没有人开采过!<br/><br/><t color='#10FF45'>+5% 采集速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_gatherSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_gather_2 {
	displayName = "采集速度 2";
	requiredPerkPoints = 6;
	requiredLevel = 18;
	requiredPerk = "perk_gather_1";
	subtitle = "需要等级18，6点技能点";
	description = "加強你的钻头挖矿山，就像从来没有人开采过!<br/><br/><t color='#10FF45'>+10% 采集速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_gatherSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_gather_3 {
	displayName = "采集速度 3";
	requiredPerkPoints = 7;
	requiredLevel = 26;
	requiredPerk = "perk_gather_2";
	subtitle = "需要等级26，7点技能点";
	description = "加強你的钻头挖矿山，就像从来没有人开采过!<br/><br/><t color='#10FF45'>+20% 采集速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_gatherSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_gather_4 {
	displayName = "采集速度 4";
	requiredPerkPoints = 9;
	requiredLevel = 34;
	requiredPerk = "perk_gather_3";
	subtitle = "需要等级34，9点技能点";
	description = "加強你的钻头挖矿山，就像从来没有人开采过!<br/><br/><t color='#10FF45'>+30% 采集速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_gatherSpeed_4.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_1 {
	displayName = "加工速度";
	requiredPerkPoints = 3;
	requiredLevel = 7;
	requiredPerk = "perk_civilian_master";
	subtitle = "需要等级7，3点技能点";
	description = "学习后更有效地加工材料<br/><br/><t color='#10FF45'>+10% 加工速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_2 {
	displayName = "加工速度 2";
	requiredPerkPoints = 3;
	requiredLevel = 13;
	requiredPerk = "perk_processing_1";
	subtitle = "需要等级13，3点技能点";
	description = "学习后更有效地加工材料<br/><br/><t color='#10FF45'>+15% 加工速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_3 {
	displayName = "加工速度 3";
	requiredPerkPoints = 4;
	requiredLevel = 17;
	requiredPerk = "perk_processing_2";
	subtitle = "需要等级17，4点技能点";
	description = "学习后更有效地加工材料<br/><br/><t color='#10FF45'>+25% 加工速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_4 {
	displayName = "加工速度 4";
	requiredPerkPoints = 5;
	requiredLevel = 24;
	requiredPerk = "perk_processing_3";
	subtitle = "需要等级24，5点技能点";
	description = "学习后更有效地加工材料<br/><br/><t color='#10FF45'>+40% 加工速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_4.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_5 {
	displayName = "加工速度 5";
	requiredPerkPoints = 7;
	requiredLevel = 35;
	requiredPerk = "perk_processing_4";
	subtitle = "需要等级35，7点技能点";
	description = "学习后更有效地加工材料<br/><br/><t color='#10FF45'>+55% 加工速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_5.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_6 {
	displayName = "加工速度 6";
	requiredPerkPoints = 12;
	requiredLevel = 40;
	requiredPerk = "perk_processing_5";
	subtitle = "需要等级40，12点技能点";
	description = "学习后更有效地加工材料<br/><br/><t color='#10FF45'>+75% 加工速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processSpeed_6.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_processing_7 {
	displayName = "加工折扣优惠";
	requiredPerkPoints = 14;
	requiredLevel = 52;
	requiredPerk = "perk_processing_6";
	subtitle = "需要等级52，14点技能点";
	description = "获得50％的加工成本折扣.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_processPrice.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class garbage_search_1 {
	displayName = "垃圾搜索";
	requiredPerkPoints = 6;
	requiredLevel = 16;
	requiredPerk = "perk_civilian_master";
	subtitle = "需要等级16，6点技能点";
	description = "了解垃圾箱/潜水的隐藏秘诀，并将垃圾搜索速度提高10%!";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_garbage_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class garbage_search_2 {
	displayName = "搜索速度 #2";
	requiredPerkPoints = 8;
	requiredLevel = 22;
	requiredPerk = "garbage_search_1";
	subtitle = "需要等级22，8点技能点";
	description = "了解垃圾箱/潜水的隐藏秘诀，并将垃圾搜索速度提高20%";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_garbage_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class garbage_search_3 {
	displayName = "搜索速度 #3";
	requiredPerkPoints = 9;
	requiredLevel = 26;
	requiredPerk = "garbage_search_2";
	subtitle = "需要等级26，9点技能点";
	description = "了解垃圾箱/潜水的隐藏秘诀，并将垃圾搜索速度提高30%";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_garbage_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class garbage_search_4 {
	displayName = "搜索速度 #4";
	requiredPerkPoints = 11;
	requiredLevel = 31;
	requiredPerk = "garbage_search_3";
	subtitle = "需要等级31，11点技能点";
	description = "了解垃圾箱/潜水的隐藏秘诀，并将垃圾搜索速度提高40%";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_garbage_4.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class garbage_search_5 {
	displayName = "搜索速度 #5";
	requiredPerkPoints = 14;
	requiredLevel = 35;
	requiredPerk = "garbage_search_4";
	subtitle = "需要等级35，14点技能点";
	description = "了解垃圾箱/潜水的隐藏秘诀，并将垃圾搜索速度提高50%";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_garbage_5.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class garbage_searchChance_1 {
	displayName = "搜索运气";
	requiredPerkPoints = 12;
	requiredLevel = 28;
	requiredPerk = "garbage_search_1";
	subtitle = "需要等级28，12点技能点";
	description = "提高搜索垃圾箱运气，并找到更好的东西!";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_garbageChance_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_burglary_1 {
	displayName = "盗窃津贴";
	requiredPerkPoints = 7;
	requiredLevel = 18;
	requiredPerk = "perk_civilian_master";
	subtitle = "需要等级18，7点技能点";
	description = "了解撬棍的隐藏功能，并加快 15% 的抢劫速度!";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_burglary_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_burglary_2 {
	displayName = "盗窃津贴 2";
	requiredPerkPoints = 8;
	requiredLevel = 24;
	requiredPerk = "perk_burglary_1";
	subtitle = "需要等级24，8点技能点";
	description = "了解撬棍的隐藏功能，并加快 20% 的抢劫速度!";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_burglary_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_burglary_3 {
	displayName = "盗窃津贴 3";
	requiredPerkPoints = 10;
	requiredLevel = 30;
	requiredPerk = "perk_burglary_2";
	subtitle = "需要等级30，10点技能点";
	description = "了解撬棍的隐藏功能，并加快 25% 的抢劫速度!";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_burglary_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_burglary_4 {
	displayName = "盗窃津贴 4";
	requiredPerkPoints = 14;
	requiredLevel = 38;
	requiredPerk = "perk_burglary_3";
	subtitle = "需要等级38，14点技能点";
	description = "了解撬棍的隐藏功能，并加快 35% 的抢劫速度!";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_burglary_4.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_burglary_stealth_1 {
	displayName = "盗窃潜行";
	requiredPerkPoints = 11;
	requiredLevel = 27;
	requiredPerk = "perk_burglary_1";
	subtitle = "需要等级27，11点技能点";
	description = "警报系统？把它关掉！哈哈（报警几率-20%）";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_burglary_stealth_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};


class functions_air_1 {
	displayName = "航空训练";
	requiredPerkPoints = 2;
	requiredLevel = 6;
	requiredPerk = "perk_civilian_master";
	subtitle = "需要等级6，2点技能点";
	description = "解锁飞机商店可以购买飞机";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_air_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class functions_home_1 {
	displayName = "房产权";
	requiredPerkPoints = 2;
	requiredLevel = 9;
	requiredPerk = "perk_civilian_master";
	subtitle = "需要等级9，2点技能点";
	description = "获得拥有自己房屋的能力";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_home_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};


class perk_police_master {
	displayName = "警察津贴";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "解锁该技能需要1点技能点";
	description = "学习和改进警察的特殊待遇";
	initScript = "";
	limitToSides[] = {"WEST"};
	color[] = {0,0,0.6,1};
};

class functions_impoundSpeed_1 {
	displayName = "扣押";
	requiredPerkPoints = 3;
	requiredLevel = 5;
	requiredPerk = "perk_police_master";
	subtitle = "需要等级5，3点技能点";
	description = "您可以更有效地扣留车辆<br/><br/><t color='#10FF45'>扣押速度提高100%</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_impoundSpeed_1.sqf";
	limitToSides[] = {"WEST"};
	color[] = {1,1,1,1};
};

class functions_impoundSpeed_2 {
	displayName = "扣押 2";
	requiredPerkPoints = 5;
	requiredLevel = 12;
	requiredPerk = "functions_impoundSpeed_1";
	subtitle = "需要等级12，5点技能点";
	description = "您可以更有效地扣留车辆<br/><br/><t color='#10FF45'>扣押速度提高200%</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_impoundSpeed_2.sqf";
	limitToSides[] = {"WEST"};
	color[] = {1,1,1,1};
};

class perk_global_master {
	displayName = "全服津贴";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "解锁该技能需要1点";
	description = "每个人都可以享受的一般津贴";
	initScript = "";
	limitToSides[] = {};
	color[] = {0.2,0.5,0.3,1};
};

class death_timer_1 {
	displayName = "死亡计时器增加 25%";
	color[] = {1,1,1,1};
	requiredPerkPoints = 9;
	requiredLevel = 37;
	requiredPerk = "perk_global_master";
	subtitle = "需要等级37，9点技能点";
	description = "您流血的速度降低了25% 在正常的死亡时间过去之后，您会得到一个重生按钮.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_death_timer_1.sqf";
};

class death_timer_2 {
	displayName = "死亡计时器增加 50%";
	color[] = {1,1,1,1};
	requiredPerkPoints = 14;
	requiredLevel = 40;
	requiredPerk = "death_timer_1";
	subtitle = "需要等级40，14点技能点";
	description = "您流血的速度降低了50% 在正常的死亡时间过去之后，您会得到一个重生按钮.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_death_timer_2.sqf";
};

class death_timer_3 {
	displayName = "死亡计时器增加 75%";
	color[] = {1,1,1,1};
	requiredPerkPoints = 18;
	requiredLevel = 46;
	requiredPerk = "death_timer_2";
	subtitle = "需要等级46，18点技能点";
	description = "您流血的速度降低了75% 在正常的死亡时间过去之后，您会得到一个重生按钮.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_death_timer_3.sqf";
};

class death_timer_4 {
	displayName = "双倍死亡计时器";
	color[] = {1,1,1,1};
	requiredPerkPoints = 24;
	requiredLevel = 55;
	requiredPerk = "death_timer_3";
	subtitle = "需要等级55，24点技能点";
	description = "你要花两倍的时间流血。你会在正常死亡时间过后得到一个重生按钮。";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_death_timer_4.sqf";
};

class kill_feed {
	displayName = "杀人饲料";
	color[] = {1,1,1,1};
	requiredPerkPoints = 7;
	requiredLevel = 14;
	requiredPerk = "perk_global_master";
	subtitle = "需要等级14，7点技能点";
	description = "当你杀人时，你会得到一个杀人饲料.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_kill_feed.sqf";
};

class perk_evidence_1 {
	displayName = "销毁证据加速25%";
	color[] = {1,1,1,1};
	requiredPerkPoints = 5;
	requiredLevel = 10;
	requiredPerk = "perk_global_master";
	subtitle = "需要等级10，5点技能点";
	description = "您将能够以25%的速度提取/销毁证据.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_evidence_1.sqf";
};

class perk_evidence_2 {
	displayName = "销毁证据加速50%";
	color[] = {1,1,1,1};
	requiredPerkPoints = 7;
	requiredLevel = 13;
	requiredPerk = "perk_evidence_1";
	subtitle = "需要等级13，7点技能点";
	description = "您将能够以50%的速度提取/销毁证据.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_evidence_2.sqf";
};

class perk_paycheck_1 {
	displayName = "薪水支票";
	requiredPerkPoints = 2;
	requiredLevel = 2;
	requiredPerk = "perk_global_master";
	subtitle = "需要等级2，2点技能点";
	description = "收到更多的薪水<br/><br/><t color='#10FF45'>+20% 薪水</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_2 {
	displayName = "薪水支票 2";
	requiredPerkPoints = 3;
	requiredLevel = 8;
	requiredPerk = "perk_paycheck_1";
	subtitle = "需要等级8，3点技能点";
	description = "收到更多的薪水<br/><br/><t color='#10FF45'>+35% 薪水</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_3 {
	displayName = "薪水支票 3";
	requiredPerkPoints = 6;
	requiredLevel = 21;
	requiredPerk = "perk_paycheck_2";
	subtitle = "需要等级21，6点技能点";
	description = "收到更多的薪水<br/><br/><t color='#10FF45'>+75% 薪水</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_4 {
	displayName = "薪水支票 4";
	requiredPerkPoints = 12;
	requiredLevel = 33;
	requiredPerk = "perk_paycheck_3";
	subtitle = "需要等级33，12点技能点";
	description = "收到更多的薪水<br/><br/><t color='#10FF45'>+100% 薪水</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_paycheckIncrease_4.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_paycheck_5 {
	displayName = "直接存款";
	requiredPerkPoints = 6;
	requiredLevel = 35;
	requiredPerk = "perk_paycheck_4";
	subtitle = "需要等级35，6点技能点";
	description = "所有薪水都将直接存入您的银行帐户.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_directdeposit.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class functions_repairSpeed_1 {
	displayName = "修复速度";
	requiredPerkPoints = 3;
	requiredLevel = 7;
	requiredPerk = "perk_global_master";
	subtitle = "需要等级7，3点技能点";
	description = "您可以更有效地修理车辆<br/><br/><t color='#10FF45'>40% 维修速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_repairSpeed_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class functions_repairSpeed_2 {
	displayName = "修复速度 2";
	requiredPerkPoints = 4;
	requiredLevel = 9;
	requiredPerk = "functions_repairSpeed_1";
	subtitle = "需要等级9，4点技能点";
	description = "您可以更有效地修理车辆<br/><br/><t color='#10FF45'>75% 维修速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_repairSpeed_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

/*class functions_stamina_1 {
	displayName = "无限耐力";
	requiredPerkPoints = 3;
	requiredLevel = 7;
	requiredPerk = "perk_global_master";
	subtitle = "需要等级7，3点技能点";
	description = "耐力<br/><br/><t color='#10FF45'>再也不会耗尽耐力。 如果已购买，请重新记录以查看效果是否发生.</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_stamina_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};*/

class perk_medical {
	displayName = "医疗津贴";
	color[] = {0.75,0.04,0.19,1};
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	limitToSides[] = {};
	subtitle = "解锁该技能需要1点技能点";
	description = "学习并改善医疗方面的福利";
};

class perk_cpr_1 {
	displayName = "25% CPR机会";
	color[] = {1,1,1,1};
	requiredPerkPoints = 7;
	requiredLevel = 5;
	requiredPerk = "perk_medical";
	subtitle = "需要等级5，7点技能点";
	description = "增加您的心肺复苏机会 15% 至 25%";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_cpr_one.sqf";
};

class perk_cpr_2 {
	displayName = "50% CPR机会";
	color[] = {1,1,1,1};
	requiredPerkPoints = 7;
	requiredLevel = 15;
	requiredPerk = "perk_cpr_1";
	subtitle = "需要等级15，7点技能点";
	description = "增加您的心肺复苏机会 25% 至 50%";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_cpr_two.sqf";
};

class perk_cpr_full {
	displayName = "提高CPR后生命数量";
	color[] = {1,1,1,1};
	requiredPerkPoints = 7;
	requiredLevel = 21;
	requiredPerk = "perk_cpr_2";
	subtitle = "需要等级21，7点技能点";
	description = "当您进行心肺复苏术时，他们会更多生命.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_cpr_full.sqf";
};

class perk_stabalizeLength_1 {
	displayName = "稳定长度 1";
	color[] = {1,1,1,1};
	requiredPerkPoints = 3;
	requiredLevel = 9;
	requiredPerk = "perk_medical";
	subtitle = "需要等级9，3点技能点";
	description = "将稳定时间从1分钟增加到2分钟";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_stabalizeLength_one.sqf";
};

class perk_stabalizeLength_2 {
	displayName = "稳定长度 2";
	color[] = {1,1,1,1};
	requiredPerkPoints = 5;
	requiredLevel = 11;
	requiredPerk = "perk_stabalizeLength_1";
	subtitle = "需要等级11，5点技能点";
	description = "将稳定时间从2分钟增加到3分钟";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_stabalizeLength_two.sqf";
};

class perk_bandage_1 {
	displayName = "急救 1";
	requiredPerkPoints = 3;
	requiredLevel = 25;
	requiredPerk = "perk_medical";
	subtitle = "需要等级25，3点技能点";
	description = "使用绷带时提高治愈能力.治愈自己 <t color='#10FF45'>80% 生命回复</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_bandage_1.sqf";
	limitToSides[] = {"CIV","WEST"};
	color[] = {1,1,1,1};
};

class perk_bandage_2 {
	displayName = "急救 2";
	requiredPerkPoints = 5;
	requiredLevel = 30;
	requiredPerk = "perk_bandage_1";
	subtitle = "需要等级30，5点技能点";
	description = "使用绷带时提高治愈能力.治愈自己 <t color='#10FF45'>85% 生命回复</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_bandage_2.sqf";
	limitToSides[] = {"CIV","WEST"};
	color[] = {1,1,1,1};
};

class perk_bandage_3 {
	displayName = "急救 3";
	requiredPerkPoints = 10;
	requiredLevel = 40;
	requiredPerk = "perk_bandage_2";
	subtitle = "需要等级40，10点技能点";
	description = "使用绷带时提高治愈能力.治愈自己 <t color='#10FF45'>90% 生命回复</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_bandage_3.sqf";
	limitToSides[] = {"CIV","WEST"};
	color[] = {1,1,1,1};
};

class perk_bandage_4 {
	displayName = "急救 4";
	requiredPerkPoints = 15;
	requiredLevel = 60;
	requiredPerk = "perk_bandage_3";
	subtitle = "需要等级60，15点技能点";
	description = "使用绷带时提高治愈能力.治愈自己 <t color='#10FF45'> 95% 生命回复</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_bandage_4.sqf";
	limitToSides[] = {"CIV","WEST"};
	color[] = {1,1,1,1};
};

class perk_bandage_5 {
	displayName = "急救 5";
	requiredPerkPoints = 20;
	requiredLevel = 75;
	requiredPerk = "perk_bandage_4";
	subtitle = "需要等级75，20点技能点";
	description = "使用绷带时提高治愈能力.治愈自己 <t color='#10FF45'>100% 生命回复</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_bandage_5.sqf";
	limitToSides[] = {"CIV","WEST"};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_master {
	displayName = "武器津贴";
	requiredPerkPoints = 1;
	requiredLevel = 1;
	requiredPerk = "";
	subtitle = "解锁该技能需要1点技能点";
	description = "学习并改善医疗方面的福利";
	initScript = "";
	limitToSides[] = {"CIV","WEST"};
	color[] = {0.85,0.7,0,1};
};

class perk_gunsspecialist_lessRecoil_1 {
	displayName = "减低后座力";
	requiredPerkPoints = 5;
	requiredLevel = 5;
	requiredPerk = "perk_gunsspecialist_master";
	subtitle = "需要等级5，5点技能点";
	description = "学习更好地控制武器并降低明显的后坐力<br/><br/><t color='#10FF45'>-5% 后座力减低</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_2 {
	displayName = "减低后座力 2";
	requiredPerkPoints = 6;
	requiredLevel = 16;
	requiredPerk = "perk_gunsspecialist_lessRecoil_1";
	subtitle = "需要等级16，6点技能点";
	description = "学习更好地控制武器并降低明显的后坐力<br/><br/><t color='#10FF45'>-10% 后座力减低</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_3 {
	displayName = "减低后座力 3";
	requiredPerkPoints = 7;
	requiredLevel = 21;
	requiredPerk = "perk_gunsspecialist_lessRecoil_2";
	subtitle = "需要等级21，7点技能点";
	description = "学习更好地控制武器并降低明显的后坐力<br/><br/><t color='#10FF45'>-20% 后座力减低</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_4 {
	displayName = "减低后座力 4";
	requiredPerkPoints = 9;
	requiredLevel = 30;
	requiredPerk = "perk_gunsspecialist_lessRecoil_3";
	subtitle = "需要等级30，9点技能点";
	description = "学习更好地控制武器并降低明显的后坐力<br/><br/><t color='#10FF45'>-25% 后座力减低</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_4.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_gunsspecialist_lessRecoil_5 {
	displayName = "减低后座力 5";
	requiredPerkPoints = 12;
	requiredLevel = 40;
	requiredPerk = "perk_gunsspecialist_lessRecoil_4";
	subtitle = "需要等级40，12点技能点";
	description = "学习更好地控制武器并降低明显的后坐力<br/><br/><t color='#10FF45'>-30% 后座力减低</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_recoilCompensation_5.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_weaponSway_1 {
	displayName = "武器摇摆控制";
	requiredPerkPoints = 5;
	requiredLevel = 7;
	requiredPerk = "perk_gunsspecialist_master";
	subtitle = "需要等级7，5点技能点";
	description = "学习以更低的总体武器摇摆更好地控制武器<br/><br/><t color='#10FF45'>-15% 武器摇摆度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_weaponSway_1.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_weaponSway_2 {
	displayName = "武器摇摆控制 2";
	requiredPerkPoints = 6;
	requiredLevel = 17;
	requiredPerk = "perk_weaponSway_1";
	subtitle = "需要等级17，6点技能点";
	description = "学习以更低的总体武器摇摆更好地控制武器<br/><br/><t color='#10FF45'>-25% 武器摇摆度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_weaponSway_2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_weaponSway_3 {
	displayName = "武器摇摆控制 3";
	requiredPerkPoints = 7;
	requiredLevel = 28;
	requiredPerk = "perk_weaponSway_2";
	subtitle = "需要等级28，7点技能点";
	description = "学习以更低的总体武器摇摆更好地控制武器<br/><br/><t color='#10FF45'>-30% 武器摇摆度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_weaponSway_3.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_weaponSway_4 {
	displayName = "武器摇摆控制 4";
	requiredPerkPoints = 10;
	requiredLevel = 40;
	requiredPerk = "perk_weaponSway_3";
	subtitle = "需要等级40，10点技能点";
	description = "学习以更低的总体武器摇摆更好地控制武器<br/><br/><t color='#10FF45'>-40% 武器摇摆度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_weaponSway_4.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class perk_illegal_master {
	displayName = "非法津贴";
	requiredPerkPoints = 1;
	requiredLevel = 3;
	requiredPerk = "";
	subtitle = "需要等级3/1点技能点解锁此技能";
	description = "学习和改进针对非法活动的津贴";
	initScript = "";
	limitToSides[] = {"CIV"};
	color[] = {0.6,0,0,1};
};

class perk_lsd_1 {
	displayName = "蘑菇采集";
	requiredPerkPoints = 3;
	requiredLevel = 6;
	requiredPerk = "perk_illegal_master";
	subtitle = "需要等级6，3点技能点";
	description = "学习采蘑菇制作迷幻药<br/><br/><t color='#10FF45'>估计利润比可卡因高15%</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lsd_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class functions_uranium_1 {
	displayName = "铀采集";
	requiredPerkPoints = 8;
	requiredLevel = 20;
	requiredPerk = "perk_lsd_1";
	subtitle = "需要等级20，8点技能点";
	description = "学习收集铀进行加工和出售以获取重大利润<br/><br/><t color='#10FF45'>估计利润比可卡因高45%</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_uranium_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_1 {
	displayName = "锁匠";
	requiredPerkPoints = 3;
	requiredLevel = 7;
	requiredPerk = "perk_illegal_master";
	subtitle = "需要等级7，3点技能点";
	description = "学习更有效地撬锁并减少车辆上的撬锁时间<br/><br/><t color='#10FF45'>+10% 更快的解锁</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_2 {
	displayName = "锁匠 2";
	requiredPerkPoints = 5;
	requiredLevel = 16;
	requiredPerk = "perk_locksmith_1";
	subtitle = "需要等级16，5点技能点";
	description = "学习更有效地撬锁并减少车辆上的撬锁时间<br/><br/><t color='#10FF45'>+15% 更快的解锁</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_3 {
	displayName = "锁匠 3";
	requiredPerkPoints = 7;
	requiredLevel = 23;
	requiredPerk = "perk_locksmith_2";
	subtitle = "需要等级23，7点技能点";
	description = "学习更有效地撬锁并减少车辆上的撬锁时间<br/><br/><t color='#10FF45'>+25% 更快的解锁</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_3.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_4 {
	displayName = "锁匠 4";
	requiredPerkPoints = 9;
	requiredLevel = 29;
	requiredPerk = "perk_locksmith_3";
	subtitle = "需要等级29，9点技能点";
	description = "学习更有效地撬锁并减少车辆上的撬锁时间<br/><br/><t color='#10FF45'>+45% 更快的解锁</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_4.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_locksmith_5 {
	displayName = "锁匠 5";
	requiredPerkPoints = 12;
	requiredLevel = 36;
	requiredPerk = "perk_locksmith_4";
	subtitle = "需要等级36，12点技能点";
	description = "学习更有效地撬锁并减少车辆上的撬锁时间<br/><br/><t color='#10FF45'>+75% 更快的解锁</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_lockpickSpeed_5.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_rebel_1 {
	displayName = "加入叛军";
	requiredPerkPoints = 3;
	requiredLevel = 10;
	requiredPerk = "perk_illegal_master";
	subtitle = "需要等级10，3点技能点";
	description = "获取武器商店和非法物品的访问权，以确保您比其他人领先一步.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_rebel_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class functions_north {
	displayName = "叛军重生点";
	requiredPerkPoints = 4;
	requiredLevel = 17;
	requiredPerk = "perk_rebel_1";
	subtitle = "需要等级17，4点技能点";
	description = "获得在叛军基地重生的能力";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_north.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_rebel_2 {
	displayName = "成为高级叛军";
	requiredPerkPoints = 17;
	requiredLevel = 50;
	requiredPerk = "perk_rebel_1";
	subtitle = "需要等级50，17点技能点";
	description = "获得进入高级武器商店和非法物品的权限，以确保您比其他人领先一步.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_rebel_2.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_rebel_veh {
	displayName = "叛军车辆";
	requiredPerkPoints = 15;
	requiredLevel = 35;
	requiredPerk = "perk_rebel_1";
	subtitle = "需要等级35，15点技能点";
	description = "可以购买叛军车辆.";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_rebel_veh.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class perk_gasrobbery_1 {
	displayName = "持械抢劫";
	requiredPerkPoints = 6;
	requiredLevel = 17;
	requiredPerk = "perk_illegal_master";
	subtitle = "需要等级17，6点技能点";
	description = "学习更有效地恐吓加油站的职员和银行<br/><br/><t color='#10FF45'>+50% 抢劫速度</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_gasrobbery_1.sqf";
	limitToSides[] = {"CIV"};
	color[] = {1,1,1,1};
};

class functions_quests {
	displayName = "任务";
	requiredPerkPoints = 5;
	requiredLevel = 3;
	requiredPerk = "";
	subtitle = "需要等级3/5点技能点解锁此技能";
	description = "从探索开始您的旅程，探索会给您良好的xp体验，让您做别人做不到的事情!";
	initScript = "";
	limitToSides[] = {};
	color[] = {0,0.46,0.76,1};
};

class functions_relicReward {
	displayName = "任务：收集文物";
	requiredPerkPoints = 9999;
	requiredLevel = 1;
	requiredPerk = "functions_quests";
	subtitle = "收集隐藏的文物";
	description = "将地图上所有隐藏的文物（4）带给考古学家 <br/><br/><t color='#10FF45'>奖励：2375 xp</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_relicReward.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class functions_ciaReward {
	displayName = "任务：收集CIA包裹";
	requiredPerkPoints = 9999;
	requiredLevel = 1;
	requiredPerk = "functions_quests";
	subtitle = "收集隐藏的CIA包裹";
	description = "将地图上所有隐藏的CIA包裹（4）带到Shady Crime <br/><br/><t color='#10FF45'>奖励: 2175 xp</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_ciaReward.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class functions_relicReward2 {
	displayName = "任务：收集文物 2";
	requiredPerkPoints = 9999;
	requiredLevel = 1;
	requiredPerk = "functions_relicReward";
	subtitle = "美联储文物";
	description = "抢夺联邦储备，从奖励中收集遗物，并将其带给考古学家 <br/><br/><t color='#10FF45'>奖励: 3900 xp a以及抢劫石油钻塔货物的能力</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_relicReward2.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class functions_satellite {
	displayName = "任务：深处的秘密";
	requiredPerkPoints = 9999;
	requiredLevel = 1;
	requiredPerk = "functions_relicReward2";
	subtitle = "????????";
	description = "345723.47456Researchasd.234Facilityad234s.csdfSatellite.resdf<br/><br/><t color='#10FF45'>奖励: 3000 xp 以及收集信息的能力 ????????</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_satellite.sqf";
	limitToSides[] = {};
	color[] = {0.38,0.05,0,1};
};

class functions_angelReward {
	displayName = "任务：失落的天使";
	requiredPerkPoints = 9999;
	requiredLevel = 1;
	requiredPerk = "functions_quests";
	subtitle = "寻找天使";
	description = "在地图上找到所有天使（3），并将他们的向导带到牧师. <br/><br/><t color='#10FF45'>奖励: 2000 xp and $75,000</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_angelReward.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};

class functions_relicReward3 {
	displayName = "任务：收集文物 3";
	requiredPerkPoints = 9999;
	requiredLevel = 1;
	requiredPerk = "functions_quests";
	subtitle = "在地图上收集6个隐藏的工件";
	description = "将所有6件隐藏的文物带给考古学家 <br/><br/><t color='#10FF45'>奖励: 2675 xp, 锡纸帽子和 $125,000</t>";
	initScript = "maverick\talent-tree-modular\modules\maverick_perkset_1\functions\functions_artifactReward.sqf";
	limitToSides[] = {};
	color[] = {1,1,1,1};
};
