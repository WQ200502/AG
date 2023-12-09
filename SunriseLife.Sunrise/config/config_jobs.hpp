#define true 1
#define false 0

class LifeCfgJobs {
/*

finalText = "";
{
	_lamps = nearestObjects [getpos _x, ["Land_LampStreet_F","Land_LampStreet_small_F","Land_LampDecor_F"], 750];
	if (count _lamps > 5) then {
		if (count _lamps > 10) then {_lamps resize 10};

		finalText = finalText + format ["
\\class city_%1 {
\\\townName = '%2';
\\\townPosition[] = %3;
\\\lampsAmount = %4;
\\};",_forEachIndex,text _x,format["{%1,%2,0}",(position _x)#0,(position _x)#1],str (count _lamps)]
	};
} foreach nearestLocations [[worldSize/2, worldSize/2], ["NameCity","NameVillage"], worldSize];
finalText

*/	
	class elnLamps {
		class city_0 { 
			townName = 'Телос'; 
			townPosition[] = {16207,17296.7,0}; 
			lampsAmount = 7; 
		}; 
		class city_2 { 
			townName = 'Ставрос'; 
			townPosition[] = {12950.1,15041.6,0}; 
			lampsAmount = 10; 
		}; 
		class city_3 { 
			townName = 'Харкия'; 
			townPosition[] = {18049.1,15264.1,0}; 
			lampsAmount = 10; 
		}; 
		class city_4 { 
			townName = 'Неохори'; 
			townPosition[] = {12502,14337,0}; 
			lampsAmount = 10; 
		}; 
		class city_5 { 
			townName = 'Лакка'; 
			townPosition[] = {12282,15732.3,0}; 
			lampsAmount = 10; 
		}; 
		class city_6 { 
			townName = 'Родополи'; 
			townPosition[] = {18753.4,16597.1,0}; 
			lampsAmount = 9; 
		}; 
		class city_7 { 
			townName = 'Каталаки'; 
			townPosition[] = {11701.1,13672.1,0}; 
			lampsAmount = 10; 
		}; 
		class city_9 { 
			townName = 'Аликампос'; 
			townPosition[] = {11112.6,14573.7,0}; 
			lampsAmount = 7; 
		}; 
		class city_13 { 
			townName = 'Полиакко'; 
			townPosition[] = {10966.5,13435.3,0}; 
			lampsAmount = 10; 
		}; 
		class city_19 { 
			townName = 'Териса'; 
			townPosition[] = {10618.9,12237.3,0}; 
			lampsAmount = 10; 
		}; 
		class city_20 { 
			townName = 'Парос'; 
			townPosition[] = {20885.4,16958.8,0}; 
			lampsAmount = 10; 
		}; 
		class city_21 { 
			townName = 'Калохори'; 
			townPosition[] = {21351.6,16361.9,0}; 
			lampsAmount = 10; 
		}; 
		class city_23 { 
			townName = 'Айос-Дионисиос'; 
			townPosition[] = {9187.95,15947.8,0}; 
			lampsAmount = 10; 
		}; 
		class city_24 { 
			townName = 'Галати'; 
			townPosition[] = {10270.3,19036,0}; 
			lampsAmount = 6; 
		}; 
		class city_25 { 
			townName = 'Зарос'; 
			townPosition[] = {9091.81,11961.9,0}; 
			lampsAmount = 10; 
		}; 
		class city_26 { 
			townName = 'Сирта'; 
			townPosition[] = {8625.13,18301.6,0}; 
			lampsAmount = 6; 
		}; 
		class city_28 { 
			townName = 'Тополия'; 
			townPosition[] = {7375.81,15429.5,0}; 
			lampsAmount = 7; 
		}; 
		class city_33 { 
			townName = 'Селакано'; 
			townPosition[] = {20769.8,6736.46,0}; 
			lampsAmount = 9; 
		}; 
		class city_35 { 
			townName = 'Панохори'; 
			townPosition[] = {5033.31,11245.2,0}; 
			lampsAmount = 10; 
		}; 
		class city_36 { 
			townName = 'Айос-Константинос'; 
			townPosition[] = {3948.77,17277.8,0}; 
			lampsAmount = 10; 
		}; 
		class city_37 { 
			townName = 'Аггелохори'; 
			townPosition[] = {3687.78,13776.1,0}; 
			lampsAmount = 10; 
		}; 
		class city_38 { 
			townName = 'Нери'; 
			townPosition[] = {4116.11,11736.1,0}; 
			lampsAmount = 10; 
		}; 
		class city_39 { 
			townName = 'София'; 
			townPosition[] = {25680.5,21365.1,0}; 
			lampsAmount = 10; 
		};
	};
/*

finalText = "";
{
	_towns = nearestObjects [getpos _x, ["Land_i_Addon_02_V1_F","Land_Metal_Shed_F","Land_u_Addon_01_V1_F","Land_Slum_House03_F"], 1000];
	if (count _towns > 5) then {

		finalText = finalText + format ["
\\class city_%1 {
\\\townName = '%2';
\\\townPosition[] = %3;
\\\housesAmount = %4;
\\};",_forEachIndex,text _x,format["{%1,%2,0}",(position _x)#0,(position _x)#1],str (count _towns)]
	};
} foreach nearestLocations [[worldSize/2, worldSize/2], ["NameCity","NameVillage"], worldSize];
finalText

*/
	class dcleanerTowns {
		class city_0 { 
			townName = 'Телос'; 
			townPosition[] = {16207,17296.7,0}; 
			housesAmount = 17; 
		}; 
		class city_1 { 
			townName = 'Гравия'; 
			townPosition[] = {14479.8,17614.3,0}; 
			housesAmount = 58; 
		}; 
		class city_2 { 
			townName = 'Ставрос'; 
			townPosition[] = {12950.1,15041.6,0}; 
			housesAmount = 68; 
		}; 
		class city_3 { 
			townName = 'Харкия'; 
			townPosition[] = {18049.1,15264.1,0}; 
			housesAmount = 41; 
		}; 
		class city_4 { 
			townName = 'Неохори'; 
			townPosition[] = {12502,14337,0}; 
			housesAmount = 63; 
		}; 
		class city_5 { 
			townName = 'Лакка'; 
			townPosition[] = {12282,15732.3,0}; 
			housesAmount = 39; 
		}; 
		class city_6 { 
			townName = 'Родополи'; 
			townPosition[] = {18753.4,16597.1,0}; 
			housesAmount = 39; 
		}; 
		class city_7 { 
			townName = 'Каталаки'; 
			townPosition[] = {11701.1,13672.1,0}; 
			housesAmount = 66; 
		}; 
		class city_8 { 
			townName = 'Нифи'; 
			townPosition[] = {19473.3,15453.7,0}; 
			housesAmount = 8; 
		}; 
		class city_9 { 
			townName = 'Аликампос'; 
			townPosition[] = {11112.6,14573.7,0}; 
			housesAmount = 35; 
		}; 
		class city_10 { 
			townName = 'Дорида'; 
			townPosition[] = {19336.9,13252.3,0}; 
			housesAmount = 17; 
		}; 
		class city_11 { 
			townName = 'Айос-Петрос'; 
			townPosition[] = {19339.4,17641.6,0}; 
			housesAmount = 6; 
		}; 
		class city_12 { 
			townName = 'Корони'; 
			townPosition[] = {11786.7,18372.4,0}; 
			housesAmount = 6; 
		}; 
		class city_13 { 
			townName = 'Полиакко'; 
			townPosition[] = {10966.5,13435.3,0}; 
			housesAmount = 58; 
		}; 
		class city_14 { 
			townName = 'Ифестиона'; 
			townPosition[] = {12787,19679.3,0}; 
			housesAmount = 8; 
		}; 
		class city_16 { 
			townName = 'Орино'; 
			townPosition[] = {10410.4,17243.1,0}; 
			housesAmount = 11; 
		}; 
		class city_17 { 
			townName = 'Фрини'; 
			townPosition[] = {14612.5,20786.7,0}; 
			housesAmount = 15; 
		}; 
		class city_19 { 
			townName = 'Териса'; 
			townPosition[] = {10618.9,12237.3,0}; 
			housesAmount = 42; 
		}; 
		class city_20 { 
			townName = 'Парос'; 
			townPosition[] = {20885.4,16958.8,0}; 
			housesAmount = 120; 
		}; 
		class city_21 { 
			townName = 'Калохори'; 
			townPosition[] = {21351.6,16361.9,0}; 
			housesAmount = 108; 
		}; 
		class city_22 { 
			townName = 'Халкея'; 
			townPosition[] = {20194.6,11660.7,0}; 
			housesAmount = 31; 
		}; 
		class city_23 { 
			townName = 'Айос-Дионисиос'; 
			townPosition[] = {9187.95,15947.8,0}; 
			housesAmount = 56; 
		}; 
		class city_24 { 
			townName = 'Галати'; 
			townPosition[] = {10270.3,19036,0}; 
			housesAmount = 32; 
		}; 
		class city_25 { 
			townName = 'Зарос'; 
			townPosition[] = {9091.81,11961.9,0}; 
			housesAmount = 92; 
		}; 
		class city_26 { 
			townName = 'Сирта'; 
			townPosition[] = {8625.13,18301.6,0}; 
			housesAmount = 14; 
		}; 
		class city_27 { 
			townName = 'Абдера'; 
			townPosition[] = {9425.42,20284,0}; 
			housesAmount = 19; 
		}; 
		class city_28 { 
			townName = 'Тополия'; 
			townPosition[] = {7375.81,15429.5,0}; 
			housesAmount = 13; 
		}; 
		class city_29 { 
			townName = 'Панагия'; 
			townPosition[] = {20490.2,8907.12,0}; 
			housesAmount = 23; 
		}; 
		class city_30 { 
			townName = 'Иоаннина'; 
			townPosition[] = {23199.7,19986.6,0}; 
			housesAmount = 19; 
		}; 
		class city_31 { 
			townName = 'Дельфинаки'; 
			townPosition[] = {23908.6,20144.7,0}; 
			housesAmount = 12; 
		}; 
		class city_32 { 
			townName = 'Ферес'; 
			townPosition[] = {21640.7,7583.93,0}; 
			housesAmount = 23; 
		}; 
		class city_33 { 
			townName = 'Селакано'; 
			townPosition[] = {20769.8,6736.46,0}; 
			housesAmount = 37; 
		}; 
		class city_35 { 
			townName = 'Панохори'; 
			townPosition[] = {5033.31,11245.2,0}; 
			housesAmount = 58; 
		}; 
		class city_36 { 
			townName = 'Айос-Константинос'; 
			townPosition[] = {3948.77,17277.8,0}; 
			housesAmount = 20; 
		}; 
		class city_37 { 
			townName = 'Аггелохори'; 
			townPosition[] = {3687.78,13776.1,0}; 
			housesAmount = 156; 
		}; 
		class city_38 { 
			townName = 'Нери'; 
			townPosition[] = {4116.11,11736.1,0}; 
			housesAmount = 85; 
		}; 
		class city_39 { 
			townName = 'София'; 
			townPosition[] = {25680.5,21365.1,0}; 
			housesAmount = 55; 
		}; 
		class city_40 { 
			townName = 'Ореокастро'; 
			townPosition[] = {4560.45,21460.6,0}; 
			housesAmount = 11; 
		}; 
		class city_41 { 
			townName = 'Молос'; 
			townPosition[] = {26943.9,23170.7,0}; 
			housesAmount = 49; 
		};
	};
/*

finalText = "";
{
	_towns = nearestObjects [getpos _x, ["Land_i_Stone_Shed_V1_F","Land_Metal_Shed_F","Land_Slum_House02_F"], 1000];
	if (count _towns > 5) then {

		finalText = finalText + format ["
\\class city_%1 {
\\\townName = '%2';
\\\townPosition[] = %3;
\\\housesAmount = %4;
\\};",_forEachIndex,text _x,format["{%1,%2,0}",(position _x)#0,(position _x)#1],str (count _towns)]
	};
} foreach nearestLocations [[worldSize/2, worldSize/2], ["NameCity","NameVillage"], worldSize];
finalText

*/
	class dcourrierTowns {
		class city_0 { 
			townName = 'Телос'; 
			townPosition[] = {16207,17296.7,0}; 
			housesAmount = 19; 
		}; 
		class city_1 { 
			townName = 'Гравия'; 
			townPosition[] = {14479.8,17614.3,0}; 
			housesAmount = 56; 
		}; 
		class city_2 { 
			townName = 'Ставрос'; 
			townPosition[] = {12950.1,15041.6,0}; 
			housesAmount = 62; 
		}; 
		class city_3 { 
			townName = 'Харкия'; 
			townPosition[] = {18049.1,15264.1,0}; 
			housesAmount = 95; 
		}; 
		class city_4 { 
			townName = 'Неохори'; 
			townPosition[] = {12502,14337,0}; 
			housesAmount = 32; 
		}; 
		class city_5 { 
			townName = 'Лакка'; 
			townPosition[] = {12282,15732.3,0}; 
			housesAmount = 50; 
		}; 
		class city_6 { 
			townName = 'Родополи'; 
			townPosition[] = {18753.4,16597.1,0}; 
			housesAmount = 67; 
		}; 
		class city_7 { 
			townName = 'Каталаки'; 
			townPosition[] = {11701.1,13672.1,0}; 
			housesAmount = 40; 
		}; 
		class city_8 { 
			townName = 'Нифи'; 
			townPosition[] = {19473.3,15453.7,0}; 
			housesAmount = 27; 
		}; 
		class city_9 { 
			townName = 'Аликампос'; 
			townPosition[] = {11112.6,14573.7,0}; 
			housesAmount = 38; 
		}; 
		class city_10 { 
			townName = 'Дорида'; 
			townPosition[] = {19336.9,13252.3,0}; 
			housesAmount = 63; 
		}; 
		class city_11 { 
			townName = 'Айос-Петрос'; 
			townPosition[] = {19339.4,17641.6,0}; 
			housesAmount = 34; 
		}; 
		class city_12 { 
			townName = 'Корони'; 
			townPosition[] = {11786.7,18372.4,0}; 
			housesAmount = 19; 
		}; 
		class city_13 { 
			townName = 'Полиакко'; 
			townPosition[] = {10966.5,13435.3,0}; 
			housesAmount = 32; 
		}; 
		class city_14 { 
			townName = 'Ифестиона'; 
			townPosition[] = {12787,19679.3,0}; 
			housesAmount = 26; 
		}; 
		class city_15 { 
			townName = 'Айя-Триада'; 
			townPosition[] = {16668.5,20487,0}; 
			housesAmount = 12; 
		}; 
		class city_16 { 
			townName = 'Орино'; 
			townPosition[] = {10410.4,17243.1,0}; 
			housesAmount = 31; 
		}; 
		class city_17 { 
			townName = 'Фрини'; 
			townPosition[] = {14612.5,20786.7,0}; 
			housesAmount = 39; 
		}; 
		class city_18 { 
			townName = 'Экали'; 
			townPosition[] = {17059.7,9992.32,0}; 
			housesAmount = 15; 
		}; 
		class city_19 { 
			townName = 'Териса'; 
			townPosition[] = {10618.9,12237.3,0}; 
			housesAmount = 21; 
		}; 
		class city_20 { 
			townName = 'Парос'; 
			townPosition[] = {20885.4,16958.8,0}; 
			housesAmount = 121; 
		}; 
		class city_21 { 
			townName = 'Калохори'; 
			townPosition[] = {21351.6,16361.9,0}; 
			housesAmount = 110; 
		}; 
		class city_22 { 
			townName = 'Халкея'; 
			townPosition[] = {20194.6,11660.7,0}; 
			housesAmount = 40; 
		}; 
		class city_23 { 
			townName = 'Айос-Дионисиос'; 
			townPosition[] = {9187.95,15947.8,0}; 
			housesAmount = 49; 
		}; 
		class city_24 { 
			townName = 'Галати'; 
			townPosition[] = {10270.3,19036,0}; 
			housesAmount = 33; 
		}; 
		class city_25 { 
			townName = 'Зарос'; 
			townPosition[] = {9091.81,11961.9,0}; 
			housesAmount = 42; 
		}; 
		class city_26 { 
			townName = 'Сирта'; 
			townPosition[] = {8625.13,18301.6,0}; 
			housesAmount = 35; 
		}; 
		class city_27 { 
			townName = 'Абдера'; 
			townPosition[] = {9425.42,20284,0}; 
			housesAmount = 16; 
		}; 
		class city_28 { 
			townName = 'Тополия'; 
			townPosition[] = {7375.81,15429.5,0}; 
			housesAmount = 40; 
		}; 
		class city_29 { 
			townName = 'Панагия'; 
			townPosition[] = {20490.2,8907.12,0}; 
			housesAmount = 21; 
		}; 
		class city_30 { 
			townName = 'Иоаннина'; 
			townPosition[] = {23199.7,19986.6,0}; 
			housesAmount = 27; 
		}; 
		class city_31 { 
			townName = 'Дельфинаки'; 
			townPosition[] = {23908.6,20144.7,0}; 
			housesAmount = 17; 
		}; 
		class city_32 { 
			townName = 'Ферес'; 
			townPosition[] = {21640.7,7583.93,0}; 
			housesAmount = 21; 
		}; 
		class city_33 { 
			townName = 'Селакано'; 
			townPosition[] = {20769.8,6736.46,0}; 
			housesAmount = 28; 
		}; 
		class city_35 { 
			townName = 'Панохори'; 
			townPosition[] = {5033.31,11245.2,0}; 
			housesAmount = 60; 
		}; 
		class city_36 { 
			townName = 'Айос-Константинос'; 
			townPosition[] = {3948.77,17277.8,0}; 
			housesAmount = 28; 
		}; 
		class city_37 { 
			townName = 'Аггелохори'; 
			townPosition[] = {3687.78,13776.1,0}; 
			housesAmount = 79; 
		}; 
		class city_38 { 
			townName = 'Нери'; 
			townPosition[] = {4116.11,11736.1,0}; 
			housesAmount = 69; 
		}; 
		class city_39 { 
			townName = 'София'; 
			townPosition[] = {25680.5,21365.1,0}; 
			housesAmount = 56; 
		}; 
		class city_40 { 
			townName = 'Ореокастро'; 
			townPosition[] = {4560.45,21460.6,0}; 
			housesAmount = 20; 
		}; 
		class city_41 { 
			townName = 'Молос'; 
			townPosition[] = {26943.9,23170.7,0}; 
			housesAmount = 48; 
		};
	};
};