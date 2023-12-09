/*


	Class = столбец name в gang_trunks
		object = имя хранилища на карте
		conditions = условия, необходимые для доступа к хранилищу


*/
class LifeCfgTrunks {
	//cop
	class police {
		object = "police_trunk";
		conditions = "life_copDuty && life_coplevel > 5";
	};
	class swat {
		object = "swat_trunk";
		conditions = "life_copDuty && life_coplevel in [17,18,19]";
	};

	//med
	class medic {
		object = "medic_trunk";
		conditions = "life_medDuty && life_medlevel > 1";
	};
	
	///GANGS
	class psycho {
		object = "psycho_trunk";
		conditions = "'psycho' in life_licenses && life_civlevel > 2";
	};
};