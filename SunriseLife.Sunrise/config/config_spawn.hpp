/*

	displayName = Отображаемое название
	spawnMarker = имя маркера на карте
	icon = полный путь к иконке
	conditions = требования, необходимые для спауна на этой точке (не забыть (life_firstTime OR life_newLife))

*/
class LifeCfgSpawnPoints {
	class Sunrise {
		class Kavala {
			displayName = "Кавала";
			spawnMarker = "spawn_kavala";
			icon = "\sunrise_pack\icons\city.paa";
			conditions = "(life_firstTime OR life_newLife) AND !(life_copDuty OR life_medDuty)";
		};
		class Pirgos {
			displayName = "Пиргос";
			spawnMarker = "spawn_pirgos";
			icon = "\sunrise_pack\icons\city.paa";
			conditions = "(life_firstTime OR life_newLife) AND !(life_copDuty OR life_medDuty)";
		};
		class Atira {
			displayName = "Атира";
			spawnMarker = "spawn_atira";
			icon = "\sunrise_pack\icons\city.paa";
			conditions = "(life_firstTime OR life_newLife) AND !(life_copDuty OR life_medDuty)";
		};
		class Sofia {
			displayName = "София";
			spawnMarker = "spawn_sofi";
			icon = "\sunrise_pack\icons\city.paa";
			conditions = "(life_firstTime OR life_newLife) AND !(life_copDuty OR life_medDuty)";
		};		
		///COP
		class pd_main {
			displayName = "Полицейский участок";
			spawnMarker = "spawn_pd";
			icon = "\sunrise_pack\icons\base.paa";
			conditions = "(life_firstTime OR life_newLife) AND life_copDuty";
		};
		///sobr
		class swat_spawn {
			displayName = "База S.W.A.T";
			spawnMarker = "swat_spawn";
			icon = "\sunrise_pack\icons\base.paa";
			conditions = "(life_firstTime OR life_newLife) AND (life_coplevel > 16 && life_copDuty)";
		};
		///KPP
		class pd_atira {
			displayName = "Участок г.Атира";
			spawnMarker = "pd_atira";
			icon = "\sunrise_pack\icons\base.paa";
			conditions = "(life_firstTime OR life_newLife) AND (life_coplevel > 1 && life_copDuty)";
		};
		
		//MED
		class med_main {
			displayName = "Больница г.Кавалы";
			spawnMarker = "med_main";
			icon = "\sunrise_pack\icons\base.paa";
			conditions = "(life_firstTime OR life_newLife) AND life_medDuty";
		};
		class med_atira {
			displayName = "Больница г.Атиры";
			spawnMarker = "med_atira";
			icon = "\sunrise_pack\icons\base.paa";
			conditions = "(life_firstTime OR life_newLife) AND life_medDuty";
		};
		
		
		//GANGS
		class psycho_spawn {
			displayName = "База Psychokids";
			spawnMarker = "psycho_spawn";
			icon = "\sunrise_pack\icons\base.paa";
			conditions = "(life_firstTime OR life_newLife) AND 'psycho' in life_licenses";
		};
	};
};