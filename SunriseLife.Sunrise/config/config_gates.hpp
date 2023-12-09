/*
	class: = строка из экшена
		conditions = условие
*/
class LifeCfgGates {
	class sobr {
		conditions = "life_coplevel > 1";
	};

	class kpp {
		conditions = "life_coplevel > 1";
	};
	
	class sektor {
		conditions = "'sektor' in life_licenses";
	};
};