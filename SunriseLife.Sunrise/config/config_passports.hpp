/*
		классы civdefault, rebdefault, copdefault & meddefault - должны быть всегда! не удалять!

		title - название
		image = путь к картинке паспорта
		side = для какой фракции
		conditions = условия, необходимые для использования данного паспорта

		LifeCfgPassportsTexts - каким цветом и текстом выдавать фракцию при отображении паспорта
*/
class LifeCfgPassportsTexts {
	class civ {
		text = "<t color='#cc00ff'>Гражданский</t>";
	};
	class reb {
		text = "<t color='#00FF00'>Повстанец</t>";
	};
	class cop {
		text = "<t color='#4ab0ff'>Полиция</t>";
	};
	class med {
		text = "<t color='#ff0000'>EMS</t>";
	};
};

class LifeCfgPassports {
	//civ
	class civdefault {
		title = "Стандарт";
		image = "\sunrise_passports\data\passport_civ.paa";
		side = "civ";
		conditions = "";
	};
	class civvip1 {
		title = "Океан";
		image = "\sunrise_passports\data\donate\passport_vip1.paa";
		side = "civ";
		conditions = "(call life_donator) > 0";
	};
	class civvip2 {
		title = "Shadow Fiend";
		image = "\sunrise_passports\data\donate\passport_vip2.paa";
		side = "civ";
		conditions = "(call life_donator) > 0";
	};
	class civvip3 {
		title = "Восход";
		image = "\sunrise_passports\data\donate\passport_vip3.paa";
		side = "civ";
		conditions = "(call life_donator) > 1";
	};
	class civvip4 {
		title = "Турист";
		image = "\sunrise_passports\data\donate\passport_vip4.paa";
		side = "civ";
		conditions = "(call life_donator) > 1";
	};
	class civvip5 {
		title = "Sunrise";
		image = "\sunrise_passports\data\donate\passport_vip5.paa";
		side = "civ";
		conditions = "(call life_donator) > 1";
	};
	class civvip6 {
		title = "Человек Паук";
		image = "\sunrise_passports\data\donate\passport_vip6.paa";
		side = "civ";
		conditions = "(call life_donator) > 1";
	};

	//reb

	class rebdefault {
		title = "Стандарт";
		image = "\sunrise_passports\data\passport_reb.paa";
		side = "reb";
		conditions = "";
	};

	//civ gang
	class gov {
		title = "Губернатор";
		image = "\sunrise_passports\data\gov\passport_gov.paa";
		side = "civ";
		conditions = "life_gov";
	};
	class taxi {
		title = "Такси";
		image = "\sunrise_passports\data\gov\passport_taxi.paa";
		side = "civ";
		conditions = "'taxi' in life_licenses";
	};
	class press {
		title = "7NEWS";
		image = "\sunrise_passports\data\gov\passport_press.paa";
		side = "civ";
		conditions = "'press' in life_licenses";
	};
	//west

	class copdefault {
		title = "Полицейский";
		image = "\sunrise_passports\data\gov\passport_police.paa";
		side = "cop";
		conditions = "life_copDuty AND life_coplevel > 1";
	};
	class academy {
		title = "Академия";
		image = "\sunrise_passports\data\gov\passport_academy.paa";
		side = "cop";
		conditions = "life_copDuty AND life_coplevel == 1";
	};
	class sledciv {
		title = "Гражданский";
		image = "\sunrise_passports\data\passport_civ.paa";
		side = "cop";
		conditions = "life_copDuty AND life_coplevel in [19]";
	};
	/*class sheriff {
		title = "Шериф";
		image = "\sunrise_passports\data\gov\passport_sheriff.paa";
		side = "cop";
		conditions = "life_copDuty AND life_coplevel == 20";
	};
	class detective {
		title = "Детектив";
		image = "\sunrise_passports\data\gov\passport_detective.paa";
		side = "cop";
		conditions = "life_copDuty AND life_coplevel == 21";
	};
	class dea {
		title = "DEA";
		image = "\sunrise_passports\data\gov\passport_dea.paa";
		side = "cop";
		conditions = "life_copDuty AND life_coplevel == 22";
	};*/
	class swat {
		title = "SWAT";
		image = "\sunrise_passports\data\gov\passport_swat.paa";
		side = "cop";
		conditions = "life_copDuty AND life_coplevel == 17";
	};
	/*class cia {
		title = "CIA";
		image = "\sunrise_passports\data\gov\passport_cia.paa";
		side = "cop";
		conditions = "life_copDuty AND life_coplevel in [27,28]";
	};*/
	//medic
	class meddefault {
		title = "EMS";
		image = "\sunrise_passports\data\gov\passport_medic.paa";
		side = "med";
		conditions = "life_medDuty";
	};

	//special
	/*class rebskull {
		title = "Головорез";
		image = "\sunrise_passports\data\passport_skull.paa";
		side = "reb";
		conditions = "((group player) getVariable [""gang_id"",-1]) isEqualTo (server_gangsRating select 0 select 0)";
	};
	class seasonOneWinner {
		title = "BG Season 1 Winner";
		image = "\sunrise_passports\data\passport_season1.paa";
		side = "reb";
		conditions = "((group player) getVariable [""gang_license"",-1]) isEqualTo ""aff""";
	};
	class civskull: rebskull {
		side = "civ";
	};*/
	
	
	///GANGS
	class psycho {
		title = "Psychokids";
		image = "\mod_grp_pack\textures\ui.paa";
		side = "civ";
		conditions = "'psycho' in life_licenses";
	};
};