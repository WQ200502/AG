/*

	Выдача боевой техники (для копов или кого угодно на рестарт)

	class уникальная_переменная {
		displayName = "Машина убийств"; //Отображаемое имя
		vehicleClass = "B_Heli_Transport_01_F"; //класс техники
		color = ""; //цвет, если он есть (из LifeCfgVehTextures)
		conditions = "life_coplevel > 10"; //условие
		conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 11+"; //сообщение, выдаваемое при несоблюдении
		maximum = 1; //сколько единиц техники можно достать за 1 рестарт
	}

*/

class LifeCfgBattleVehicles {
	class cop_gh {
		displayName = "UH-80 Ghost Hawk";
		vehicleClass = "B_Heli_Transport_01_F";
		color = "";
		conditions = "life_coplevel > 15";
		conditionsMessage = "Ваш ранг не позволяет достать боевую технику. Необходим уровень 15+";
		maximum = 2;
	};
	
};