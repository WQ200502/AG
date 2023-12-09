class LifeCfgTags {	
	//west
	class cop1 {
		title = "Cadet";
		conditions = "life_copDuty && life_coplevel == 1";
	};
	class cop2 {
		title = "Officer I";
		conditions = "life_copDuty && life_coplevel == 2";
	};
	class cop3 {
		title = "Officer II";
		conditions = "life_copDuty && life_coplevel == 3";
	};
	class cop4 {
		title = "Officer III";
		conditions = "life_copDuty && life_coplevel == 4";
	};
	class cop5 {
		title = "Sergeant I";
		conditions = "life_copDuty && life_coplevel == 5";
	};
	class cop6 {
		title = "Sergeant II";
		conditions = "life_copDuty && life_coplevel == 6";
	};
	class cop7 {
		title = "Sergeant III";
		conditions = "life_copDuty && life_coplevel == 7";
	};
	class cop8 {
		title = "Lieutenant I";
		conditions = "life_copDuty && life_coplevel == 8";
	};
	class cop9 {
		title = "Lieutenant II";
		conditions = "life_copDuty && life_coplevel == 9";
	};
	class cop10 {
		title = "Captain";
		conditions = "life_copDuty && life_coplevel == 10";
	};
	class cop11 {
		title = "Major";
		conditions = "life_copDuty && life_coplevel == 11";
	};
	class cop12 {
		title = "Lt.Colonel";
		conditions = "life_copDuty && life_coplevel == 12";
	};
	class cop13 {
		title = "Colonel";
		conditions = "life_copDuty && life_coplevel == 13";
	};
	class cop14 {
		title = "General Major";
		conditions = "life_copDuty && life_coplevel == 14";
	};
	class cop15 {
		title = "General Lieutenant";
		conditions = "life_copDuty && life_coplevel == 15";
	};
	class cop16 {
		title = "General";
		conditions = "life_copDuty && life_coplevel == 16";
	};
	class cop17 {
		title = "S.W.A.T";
		conditions = "life_copDuty && life_coplevel == 17";
	};
	class cop18 {
		title = "Lt.Commander";
		conditions = "life_copDuty && life_coplevel == 18";
	};
	
	class cop19 {
		title = "Commander";
		conditions = "life_copDuty && life_coplevel == 19";
	};


	//med
	class med1 {
		title = "Intern";
		conditions = "life_medDuty && life_medlevel == 1";
	};
	class med2 {
		title = "Doctor";
		conditions = "life_medDuty && life_medlevel == 2";
	};
	class med3 {
		title = "Therapist";
		conditions = "life_medDuty && life_medlevel == 3";
	};
	class med4 {
		title = "Surgeon";
		conditions = "life_medDuty && life_medlevel == 4";
	};
	class med5 {
		title = "Specialist";
		conditions = "life_medDuty && life_medlevel == 5";
	};
	class med6 {
		title = "Expert";
		conditions = "life_medDuty && life_medlevel == 6";
	};
	
	
	//GANGS
	class psycho {
		title = "PS";
		conditions = "'psycho' in life_licenses";
	};
};

class LifeCfgTitleGang {
	// class Тег лицухи {
	//     class Лвл {title = Кликуха};
	// };

	class gov {
		class 1 {title = "Охрана ";};
		class 2 {title = "Начальник охраны ";};
		class 3 {title = "Адвокат ";};
		class 4 {title = "Министр здравоохранения ";};
		class 5 {title = "Министр внутренних дел ";};
		class 6 {title = "Премьер-Министр ";};
		class 7 {title = "Президент ";};
	};
	class sv {
		class 1 {title = "Рядовой ";};
		class 2 {title = "Сержант ";};
		class 3 {title = "Старшина ";};
		class 4 {title = "Прапорщик ";};
		class 5 {title = "Капитан ";};
		class 6 {title = "Майор ";};
		class 7 {title = "Полковник ";};
	};
};