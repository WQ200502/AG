/*
	Конфиг тем для окон (v3)

	Список скинов, которые будут применяться на новый GUI.

*/

class LifeCfgThemes {
	class default {
		displayName = "Стандарт";
		colorText[] = {1,1,1,1};
		colorTextHTML = "#FFFFFF";

		titleBackground[] = {0.925,0.486,0.149,1};
		windowBackground[] = {0,0,0,0.7};

		elementBackground[] = {0,0,0,0.7};
		elementBackgroundSelected[] = {1,1,1,0.2};

		buttonBackground[] = {0.925,0.486,0.149,1};
		buttonBackgroundFocused[] = {0.074,0.086,0.105,1};

		progressBackground[] = {0.925,0.486,0.149,1};
		progressText[] = {1,1,1,1};
	};

	class dark {
		displayName = "Светлая";
		colorText[] = {0,0,0,1};
		colorTextHTML = "#000000";

		titleBackground[] = {0.216,0.31,0.4,0.8};
		windowBackground[] = {1,1,1,0.7};

		elementBackground[] = {1,1,1,0.7};
		elementBackgroundSelected[] = {1,1,1,0.4};

		buttonBackground[] = {0,0,0,0.7};
		buttonBackgroundFocused[] = {0,0,0,1};

		progressBackground[] = {1,1,1,0.9};
		progressText[] = {0,0,0,1};
	};
};