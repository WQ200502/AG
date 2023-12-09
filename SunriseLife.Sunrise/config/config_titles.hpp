class LifeCfgTitles {
	class default {
		title = "";
		conditions = "";
	};
	class vip {
		title = "Герой";
		conditions = "(call life_donator) > 0";
	};
	class vip2 {
		title = "Мастер";
		conditions = "(call life_donator) > 1";
	};
	class vip3 {
		title = "Грандмастер";
		conditions = "(call life_donator) > 2";
	};
	class viptop {
		title = "Легенда";
		conditions = "(call life_donator) > 3";
	};
	class stream {
		title = "Бессмертный";
		conditions = "(call life_donator) > 3";
	};
	/*class topgang {
		title = "Головорез";
		conditions = "((group player) getVariable [""gang_id"",-1]) isEqualTo (server_gangsRating select 0 select 0)";
	};*/
	class s1win {
		title = "Завоеватель";
		conditions = "((group player) getVariable [""gang_license"",""-1""]) isEqualTo ""aff""";
	};
};