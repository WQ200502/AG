#define true 1
#define false 0
/*

	class:
	displayName = название из стрингтейбл
	price = цена
	buyable = продается в магазине лицензий
	gang = лицензия группировки

*/
class LifeCfgLicenses {
	class driver {
		displayName = "STR_License_Driver";
		price = 5000;
		buyable = false;
		gang = false;
	};

	class boat {
		displayName = "STR_License_Boat";
		price = 15000;
		buyable = true;
		gang = false;
	};

	class air {
		displayName = "STR_License_Pilot";
		price = 75000;
		buyable = true;
		gang = false;
	};

	class gun {
		displayName = "STR_License_Firearm";
		price = 130000;
		buyable = true;
		gang = false;
	};

	class fisher {
		displayName = "STR_License_Fisher";
		price = 10000;
		buyable = true;
		gang = false;
	};

	class hunter {
		displayName = "STR_License_Hunter";
		price = 25000;
		buyable = true;
		gang = false;
	};
	
	class rebl {
		displayName = "STR_License_RebL";
		price = 1000000;
		buyable = true;
		gang = false;
	};
	
	/// GANGS
	class sektor {
		displayName = "STR_License_SECTOR7";
		price = 500;
		buyable = false;
		gang = true;
	};
	class psycho {
		displayName = "STR_License_PsychoKid";
		price = 500;
		buyable = false;
		gang = true;
	};
};